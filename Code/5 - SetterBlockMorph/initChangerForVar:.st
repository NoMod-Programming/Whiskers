
!SetterBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/16/2017 19:23'!
initChangerForVar: varName
	<pragma: #i18nIssue>

	self commandSpec: (ScratchTranslator translationFor: 'change %m.var by %n').
	argPermutation := CommandBlockMorph argPermutationForSpec: 'set %m.var to %n' withTranslation: commandSpec.
	self selector: #changeVar:by:.
	self variable: varName.
! !
