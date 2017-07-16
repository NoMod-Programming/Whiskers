
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 11/29/2005 17:58'!
testCtor
	self json: '@JsonDummyTestObject {"a": 1, "b": 2, "c": 3}' equals: self simpleDummyObject.
	self json: (Json render: self simpleDummyObject) equals: self simpleDummyObject.! !
