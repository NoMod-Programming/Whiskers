
!SetterBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/16/2017 19:23'!
initSetterForVar: varName
	<pragma: #i18nIssue>

	self commandSpec: (ScratchTranslator translationFor: 'set %m.var to %n').
	argPermutation := CommandBlockMorph argPermutationForSpec: 'set %m.var to %n' withTranslation: commandSpec.
	self selector: #setVar:to:.
	self variable: varName.
! !
