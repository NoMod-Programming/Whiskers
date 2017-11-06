
!ScratchMenuItemMorph methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 14:26'!
minWidth

	| subMenuWidth iconWidth markerWidth |
	subMenuWidth := self hasSubMenu
		ifTrue: [ 10 ]
		ifFalse: [ 0 ].
	iconWidth := self hasIcon
		ifTrue: [ self icon width + 2 ]
		ifFalse: [ 0 ].
	markerWidth := self hasMarker
		ifTrue: [ self submorphBounds width + 8 ]
		ifFalse: [ 0 ].
	^(self fontToUse widthOfString: contents)
		+ subMenuWidth + iconWidth + markerWidth + self stringMargin + self leftMargin + self rightMargin! !
