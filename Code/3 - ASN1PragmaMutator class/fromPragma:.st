
!ASN1PragmaMutator class methodsFor: 'instance creation' stamp: 'RJT 9/2/2006 15:26'!
fromPragma: aPragma
	^self new
		pragma: aPragma;
		asn1name: aPragma arguments first;
		method: aPragma method methodReference methodSymbol;
		systemClass: aPragma method methodReference classSymbol;
		classOfMutatorArgument: aPragma arguments second;
		yourself! !
