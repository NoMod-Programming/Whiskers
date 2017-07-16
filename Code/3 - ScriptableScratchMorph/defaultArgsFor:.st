
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/14/2017 22:28'!
defaultArgsFor: blockSpec
	"Answer the default argument for the given block specification."

	| defaultArgs stage sel currentSize list |
	defaultArgs := blockSpec copyFrom: 4 to: blockSpec size.  "may be empty"
	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.

	sel := (blockSpec at: 3) asSymbol.
	#gotoX:y: = sel ifTrue: [
		defaultArgs := Array
			with: self scratchStagePosition x rounded
			with: self scratchStagePosition y rounded].

	#glideSecs:toX:y:elapsed:from: = sel ifTrue: [
		defaultArgs := Array
			with: 1
			with: self scratchStagePosition x rounded
			with: self scratchStagePosition y rounded].

	#pointTowards: = sel ifTrue: [
		defaultArgs := Array
			with: #mouse.
	].

	#gotoSpriteOrMouse: = sel ifTrue: [
		defaultArgs := Array
			with: #mouse.
	].

	#motor:direction: = self ifTrue: [
		defaultArgs := Array with: 'reverse' localized with: 'this way' localized with: 'that way'].

	#setSizeTo: = sel ifTrue: [
		currentSize := (100.0 * (self scalePoint x max: self scalePoint y)) rounded.
		defaultArgs := Array with: currentSize].

	#getAttribute:of: = sel ifTrue: [
		(stage := self  ownerOrYourselfThatIsA: ScratchStageMorph) ifNotNil: [
			list := stage submorphs select: [:m | m isScratchSpriteMorph].
			list sort: [:s1 :s2 | s1 objName asLowercase < s2 objName asLowercase].
			list size > 0
				ifTrue: [defaultArgs := Array with: 'x position' with: list first]
				ifFalse: [defaultArgs := Array with: 'background #' with: stage]]
		ifNil:[defaultArgs := Array with: 'x position' with: self]].

	#concatenate:with: = sel ifTrue: [
		defaultArgs := Array with: 'hello ' localized with: 'world' localized].

	#doAsk = sel ifTrue: [
		defaultArgs := Array with: 'What''s your name?' localized].

	#letter:of: = sel ifTrue: [
		defaultArgs := Array with: 1 with: 'world' localized].

	#stringLength: = sel ifTrue: [
		defaultArgs := Array with: 'world' localized].

	#say:duration:elapsed:from: = sel ifTrue: [
		defaultArgs := Array with: 'Hello!!' localized with: 2].

	#say: = sel ifTrue: [
		defaultArgs := Array with: 'Hello!!' localized].

	#think:duration:elapsed:from: = sel ifTrue: [
		defaultArgs := Array with: 'Hmm...' localized with: 2].

	#think: = sel ifTrue: [
		defaultArgs := Array with: 'Hmm...' localized].

	(#(lookLike: showBackground:) includes: sel) ifTrue: [
		defaultArgs := Array with: self costumeNames last].

	(#(playSound: doPlaySoundAndWait) includes: sel) ifTrue: [
		list := self soundNames.
		defaultArgs := list size <= 2
			ifTrue: [Array with: '']
			ifFalse: [Array with: (list at: (list size - 2))]].

	(#(broadcast: doBroadcastAndWait) includes: sel) ifTrue: [
		stage ifNotNil: [defaultArgs := Array with: stage defaultEventName]].

	(#(append:toList: deleteLine:ofList: insert:at:ofList:) includes: sel) ifTrue: [
		defaultArgs size >= 1 ifTrue: [
			defaultArgs at: 1 put: (defaultArgs at: 1) localized]].

	(#(append:toList: deleteLine:ofList: getLine:ofList: insert:at:ofList: lineCountOfList:)
		includes: sel) ifTrue: [
			defaultArgs := defaultArgs copyWith: self defaultListName].

	#setLine:ofList:to: = sel ifTrue: [
		defaultArgs size >= 3 ifTrue: [
			defaultArgs at: 2 put: self defaultListName.
			defaultArgs at: 3 put: (defaultArgs at: 3) localized]].

	#appendLettersOf:toList: = sel ifTrue: [
		defaultArgs size >= 2 ifTrue: [
			defaultArgs at: 1 put: (defaultArgs at: 1) localized.
			defaultArgs at: 2 put: self defaultListName]].

	#list:contains: = sel ifTrue: [
		defaultArgs size >= 2 ifTrue: [
			defaultArgs at: 1 put: self defaultListName.
			defaultArgs at: 2 put: (defaultArgs at: 2) localized]].

	#touching: = sel ifTrue: [
		defaultArgs := Array
			with: #mouse.
	].

	#distanceTo: = sel ifTrue: [
		defaultArgs := Array
			with: #mouse.
	].

	^ defaultArgs
! !
