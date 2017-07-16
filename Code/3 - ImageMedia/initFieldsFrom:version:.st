
!ImageMedia methodsFor: 'object i/o' stamp: 'EMP 7/16/2017 15:24'!
initFieldsFrom: anObjStream version: classVersion

	| f |
	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		form
		rotationCenter 
	) from: anObjStream.

	(form isKindOf: ColorForm) ifTrue: [  "convert ColorForm to 32-bit color"
		f := Form extent: form extent depth: 32.
		form displayOn: f.
		form := f].

	compositeForm := jpegBytes := nil.
	classVersion = 1 ifTrue: [^ self].

	"fields added in version 2"
	self initFieldsNamed: #(
		textBox
	) from: anObjStream.

	classVersion = 2 ifTrue: [^ self].

	"fields added in version 3"
	self initFieldsNamed: #(
		jpegBytes
	) from: anObjStream.
	jpegBytes ifNotNil: [form := ImageReadWriter formFromStream: jpegBytes readStream].

	classVersion = 3 ifTrue: [^ self].

	"fields added in version 4"
	self initFieldsNamed: #(
		compositeForm
	) from: anObjStream.

	classVersion = 4 ifTrue: [^ self].

	"fields added in version 5"
	self initFieldsNamed: #(
		svgForm
	) from: anObjStream.! !
