
!ScratchTranslator class methodsFor: 'language translation' stamp: 'EMP 11/3/2017 20:35'!
labelPartsFor: aString
	"Answer a collection label strings for the translation of given block label. Currently handles one or two-part labels. In a two-part label, the label is split at the field name begginning with a percent sign. For example, 'when %s clicked' would yield the two label parts 'when' and 'clicked'."

	| s q result |
	<pragma: #i18nIssue> "copying paets of potential utf32 or utf8 strings"
	s := ScratchTranslator translationFor: aString.
	q := CommandBlockMorph parseCommandSpec: s.
	result := OrderedCollection new.
	q do: [:m |
		(CommandBlockMorph isArgSpec: m) ifFalse: [result add: m]
	].
	[result size < 2] whileTrue: [result add: '']. "Pad with empty strings"
	^ result! !
