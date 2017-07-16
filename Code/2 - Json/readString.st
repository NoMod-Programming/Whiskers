
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:25'!
readString
	| s c |
	s := WriteStream on: ''.
	[
		c := stream next.
		c ifNil: [JsonIncompleteError signal: 'Incomplete read of JSON string'].
		c == $\
			ifTrue: [s nextPut: self interpretStringEscape.]
			ifFalse: [c == $" ifTrue: [^ s contents.].
					s nextPut: c]
	] repeat.! !
