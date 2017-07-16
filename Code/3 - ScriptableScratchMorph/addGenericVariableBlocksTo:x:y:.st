
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/13/2017 18:44'!
addGenericVariableBlocksTo: page x: x y: startY
	"Add the generic variable blocks to the given page starting at the given y offset. Answer the new y."

	| y vName stage block varBlocks |
	y := startY.

	"pick a default variable name"
	vName := nil.
	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.
	(stage notNil and: [stage hasVariables])
		ifTrue: [
			vName := stage varNames first]
		ifFalse: [
			self hasVariables ifFalse: [^ y].
			vName := self varNames first].

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

	(self blocksFor: 'Variables') do: [:b |
		b defaultArgs: (Array with: vName).
		varBlocks add: b].

	varBlocks do: [:b |
		b color: self variableBlockColor.
		page addMorph: (b position: x@y).
		y := b bottom + 3].

	^ y

! !
