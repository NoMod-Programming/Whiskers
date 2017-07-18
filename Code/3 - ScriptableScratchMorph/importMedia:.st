
!ScriptableScratchMorph methodsFor: 'media' stamp: 'EMP 7/16/2017 15:37'!
importMedia: fileName
	"Import a new image from a file and add it to my media."

	| fExt elList baseName fList isFirst |
	fExt := FileDirectory extensionFor: fileName asLowercase.

	elList := OrderedCollection new.

	(#(aif aiff wav mp3) includes: fExt) ifTrue: [
		baseName := self mediaNameFromFileName: fileName default: 'sound'.
		[elList addLast: (SoundMedia new loadFile: fileName)] ifError: [^ self]].

	(#(jpg jpeg gif bmp png svg) includes: fExt) ifTrue: [
		baseName := self
			mediaNameFromFileName: fileName
			default: self defaultImageMediaName.
		fList := OrderedCollection new.
		fExt = 'svg' ifTrue: [
			elList add: (ImageMedia new svgForm: (XMLDOMParser parseDocumentFrom: (FileStream oldFileNamed: fileName))).
		] ifFalse: [
		fExt = 'gif' 
			ifTrue: 
				[[fList := (AnimatedGIFReadWriter new on: (FileStream oldFileNamed: fileName)) allImages] ifError: [^ self]]
			ifFalse: 
				[[fList addLast: (Form fromFileNamed: fileName)] ifError: [^ self]].
		fList do: [:f | 
			elList addLast: (ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f))]]].

	elList isEmpty ifTrue: [^ self].  "unknown file type; ignore"

	isFirst := true.
	elList do: [:el | 
		el mediaName: (self unusedMediaNameFromBaseName: baseName).
		media addLast: el.
		isFirst ifTrue: [
			isFirst := false. 
			el isSound ifFalse: [self lookLikeCostumeNamed: el mediaName]]].
	
	self updateMediaCategory.
! !
