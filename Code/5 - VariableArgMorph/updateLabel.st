
!VariableArgMorph methodsFor: 'stepping' stamp: 'EMP 11/5/2017 19:39'!
updateLabel
	"Update my label string."

	| s |
	s := ' '.
	(morph isScratchVariable) ifTrue: [s := morph varName].

	labelMorph contents = s ifFalse: [
		labelMorph contents: s.
		labelMorph position: self position + borderWidth + (3 @ -1).
		self extent: (labelMorph extent + (16@2) + borderWidth).
		menuIconMorph position: (self right - borderWidth - 10)@(self top + borderWidth + 4)].
! !
