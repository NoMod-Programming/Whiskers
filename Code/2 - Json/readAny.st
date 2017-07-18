
!Json methodsFor: 'parsing' stamp: 'tonyg 4/29/2016 11:08'!
readAny
	"This is the main entry point for the JSON parser. See also readFrom: on the class side."
	| c |
	self skipWhitespace.
	c := stream peek asLowercase.
	c == ${ ifTrue: [stream next. ^ self readDictionary].
	c == $[ ifTrue: [stream next. ^ self readArray].
	c == $" ifTrue: [stream next. ^ self readString].
	c == $t ifTrue: [^ self consume: 'true' returning: true].
	c == $f ifTrue: [^ self consume: 'false' returning: false].
	c == $n ifTrue: [^ self consume: 'null' returning: nil].
	c == $@ ifTrue: [stream next. ^ self readConstructor].
	(Json numbersMayContain: c) ifTrue: [^ self readNumber].
	JsonInvalidError signal: 'Unknown Json input'! !
