
!ASN1UTCTimeType methodsFor: 'encoding' stamp: 'rww 10/16/2016 21:46'!
encodeValue: anObject withDERStream: derStream

	| yy mo dd hh mm ss utcDateTime |
	yy :=  anObject year asString copyFrom: 3 to: 4.
	mo :=  anObject month asString padLeftTo: 2 with: $0.
	dd :=  anObject dayOfMonth asString padLeftTo: 2 with: $0.
	hh :=  anObject hour asString padLeftTo: 2 with: $0.
	mm :=  anObject minute asString padLeftTo: 2 with: $0.
	ss :=  anObject seconds asString padLeftTo: 2 with: $0.
	utcDateTime := (yy, mo, dd, hh, mm, ss, 'Z') asByteArray.
	derStream nextPutAll: utcDateTime.

! !
