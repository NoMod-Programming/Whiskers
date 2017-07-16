
!ScratchTabMorph methodsFor: 'accessing' stamp: 'EMP 7/14/2017 16:21'!
updateTranslation
	translatedLabel := ScratchTranslator translationFor: label.
	self changed.
	self width: ((ScratchFrameMorph getFont: #Tab) widthOfString: translatedLabel) + 20! !
