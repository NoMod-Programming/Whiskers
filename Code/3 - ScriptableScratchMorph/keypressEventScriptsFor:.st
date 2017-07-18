
!ScriptableScratchMorph methodsFor: 'scripts' stamp: 'EMP 7/16/2017 19:53'!
keypressEventScriptsFor: morphicKeyEvent
"return all the scripts appropriate to a keypressevent"
	^self scripts select: [:s | s respondsToKeyEvent: morphicKeyEvent]! !
