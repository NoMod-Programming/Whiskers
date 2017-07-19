
!ScrollFrameMorph methodsFor: 'accessing' stamp: 'jm 8/3/2003 10:48'!
contents: aMorph
	"Replace my contents morph. The argument can be any morph. Typically it is a BorderedMorph or a PasteUpMorph."

	contents ifNotNil: [contents delete].
	contents := aMorph.
	contents position: self topLeft + borderWidth.
	self addMorphBack: contents.
	self extent: self extent.
! !
