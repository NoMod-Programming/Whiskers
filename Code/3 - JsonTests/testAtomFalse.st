
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/16/2005 23:42'!
testAtomFalse
	self json: 'false' equals: false.
	self json: '  false' equals: false.
	self json: 'false  ' equals: false.
	self json: '  false  ' equals: false.
! !
