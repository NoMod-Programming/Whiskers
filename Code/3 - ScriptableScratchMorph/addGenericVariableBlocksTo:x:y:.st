
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 11/5/2017 18:55'!
addGenericVariableBlocksTo: page x: x y: startY
	"Add the generic variable blocks to the given page starting at the given y offset. Answer the new y."

	| y vName stage block varBlocks |
	y := startY.

	"pick a default variable name"
	vName := nil.
	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.
	(stage notNil and: [stage hasVariables])
		ifTrue: [
			vName := stage vars anyOne]
		ifFalse: [
			self hasVariables ifFalse: [^ y].
			vName := self vars anyOne].

	varBlocks := OrderedCollection new.
	block := SetterBlockMorph new
		initSetterForVar: vName;
		receiver: self blockReceiver.
	block expressionArg stringExpression: '0'.
	varBlocks add: block.

	block := SetterBlockMorph new
		initChangerForVar: vName;
		receiver: self blockReceiver.
	block expressionArg numExpression: '1'.
	varBlocks add: block.

	(self blocksFor: 'Data') do: [:b |
		b defaultArgs: (Array with: vName varName).
		varBlocks add: b].

	varBlocks do: [:b |
		b color: self variableBlockColor.
		page addMorph: (b position: x@y).
		y := b bottom + 3].

	^ y

! !
