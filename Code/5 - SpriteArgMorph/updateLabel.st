
!SpriteArgMorph methodsFor: 'stepping' stamp: 'EMP 7/16/2017 19:00'!
updateLabel
	"Update my label string."

	| s |
	self checkForDeletedMorph.
	s := ' '.
	(morph isScriptableScratchMorph) ifTrue: [s := morph objName].
	(morph isString) ifTrue: [
		s := morph localized.
		morph = #mouse ifTrue: [s := 'mouse-pointer' localized].
		morph = #_random_ ifTrue: [s:= 'random position' localized].
		morph = #_myself_ ifTrue: [s := 'myself' localized]].

	labelMorph contents = s ifFalse: [
		labelMorph contents: s.
		labelMorph position: self position + borderWidth + (3 @ -1).
		self extent: (labelMorph extent + (16@2) + borderWidth).
		menuIconMorph position: (self right - borderWidth - 10)@(self top + borderWidth + 4)].
! !
