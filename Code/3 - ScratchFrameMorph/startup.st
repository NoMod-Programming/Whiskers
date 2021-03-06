
!ScratchFrameMorph methodsFor: 'startup' stamp: 'EMP 7/17/2017 23:17'!
startup

	| startupFileNames fileName arg |
	ScriptableScratchMorph randomInit.
	ScratchTranslator setLanguage: 'en'. "make sure all font and rendering basics are set to defaults"
	ScratchTranslator importLanguagesList.

	ScratchFrameMorph readShareServerEntry.
	StartupPresentationMode := TakeOverScreen := false.
	self processSettingsFile. "may change the language settings"
	self readDefaultNotes.

	self updateProjectName.
	shuffledCostumeNames := nil.
	author := ''.
	loginName := ''.
	loginPassword := ''.
	justSaved := true.

	startupFileNames := OrderedCollection new.
	2 to: 10 do: [:i |
		arg := Smalltalk getSystemAttribute: i.
		(arg notNil and: [arg size > 0]) ifTrue: [
			startupFileNames addLast: (ScratchPlugin primShortToLongPath: arg)]].

	startupFileNames do: [:n |
		(n asLowercase = 'presentation') ifTrue: [StartupPresentationMode := true].
		(n asLowercase = 'fullscreen') ifTrue: [TakeOverScreen := true]].

	TakeOverScreen ifTrue: [Project current fullScreenOn].

	self enterQuarterModeIfSmallScreen.

	fileName := startupFileNames
		detect: [:fn |
			(fn asLowercase endsWith: '.sb') or: [(fn asLowercase endsWith: '.scratch') or: [fn asLowercase endsWith: '.sb2']]]
		ifNone: [nil].
	fileName ifNotNil: [
		StartupPresentationMode ifTrue: [Display fillColor: Color black].
		self openScratchProjectNamed: fileName.
		StartupPresentationMode ifTrue: [self enterPresentationMode; shoutGo].
		^ self].

	viewerPane currentCategory: 'Motion'.
	self setDefaultSprite.
	self updatePanes. "update panes before starting the new project to keep the justSaved flag state correct"
	self newScratchProject.

	fileName := startupFileNames
		detect: [:fn | fn asLowercase endsWith: '.sprite']
		ifNone: [^ self].

	"open a .sprite file"
	workPane submorphs do: [:m | (m isScratchSpriteMorph) ifTrue: [m deleteSprite]].
	self importSpriteOrProject: fileName.
! !
