
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:31'!
nextHexDigit
	| c |
	c := stream next.
	c ifNil: [JsonIncompleteError signal: 'Expecting hex digit'].
	c := c asUppercase.
	(c isDigit or: [c >= $A and: [c <= $F]]) ifTrue: [^ c].
	JsonInvalidError signal: 'Expected hex digit'.! !
