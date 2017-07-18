
!CommandBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 17:07'!
isStop

	^ (selector = #stopScripts and: [(argMorphs first choice beginsWith: 'other scripts' )not]) | (selector = #deleteClone)! !
