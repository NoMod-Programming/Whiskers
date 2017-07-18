
!ASN1AbstractString methodsFor: 'printing' stamp: 'rww 3/27/2007 11:19'!
, aString

	^ self class new
		string: self string, aString string;
		yourself
! !
