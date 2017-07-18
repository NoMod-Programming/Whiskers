
!ScratchWorkpaneMorph methodsFor: 'layout' stamp: 'EMP 7/14/2017 16:32'!
fixLayout
	titlePane position: self topLeft + (2@6);
		width: workPane width + 2.
	workPane position: titlePane bottomLeft + (1@1).! !
