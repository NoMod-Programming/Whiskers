
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/16/2017 13:07'!
hatBlockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given variable reference tuple."

	| blockClass block eventName arg |
	blockClass := Smalltalk at: tuple first asSymbol.
	block := blockClass new scriptOwner: scriptOwner.

	blockClass = EventHatMorph ifTrue: [
		eventName := tuple at: 2.
		eventName = 'Scratch-StartClicked'
			ifTrue: [block forStartEvent; scriptOwner: scriptOwner]
			ifFalse: [block eventName: eventName]].

	blockClass = KeyEventHatMorph ifTrue: [
		block choice: (tuple at: 2)].

	blockClass = WhenHatBlockMorph ifTrue: [
		(tuple at: 2) ~= false ifTrue: [
			arg := self blockFromTuple: (tuple at: 2) receiver: scriptOwner.
			block replaceArgMorph: block argMorph by: arg]].

	^ block
! !
