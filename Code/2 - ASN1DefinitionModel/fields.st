
!ASN1DefinitionModel methodsFor: 'accessing' stamp: 'RJT 9/6/2006 16:01'!
fields
	"Answer the value of fields"

	^ fields ifNil: [fields := self parseFieldNames. fields].! !
