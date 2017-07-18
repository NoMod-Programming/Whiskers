
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/16/2005 23:36'!
testAtomTrue
	self json: 'true' equals: true.
	self json: '  true' equals: true.
	self json: 'true  ' equals: true.
	self json: '  true  ' equals: true.
! !
