
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:20'!
skipWhitespace
	|c|
	[
		c := stream peek.
		c ifNil: [JsonIncompleteError signal: 'Expected JSON input'].
		c isSeparator
	] whileTrue: [stream next].
	self skipComment.! !
