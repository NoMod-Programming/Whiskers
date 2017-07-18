
!ASN1Module methodsFor: 'services' stamp: 'rww 4/12/2007 13:20'!
find: aSymbol
	"check the following sources:
		- ASN1Type subclasses
		- my definitions
		- import definitions
	otherwise create a ASN1TypeReference"

	| type |
	type := self primitiveTypeFind: aSymbol.
	type notNil ifTrue: [^ type].
	type := self localFind: aSymbol.
	type notNil ifTrue: [^ type].
	self imports 
		do: [:eachImportModule |
			type := eachImportModule localFind: aSymbol.
			type notNil ifTrue: [^ type]].
	^ ASN1TypeReference name: aSymbol in: self.
! !
