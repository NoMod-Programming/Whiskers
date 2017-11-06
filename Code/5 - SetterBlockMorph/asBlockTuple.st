
!SetterBlockMorph methodsFor: 'private' stamp: 'EMP 11/5/2017 19:48'!
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	| result arg |
	result := Array with: #changeVariable with: self variable with: selector with: nil.

	arg := (argMorphs first isVariableArgMorph)
		ifTrue: [argMorphs last]
		ifFalse: [argMorphs first].

	(arg isArgMorph)
		ifTrue: [result at: 4 put: arg evaluate]
		ifFalse: [result at: 4 put: arg asBlockTuple].

	^ result

! !
