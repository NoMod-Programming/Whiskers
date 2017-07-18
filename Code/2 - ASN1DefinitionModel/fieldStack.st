
!ASN1DefinitionModel methodsFor: 'accessing' stamp: 'RJT 9/7/2006 15:39'!
fieldStack
	"Answer the value of fieldStack"

	^ fieldStack ifNil: [fieldStack := Stack new].! !
