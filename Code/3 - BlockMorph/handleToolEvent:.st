
!BlockMorph methodsFor: 'event handling' stamp: 'EMP 7/13/2017 19:07'!
handleToolEvent: evt
	| hand myStack myOwner sFrame varToDelete |
	hand := evt hand.
		hand scratchToolType = #copyTool ifTrue: [
		evt shiftPressed ifFalse: [hand cancelScratchToolType].
		(owner isKindOf: ScratchBlockPaletteMorph) ifTrue: [^ self].  "ignore if in palette"
		^ self duplicate].

	hand scratchToolType = #cutTool ifTrue: [
		evt shiftPressed ifFalse: [hand cancelScratchToolType].
		(self topBlock owner isKindOf: ScratchScriptsMorph) ifTrue: [
			myStack  :=  self nextBlock.
			myOwner  :=  self owner.
			myStack ifNotNil: [
				(myOwner isCBlockMorph)
					ifTrue: [
						myStack privateOwner: nil. "temp horrible hack to separate the myStack from its owner"
						"copiedStack  :=  myStack shallowCopy.
						self topBlock owner addMorph: copiedStack."
						[myStack top > myOwner bottom] whileTrue: [
							myStack position: (myStack left)@(myStack top - 1).
							self world displayWorldSafely].
						"copiedStack delete."
						myOwner attachBlock: myStack]
					ifFalse: [
						(myOwner isKindOf: ScratchScriptsMorph)
							ifTrue: [myOwner addMorph: myStack]
							ifFalse: [
								myStack privateOwner: nil. "temp horrible hack to separate the myStack from its owner"
								"copiedStack  :=  myStack shallowCopy.
								(self topBlock owner) addMorph: copiedStack."
								[myStack top > myOwner bottom] whileTrue: [
									myStack position: (myStack left)@(myStack top - 1).
									self world displayWorldSafely].
								"copiedStack delete."
								myOwner attachBlock: myStack]]].

				self isReporter ifTrue: [self aboutToBeGrabbedBy: hand].
				ScratchFrameMorph putInClipboard: self.
				self delete.
				(myOwner isKindOf: ScratchScriptsMorph) ifTrue: [myOwner step].
				^ self]
		ifFalse: [
			sFrame  :=  self ownerScratchFrame.
			((owner isKindOf: ScratchBlockPaletteMorph) and:
			 [sFrame viewerPane currentCategory = 'Data']) ifTrue: [
				(self isSetterBlockMorph) ifTrue: [
					self variable ifNotNil: [
						varToDelete  :=  self variable.
						(self confirm: 'Really delete variable: ', varToDelete, '?') ifFalse: [^ self].
						self receiver deleteVariable: varToDelete]].
				(self isVariableBlockMorph) ifTrue: [
					varToDelete  :=  self commandSpec.
					(self confirm: 'Really delete variable: ', varToDelete, '?') ifFalse: [^ self].
					self receiver deleteVariable: varToDelete].
				((varToDelete notNil) and: [sFrame notNil]) ifTrue: [
					sFrame workPane deleteVariable: varToDelete.
					sFrame viewerPane categoryChanged: 'Data']]].
	^ self].

! !
