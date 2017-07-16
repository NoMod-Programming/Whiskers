
!ScratchFrameMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 12:40'!
fixProjectTitleMorphLayout
 "make sure the project title is shown with ellipses if required"
	projectName ifNotNil: [
		projectTitleMorph contents: (projectTitleMorph stringWithEllipses: (self nameFromFileName: projectName) limitedToWidth: titlePane width - 100 )].
! !
