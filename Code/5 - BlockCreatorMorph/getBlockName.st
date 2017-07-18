
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:58'!
getBlockName
	| label varNames |
	label _ ''.
	varNames _ OrderedCollection new.
	((self submorphs select: [:m | m isArgMorph]) collect: [:morph | morph evaluate]) do: [:m | (m first = #arg) ifTrue: [label _ label, ' ', ((m second) caseOf: {
		[#string] -> [varNames add: m third. ' %s '].
		[#boolean] -> [varNames add: m third. ' %b '].
		[#color] -> [varNames add: m third. ' %c '].
		[#number] -> [varNames add: m third. ' %n ']
		}
		otherwise: [varNames add: m third. ' ',(m fourth), ' ']
)] ifFalse: [label _ label, ((((m second copyReplaceAll: '\' with: '\\\\') copyReplaceAll: '/' with: '\/') copyReplaceAll: '%' with: '\\%') copyReplaceAll: '@' with: '\\@') asString]
].
^ {label. varNames asArray}! !
