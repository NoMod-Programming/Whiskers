
!ASN1Stream class methodsFor: 'class initialization' stamp: 'jrd 10/30/2008 19:45'!
initializeTagToTypeDispatchTable

	TagToTypeDispatchTable := Dictionary new.
	TagToTypeDispatchTable
"		at: 0 put: ASN1EndOfIndefiniteLengthType new;"
		at: 1 put: ASN1BooleanType new;
		at: 2 put: ASN1IntegerType new;
		at: 3 put: ASN1BitStringType new;
		at: 4 put: ASN1ByteArrayType new;
		at: 5 put: ASN1NullType new;
		at: 6 put: ASN1ObjectIdentifierType new;
		at: 12 put: ASN1StringType new;
		at: 16 put: ASN1SequenceType new;
		at: 17 put: ASN1SetType new;
		at: 19 put: ASN1PrintableStringType new;
		at: 20 put: ASN1TeletexStringType new;
		at: 22 put: ASN1IA5StringType new;
		at: 23 put: ASN1UTCTimeType new;
		at: 26 put: ASN1VisibleStringType new;
		at: 27 put: ASN1GeneralStringType new;
		at: 28 put: ASN1UniversalStringType new;
		at: 30 put: ASN1BMPStringType new;
		yourself.
! !
