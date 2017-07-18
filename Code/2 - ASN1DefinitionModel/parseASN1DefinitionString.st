
!ASN1DefinitionModel methodsFor: 'services parsing' stamp: 'RJT 9/2/2006 23:02'!
parseASN1DefinitionString
	"return the ans1definition argument string"
	| aPragma aCollection |
	aCollection := Pragma allNamed: #asn1Definition: in: self subject class.
	^ aCollection isEmpty
		ifFalse: [aPragma := aCollection first.
			aPragma arguments
				at: 1
				ifAbsent: []]! !
