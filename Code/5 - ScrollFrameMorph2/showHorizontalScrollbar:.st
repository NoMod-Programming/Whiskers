
!ScrollFrameMorph2 methodsFor: 'scrollbar visibility' stamp: 'EMP 7/16/2017 21:18'!
showHorizontalScrollbar: aBoolean
	"Show or hide my horizontal scrollbar."

	(owner isKindOf: ScratchViewerMorph) ifTrue: [^ self].
	aBoolean = (hScrollbar owner = self) ifTrue: [^ self].

	aBoolean
		ifTrue: [self addMorph: hScrollbar]
		ifFalse: [hScrollbar delete].

	self extent: self extent.
! !
