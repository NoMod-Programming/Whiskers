
!ScriptableScratchMorph methodsFor: 'initialization' stamp: 'EMP 11/5/2017 18:08'!
initialize

	super initialize.
	objName := self nextInstanceName.
	vars := ScratchVariableDictionary new.
	lists := Dictionary new.
	blocksBin := ScratchScriptsMorph new.
	isClone := false.  "no users of cloning in current sytem"
	costume := self defaultImageMedia.
	media := OrderedCollection new.
	costumeChangeMSecs := 0.
	visibility := 100.
	volume := 100.
	tempoBPM := 60.
	sceneStates := Dictionary new.
! !
