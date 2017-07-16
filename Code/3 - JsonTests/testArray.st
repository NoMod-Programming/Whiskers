
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/16/2005 23:51'!
testArray
	self json: '[]' equals: #().
	self json: '[[]]' equals: #(#()).
	self json: '[[], []]' equals: #(#() #()).
	self json: '["hi", "there"]' equals: #('hi' 'there').
	self json: '[["a", "b", null]]' equals: #(('a' 'b' nil)).! !
