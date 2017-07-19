

!ASN1Stream methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:24'!

encode: anObject withType: type



	type encode: anObject withDERStream: self.

	^ self contents

! !

