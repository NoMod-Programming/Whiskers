
!ASN1DefinitionModel methodsFor: 'services verifying' stamp: 'RJT 9/2/2006 23:02'!
verifyFieldAccessorsAndMutators
	"check to see that the ans1 definition is represented by all the appropriate accessor and mutator definitions"
	| myAccessors myMutators |
	myAccessors := self getPragmaAccessors.
	myMutators := self getPragmaMutators.
	^self parseFieldNames allSatisfy: [:aField |
		(myAccessors anySatisfy: [:anAccessor | anAccessor asn1name = aField]) and: [
			(myMutators anySatisfy: [:aMutator | aMutator asn1name = aField])]].
		! !
