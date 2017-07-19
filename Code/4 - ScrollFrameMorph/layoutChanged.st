
!ScrollFrameMorph methodsFor: 'geometry' stamp: 'tpr 8/2/2013 20:08'!
layoutChanged
	"If my contents morph's layout has changed, record that fact."

	super layoutChanged.
	contents ifNotNil:[contents mayNeedLayout ifTrue: [contentsChanged := true]]
! !
