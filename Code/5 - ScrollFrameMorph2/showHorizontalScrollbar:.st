
!ScrollFrameMorph2 methodsFor: 'scrollbar visibility' stamp: 'EMP 7/18/2017 17:59'!
showHorizontalScrollbar: aBoolean
	"Show or hide my horizontal scrollbar."

	"(owner isKindOf: ScratchViewerMorph) ifTrue: [^ self]."
	aBoolean = (hScrollbar owner = self) ifTrue: [^ self].

	aBoolean
		ifTrue: [self addMorph: hScrollbar]
		ifFalse: [hScrollbar delete].

	self extent: self extent.
! !
