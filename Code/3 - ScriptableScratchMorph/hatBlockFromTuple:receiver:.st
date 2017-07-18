
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 17:10'!
hatBlockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given variable reference tuple."

	| blockClass block eventName arg |
	blockClass := Smalltalk at: tuple first asSymbol ifPresent: [:class |  block := class new scriptOwner: scriptOwner. class] ifAbsent: [tuple first asSymbol].

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

	blockClass = #whenSceneStarts ifTrue: [
		block := BackdropEventHatMorph new scriptOwner: scriptOwner; choice: (tuple at: 2)].

	blockClass = #whenSensorGreaterThan ifTrue: [
		block := WhenGreaterThanHatBlockMorph new scriptOwner: scriptOwner.
		((tuple at: 3) isKindOf: Array) ifTrue: [
			arg := self blockFromTuple: (tuple at: 3) receiver: scriptOwner.
			block replaceArgMorph: block argMorph by: arg]
		ifFalse: [block argMorph numExpression: (tuple at: 3)].
		block choice: (tuple at: 2)].

	blockClass = #procDef ifTrue: [
		block := (ProcedureHatBlockMorph fromSpec: (tuple at: 2) params: (tuple at: 3) isAtomic: (tuple at: 5)) scriptOwner: scriptOwner; doBlockLayout].

	blockClass = #whenCloned ifTrue: [
		block := WhenClonedEventHatMorph new scriptOwner: scriptOwner
	].

	^ block
! !
