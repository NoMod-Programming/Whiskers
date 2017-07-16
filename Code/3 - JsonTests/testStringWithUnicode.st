
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 4/29/2016 11:27'!
testStringWithUnicode

	| unicodeString |
	unicodeString := (Unicode value: 16r263A) asString.
	self json: '"\u263A"' equals:unicodeString.
	self json: '"\u263a"' equals:unicodeString.
	self json: '"', unicodeString, '"' equals: unicodeString.
	self render: unicodeString equals: '"', unicodeString, '"'.! !
