
!ScratchViewerMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 21:13'!
target: aScratchObject
	"Start viewing the given object, if not object, return an empty viewer."

	target := aScratchObject.
	aScratchObject ifNil: [
		^ self currentCategory: 'none'].

	"keep the same category selected, but update it"
	self refresh.

	self isInWorld ifTrue: [self world startSteppingSubmorphsOf: self].
! !
