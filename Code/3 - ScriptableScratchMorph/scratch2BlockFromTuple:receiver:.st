
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/16/2017 13:17'!
scratch2BlockFromTuple: tuple receiver: scriptOwner
	| k block blockColor selector spec varTuple |
	k := tuple first asSymbol.
	#whenGreenFlag = k ifTrue: [
		^ EventHatMorph new forStartEvent; scriptOwner: scriptOwner
	].
	#whenIReceive = k ifTrue: [
		^ EventHatMorph new
				scriptOwner: scriptOwner;
				eventName: tuple second
	].
	#whenClicked = k ifTrue: [
		^ MouseClickEventHatMorph new scriptOwner: scriptOwner
	].
	#whenKeyPressed = k ifTrue: [
		^ KeyEventHatMorph new
				scriptOwner: scriptOwner;
				choice: tuple second
	].
	(#(setVar:to: changeVar:to:) includes: k) ifTrue: [
		varTuple := {#changeVariable. tuple second. k. tuple third}.
		^ self variableBlockFromTuple: varTuple receiver: scriptOwner
	].
	#startScene = k ifTrue: [
		selector := #showBackground:
	].
	#nextScene = k ifTrue: [
		selector := #nextBackground
	].
	#% = k ifTrue: [
		selector := #\\
	].
	spec := BlockSpecDict
				at: selector
				ifAbsent: [].
	spec ifNil: [^ #('undefined!!' #- undefined)].
	blockColor := BlockColorDict
						at: selector
						ifAbsent: [Color red].
	block := self blockFromSpec: spec color: blockColor.
	^ Array
		with: spec
		with: block! !
