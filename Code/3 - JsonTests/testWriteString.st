
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/21/2009 22:55'!
testWriteString
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} as: String) equals: '"a\nb"'.
	self render: ({$a. Character value: 4. $b} as: String) equals: '"a\u0004b"'.! !
