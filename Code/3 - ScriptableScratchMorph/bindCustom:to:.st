
!ScriptableScratchMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 14:46'!
bindCustom: oldSpec to: newSpec
	((ProcCallBlockMorph allInstances) select: [:m | m commandSpec = oldSpec]) do: [:block | block commandSpec: newSpec].! !
