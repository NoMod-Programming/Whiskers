
!ASN1PragmaMutator methodsFor: 'printing' stamp: 'RJT 9/2/2006 15:30'!
printOn: aWS
	| classString article |
	classString := self classOfMutatorArgument asString.
	article := classString first isVowel ifTrue: [' an '] ifFalse: [' a '].
	aWS nextPutAll: self asn1name asString, String tab, self systemClass asString, '>>', self method asString, article, classString.! !
