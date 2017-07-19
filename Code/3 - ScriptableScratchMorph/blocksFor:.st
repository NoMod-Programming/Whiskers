
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/18/2017 16:22'!
blocksFor: aCategory
	"Answer a collection of blocks for the given category. Mixed with the blocks are dash and tilde symbols (#- and #~) indicating where full and half spaces should be inserted when laying out the blocks."

	| blockColor blocksList category b |
	blockColor := ScratchViewerMorph colorForCategory: aCategory.
	blocksList := OrderedCollection new.
	category := nil.
	self class blockSpecs do: [:spec |
		((spec isString) and: [spec ~= #- and: [spec ~= #~]])
			ifTrue: [category := spec]
			ifFalse: [
				category = aCategory ifTrue: [
					(spec = #-) | (spec = #~)
						ifTrue: [blocksList addLast: spec]
						ifFalse: [
							(b := self blockFromSpec: spec color: blockColor) ifNotNil: [
								blocksList addLast: b]]]]].
	aCategory = 'More Blocks' ifTrue: [(blocksBin submorphs select: [:submorph | submorph isKindOf: ProcedureHatBlockMorph]) do: [:hatBlock | b _ self procBlockFromSpec: {hatBlock procedure asString. #s. #call} color: (ScratchViewerMorph colorForCategory: 'More Blocks'). blocksList addLast: b]]. 
	^ blocksList asArray! !
