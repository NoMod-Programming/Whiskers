
!ScratchFrameMorph methodsFor: 'private' stamp: 'EMP 7/13/2017 14:20'!
setLanguage: aString
	"Set my language and update my blocks."

	| tempJustSaved |
	<pragma: #i18nIssue>
	"if we're already using this language and the user is not asking for font scaling, change nothing. Saves 2 seconds on a Pi startup"
	((ScratchTranslator currentLanguageMatches: aString) and:[UserFontScale = 1]) ifTrue:[^self].
	
	tempJustSaved := justSaved.
	(workPane submorphs copyWith: workPane) do: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m convertStacksToTuples]].

	ScratchTranslator setLanguage: (ScratchTranslator isoCodeForName: aString).
	viewerPane relabelCategorySelectors.

	(workPane submorphs copyWith: workPane) do: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].
	self updatePanes.
	self
		view: scriptsPane target
		tab: scriptsPane tabPane currentTab
		category: viewerPane currentCategory.
	justSaved := tempJustSaved.
! !
