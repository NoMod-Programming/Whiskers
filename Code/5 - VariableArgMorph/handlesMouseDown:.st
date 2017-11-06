
!VariableArgMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 18:16'!
handlesMouseDown: evt

	^ evt hand scratchToolType isNil and:
		[(self topRight - (14@0)"presumably this magic number is inteneded to reflect the menu button on the right of the morph?" corner: self bottomRight) containsPoint: evt cursorPoint]
! !
