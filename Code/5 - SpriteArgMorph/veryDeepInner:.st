
!SpriteArgMorph methodsFor: 'copying' stamp: 'EMP 7/17/2017 18:46'!
veryDeepInner: deepCopier
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

	super veryDeepInner: deepCopier.
	menuIconMorph := menuIconMorph veryDeepCopyWith: deepCopier.
	type := type.! !
