
!ScratchTabPaneMorph methodsFor: 'accessing' stamp: 'EMP 7/14/2017 16:09'!
currentTab: aString

	currentTab := aString.
	self targetPane ifNil: [^ self].

	(targetPane target isKindOf: ScratchStageMorph)
		ifTrue: [self setLabelForTab: 'Costumes' to: 'Backgrounds']
		ifFalse: [self setLabelForTab: 'Costumes' to: 'Costumes'].

	self lightUpCurrentTab.
	targetPane currentCategory: aString.
! !
