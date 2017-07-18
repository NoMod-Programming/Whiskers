
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 11/29/2005 18:03'!
json: aString equals: aValue
	| readValue |
	readValue := self readFrom: aString.
	self assert: readValue = aValue.! !
