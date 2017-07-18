
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/17/2005 09:10'!
testAtomNumber
	self json: '1' equals: 1.
	self json: '0123' equals: 123.
	self json: '1.23e2' equals: 123.
	self json: '-1' equals: -1.
	self json: '-0' equals: 0.
	self json: '[-1.2]' equals: #(-1.2).! !
