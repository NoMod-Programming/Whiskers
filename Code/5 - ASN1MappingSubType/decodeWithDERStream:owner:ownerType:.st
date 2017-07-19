

!ASN1MappingSubType methodsFor: 'decoding' stamp: 'rww 3/28/2007 07:07'!

decodeWithDERStream: derStream owner: owner ownerType: ownerType



	| target val |

	target := self mapping new.

	val := self parent

		decodeWithDERStream: derStream 

		owner: owner 

		ownerType: ownerType.

	target perform: self mutator with: val.

	^ target

! !

