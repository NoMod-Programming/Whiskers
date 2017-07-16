
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 4/29/2016 11:27'!
testInvalidUnicodeEscapes
	self assertInvalidJson: '"\u26"'. "Note that naively reading four chars runs off the end here, so we might see JsonIncompleteError, which would be wrong."
	self assertInvalidJson: '"\u2Z"'.
	self assertInvalidJson: '"\u2Z44"'.! !
