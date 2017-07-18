
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 09:47'!
asBlockTuple
	^ {#procDef. spec. (self findArgs). (self defaultNames). isAtomic}! !
