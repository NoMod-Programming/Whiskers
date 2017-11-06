
!ScriptableScratchMorph methodsFor: 'object i/o' stamp: 'EMP 11/5/2017 18:13'!
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		objName
		vars
		blocksBin
		isClone
		media
		costume
	) from: anObjStream.
	(vars isKindOf: ScratchVariableDictionary) ifFalse: [ | newVars |
		"Convert to new variable format"
		newVars := ScratchVariableDictionary new.
		vars keysAndValuesDo: [:key :value |
			newVars at: key put: value.
		].
		vars := newVars.
	]! !
