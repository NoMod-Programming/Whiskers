
!VariableArgMorph methodsFor: 'copying' stamp: 'EMP 11/5/2017 18:16'!
veryDeepInner: deepCopier
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

	super veryDeepInner: deepCopier.
	menuIconMorph := menuIconMorph veryDeepCopyWith: deepCopier.
	type := type.! !
