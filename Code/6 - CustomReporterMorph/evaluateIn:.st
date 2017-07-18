
!CustomReporterMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:36'!
evaluateIn: t1 
	t1 returnValueToParentFrame: (t1 getArgumentOrNil: self selector).
	t1 popStackFrameNoUnhightlight.
^ false! !
