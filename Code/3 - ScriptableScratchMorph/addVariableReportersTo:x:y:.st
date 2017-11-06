
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 11/5/2017 18:38'!
addVariableReportersTo: page x: x y: startY
	"Add the list block reporters to the given page starting at the given y offset. Answer the new y."

	| y stage b watcherButton yOffset line line2 |
	y := startY.

	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.
	(stage notNil and: [stage ~= self]) ifTrue: [
		stage varNames do: [:vName |
			b := VariableBlockMorph new
				commandSpec: vName;
				receiver: stage blockReceiver;
				variable: vName.

			watcherButton := self createToggleButtonFor: b.
			yOffset := (b fullBounds height - watcherButton height) // 2.
			page addMorph: (watcherButton position: x @ (y + yOffset)).
			page addMorph: (b position: (x + watcherButton width + 4)@y).
			y := y + b height + 3].
		(self hasVariables) ifTrue: [
			line := Morph new.
			line
				extent: 140@1;
				color: ScratchFrameMorph borderColor;
				position: x@(y+2).
			line2 := Morph new.
			line2
				extent: 140@1;
				color: ScratchFrameMorph panelColor;
				position: x@(y+3).
			page
				addMorph: line;
				addMorph: line2.
			y := y + 9]].

	self varNames do: [:vName |
		b := VariableBlockMorph new
			commandSpec: vName;
			receiver: self blockReceiver;
			variable: vName.

		watcherButton := self createToggleButtonFor: b.
		yOffset := (b fullBounds height - watcherButton height) // 2.
		page addMorph: (watcherButton position: x @ (y + yOffset)).
		page addMorph: (b position: (x + watcherButton width + 4)@y).
		y := y + b height + 3].

	^ y
! !
