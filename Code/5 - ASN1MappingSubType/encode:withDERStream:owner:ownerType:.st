

!ASN1MappingSubType methodsFor: 'encoding' stamp: 'rww 3/28/2007 07:10'!

encode: anObject withDERStream: derStream owner: owner ownerType: ownerType



	^ self parent

		encode: (anObject perform: self accessor) 

		withDERStream: derStream 

		owner: owner 

		ownerType: ownerType

! !

