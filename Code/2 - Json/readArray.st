
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:08'!
readArray
	| a |
	self skipWhitespace.
	(stream peekFor: $]) ifTrue: [ ^ #() ].	
	a := OrderedCollection new.
	[
		a add: self readAny.
		self skipWhitespace.
		(stream peekFor: $]) ifTrue: [ ^ a asArray].
		(stream peekFor: $, ) ifFalse: [JsonInvalidError signal: 'Missing comma'].
	] repeat.
! !
