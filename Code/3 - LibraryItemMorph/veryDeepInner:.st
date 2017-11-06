
!LibraryItemMorph methodsFor: 'copying' stamp: 'EMP 11/3/2017 20:40'!
veryDeepInner: deepCopier
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

	super veryDeepInner: deepCopier.
	"target := target.		Weakly copied"
	thumbnailMorph := thumbnailMorph veryDeepCopyWith: deepCopier.
	nameMorph := nameMorph veryDeepCopyWith: deepCopier.
	scriptCountMorph := scriptCountMorph veryDeepCopyWith: deepCopier.
	"isSelected := isSelected.		Weakly copied"
	"rolloverOn := rolloverOn.		Weakly copied"
	"lastUpdateMSecs := lastUpdateMSecs.		Weakly copied"
	thumbWidth := thumbWidth veryDeepCopyWith: deepCopier.
	! !
