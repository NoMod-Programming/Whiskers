
!ASN1DefinitionModel methodsFor: 'accessing' stamp: 'RJT 9/2/2006 22:59'!
asn1DefinitionString
	"Answer the value of asn1DefinitionString"

	^ asn1DefinitionString ifNil: [asn1DefinitionString := self parseASN1DefinitionString. asn1DefinitionString]! !
