
!ScratchFrameMorph class methodsFor: 'scratch skin' stamp: 'EMP 7/14/2017 16:45'!
readSkinFrom: aDirectory
	"Read the Forms for my skin from the given directory and store them in myskin dictionary."
	"When in XO mode, entries in ScratchSkinXO override the corresponding entries in ScratchSkin."
	"self readSkinFrom: (FileDirectory default directoryNamed: 'ScratchSkin')"
	| dict img i xoDict |
	dict := Dictionary new.
	xoDict := Dictionary new.
	aDirectory fileNames do: [:f ||fn|
		fn := f.
		Cursor read showWhile: [
			img := [Form fromFileNamed: (aDirectory fullNameFor: fn)] ifError: [nil]].
		img ifNotNil: [
			i := fn findLast: [:c | c = $.].
			i = 0 ifFalse: [fn := fn copyFrom: 1 to: i - 1].
			(fn asLowercase endsWith: '_xo')
				ifTrue: [xoDict at: (fn copyFrom: 1 to: fn size - 3) asSymbol put: img]
				ifFalse: [dict at: fn asSymbol put: img]]].
	ScratchSkin := dict.
	ScratchSkinXO := xoDict.

	img := ScratchSkin at: #scriptsPaneTexture ifAbsent: [nil].
	(img notNil and: [img depth ~= 32]) ifTrue: [
		ScratchSkin at: #scriptsPaneTexture put: (img asFormOfDepth: 32)].
! !
