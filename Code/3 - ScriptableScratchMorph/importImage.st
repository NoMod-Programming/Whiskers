
!ScriptableScratchMorph methodsFor: 'media' stamp: 'EMP 7/16/2017 11:24'!
importImage
	"Import a new image from a file and add it to my media (concatenating the name if it is greater than 16 characters long). If the file is an animated gif, import all frames of the gif as separate costumes."

	| result el ext fList isFirst newName |
	<pragma: #i18nIssue>
	result :=  self importImageFileName.
	result = #cancelled ifTrue: [^ self].

	fList := OrderedCollection new.
	ext := FileDirectory extensionFor: result asLowercase.
	ext = 'svg' ifTrue: [
		"Svg reading code -EMP"
		el := ImageMedia new svgForm: (XMLDOMParser parseDocumentFrom: (FileStream oldFileNamed: result)).
		newName := self mediaNameFromFileName: result default: 'costume'.
		el mediaName: (self unusedMediaNameFromBaseName: newName).
		media addLast: el.
		self lookLikeCostumeNamed: el mediaName.
	]
	ifFalse: [
	ext = 'gif'
		ifTrue: [[fList := (AnimatedGIFReadWriter new on: (FileStream readOnlyFileNamed: result)) allImages] ifError: [^ self]]
		ifFalse: [[fList addLast: (Form fromFileNamed: result)] ifError: [^ self]].

	isFirst := true.
	fList do: [:f |
		el := ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f).
		newName := self mediaNameFromFileName: result default: 'costume'.
		el mediaName: (self unusedMediaNameFromBaseName:newName).
		media addLast: el.
		isFirst ifTrue: [isFirst := false. self lookLikeCostumeNamed: el mediaName.]].
	].

	self updateMediaCategory.
! !
