
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 11/5/2017 18:45'!
showOrHideVariable: varName show: showFlag
	"Show the watcher for the given variable. Do nothing if the variable does not exist or is already showing."

	| frame w b palette |
	(self varNames includes: varName) ifFalse: [^ self].

	frame := self ownerScratchFrame.
	frame ifNil: [^ self].
	
	b := VariableBlockMorph new commandSpec: varName; receiver: self blockReceiver; variable: varName.
	w := frame watcherForBlock: b.
	showFlag
		ifTrue: [w ifNil: [frame showWatcher: b createWatcher]]
		ifFalse: [w ifNotNil: [w delete]].

	palette := frame currentBlockPalette.
	palette ifNotNil: [palette updateWatcherButtonsForFrame: frame].
! !
