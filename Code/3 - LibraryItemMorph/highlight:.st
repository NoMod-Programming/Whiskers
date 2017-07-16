
!LibraryItemMorph methodsFor: 'accessing' stamp: 'EMP 7/14/2017 09:10'!
highlight: aBoolean

	isSelected = aBoolean ifTrue: [^ self].

	isSelected := aBoolean.
	isSelected
		ifTrue: [
			rolloverOn := false.].
	"scriptCountMorph color: labelColor darker."
	self changed.
! !
