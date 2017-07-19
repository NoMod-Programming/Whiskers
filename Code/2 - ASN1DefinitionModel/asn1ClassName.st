

!ASN1DefinitionModel methodsFor: 'accessing' stamp: 'RJT 9/2/2006 22:58'!

asn1ClassName

	"Answer the value of asn1ClassName"



	^ asn1ClassName ifNil: [asn1ClassName := self parseASN1ClassName. asn1ClassName]! !

