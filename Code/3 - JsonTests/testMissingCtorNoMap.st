
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 4/29/2016 11:10'!
testMissingCtorNoMap
	self 
		should: [Json new readFrom: '@Missing[]' readStream]
		raise: JsonInvalidError! !
