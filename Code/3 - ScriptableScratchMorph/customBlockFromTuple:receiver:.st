
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 15:14'!
customBlockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given tuple."

	| spec blockColor block argCount arg argBlock |

	(tuple first = #getParam) ifTrue: [spec _ {tuple second. tuple third. tuple second}. blockColor _ (Color r: 89/255 g: 71/255 b: 177/255).] ifFalse: [spec _ {tuple second. (tuple first = #callReporter) ifTrue: [#rs] ifFalse: [#s]. tuple first}. blockColor _ (Color r: 99/255 g: 45/255 b: 153/255).].

	block _ scriptOwner customBlockFromSpec: spec color: blockColor.
	(block isKindOf: CommandBlockMorph) ifTrue: [
		argCount _ block argumentCount min: tuple size - 2.
		(1 to: argCount) do: [:i |
			((#(+ - / * =) includes: block selector) and: [ScratchTranslator isRTLMath]) "RTLMath operators are RTL"
				ifTrue: [arg _ tuple at: ((argCount + 1) - (i - 2))]
				ifFalse: [arg _ tuple at: i + 2].
			(arg isKindOf: Array)
				ifTrue: [  "argument is a block"
					((arg size = 1) and: [arg first isKindOf: Array]) ifTrue: [arg _ arg first].
					argBlock _ self blockFromTuple: arg receiver: scriptOwner.
					block replaceArgMorph: (block argumentAt: i) by: argBlock]
				ifFalse: [  "argument is a value"
					(block argumentAt: i) defaultValue: arg]].

		(block isKindOf: CBlockMorph) ifTrue: [
			(tuple last isKindOf: Array) ifTrue: [
				block firstBlockList: (self stackFromTupleList: tuple last receiver: scriptOwner)]].

		(block isKindOf: IfElseBlockMorph) ifTrue: [
			arg _ tuple at: tuple size - 1.
			(arg isKindOf: Array) ifTrue: [
				block trueBlock: (self stackFromTupleList: arg receiver: scriptOwner)].
			arg _ tuple at: tuple size.
			(arg isKindOf: Array) ifTrue: [
				block falseBlock: (self stackFromTupleList: arg receiver: scriptOwner)]].

		(block isKindOf: ReporterBlockMorph) ifTrue: [
			((spec at: 2) includes: $b) ifTrue: [block isBoolean: true]]].

^ block! !
