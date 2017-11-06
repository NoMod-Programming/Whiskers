
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 11/5/2017 20:55'!
blockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given tuple."

	| k spec blockColor block argCount arg argBlock |
	k := tuple first asSymbol.
	(#(readVariable changeVariable) includes: k) ifTrue: [
		^ self variableBlockFromTuple: tuple receiver: scriptOwner].

	#contentsOfList: = k ifTrue: [
		^ ListContentsBlockMorph new
			color: ScriptableScratchMorph listBlockColor;
			receiver: scriptOwner;
			commandSpec: tuple second;
			selector: #contentsOfList:].

	(#(call getParam) includes: k) ifTrue: [
		^ self customBlockFromTuple: tuple receiver: scriptOwner].

	(#(EventHatMorph KeyEventHatMorph MouseClickEventHatMorph WhenHatBlockMorph whenSceneStarts whenSensorGreaterThan procDef whenCloned) includes: k) ifTrue: [
		block := self hatBlockFromTuple: tuple receiver: scriptOwner.
		^ block].

	#scratchComment = k ifTrue: [
		block := ScratchCommentMorph new.
		tuple size > 1 ifTrue: [block commentMorph contents: (tuple at: 2)].
		tuple size > 2 ifTrue: [(tuple at: 3) ifFalse: [block toggleShowing]].
		tuple size > 3 ifTrue: [block width: (tuple at: 4)].
		tuple size > 4 ifTrue: [block anchor: (self blockWithID: (tuple at: 5))].
		^ block].

	#scratch2Comment = k ifTrue: [
		block := ScratchCommentMorph new.
		(tuple at: 4) ifFalse: [block toggleShowing].
		(tuple at: 5) >= 0 ifTrue: [block anchor: (self blockWithID: (tuple at: 5))].
		block commentMorph contents: (tuple at: 6).
		block width: (tuple at: 2).
		block height: (tuple at: 3).
		^ block
	].

	#comment: = k ifTrue: [
		block := CommentBlockMorph new.
		tuple size > 1 ifTrue: [block comment: (tuple at: 2)].
		tuple size > 2 ifTrue: [(tuple at: 3) ifFalse: [block toggleShowing]].
		block color: (ScratchViewerMorph colorForCategory: 'undefined').  "obsolete"
		^ block].

	#doForeverIf = k ifTrue: [
		^ self blockFromTuple: {#doForever. {{#doIf. tuple second. tuple third}}} receiver: scriptOwner
	].

	#stopAll = k ifTrue: [
		^ self blockFromTuple: #(stopScripts 'all') receiver: scriptOwner
	].

	#doReturn = k ifTrue: [
		^ self blockFromTuple: #(stopScripts 'this script') receiver: scriptOwner
	].

	(#(whenGreenFlag whenIReceive whenClicked whenKeyPressed setVar:to: changeVar:by: startScene nextScene %) includes: k) ifTrue: [
		block := self scratch2BlockFromTuple: tuple receiver: scriptOwner.
		block isArray ifFalse: [^ block].
		spec := block first.
		block := block second.
	] ifFalse: [
		spec := BlockSpecDict
					at: k
					ifAbsent: [nil].
		spec ifNil: [^ scriptOwner blockFromSpec: #('obsolete!!' - undefined) color: (ScratchViewerMorph colorForCategory: 'undefined')].
		blockColor := BlockColorDict
							at: k
							ifAbsent: [ScratchViewerMorph colorForCategory: 'undefined'].
		block := scriptOwner blockFromSpec: spec color: blockColor
	].

	(block isCommandBlockMorph) ifTrue: [
		argCount := block argumentCount min: tuple size - 1.
		1 to: argCount do: [:i |
			((#(+ - / * =) includes: block selector) and: [ScratchTranslator isRTLMath]) "RTLMath operators are RTL"
				ifTrue: [arg := tuple at: ((argCount + 1) - (i - 1))]
				ifFalse: [arg := tuple at: i + 1].
			(arg isArray)
				ifTrue: [  "argument is a block"
					((arg size = 1) and: [arg first isKindOf: Array]) ifTrue: [arg := arg first].
					argBlock := self blockFromTuple: arg receiver: scriptOwner.
					block replaceArgMorph: (block argumentAt: i) by: argBlock]
				ifFalse: [  "argument is a value"
					(block argumentAt: i) defaultValue: arg]].

		(block isCBlockMorph) ifTrue: [
			(tuple last isArray) ifTrue: [
				block firstBlockList: (self stackFromTupleList: tuple last receiver: scriptOwner)]].

		(block isIfElseBlockMorph) ifTrue: [
			arg := tuple at: tuple size - 1.
			(arg isArray) ifTrue: [
				block trueBlock: (self stackFromTupleList: arg receiver: scriptOwner)].
			arg := tuple at: tuple size.
			(arg isArray) ifTrue: [
				block falseBlock: (self stackFromTupleList: arg receiver: scriptOwner)]].

		(block isReporterBlockMorph) ifTrue: [
			((spec at: 2) includes: $b) ifTrue: [block isBoolean: true]]].

	^ block
! !
