
!CommandBlockMorph methodsFor: 'menus' stamp: 'EMP 11/5/2017 16:13'!
rightButtonMenu

	| menu sFrame |
	menu  :=  ScratchMenuMorph new itemHeight: 22; color: color..
	menu add: 'help' localized target: self action: #presentHelpScreen.

	(owner isKindOf: ScratchBlockPaletteMorph) ifFalse: [
		"I am not in the block palette"
		menu addLine.
		(#(+ - * / \\) includes: selector) ifTrue: [
			#(+ - * / mod) with: #(+ - * / \\) do: [:s :op | menu add: s localized target: self selector: #updateCommandSpecFromMenuChoice: argument: op]].
		
		(#(< = >) includes: selector) ifTrue: [
			#(< = >) do: [:op | menu add: op localized target: self selector: #updateCommandSpecFromMenuChoice: argument: op]].
		
		(#(& |) includes: selector) ifTrue: [
			#(and or) with: #(& |) do: [:s :op | menu add: s localized target: self selector: #updateCommandSpecFromMenuChoice: argument: op]].

		menu addLine.
		menu add: 'duplicate' localized target: self action: #duplicate.
		(self owner isBlockMorph) ifFalse: [  "can't yet delete a blocks inside a script"
			menu add: 'delete' localized target: self action: #delete]].

	"actions for the sensor board block morphs - must be a better way to do this"
	sFrame  :=  self ownerScratchFrame.
	(sFrame notNil and: [#(sensor: sensorPressed:) includes: selector]) ifTrue: [
		menu addLine.
		menu add: 'show ScratchBoard watcher' localized target: sFrame action: #showSensorBoard.
		sFrame workPane scratchServer
			ifNil: [menu add: 'enable remote sensor connections' localized target: sFrame action: #enableRemoteSensors]
			ifNotNil: [menu add: 'disable remote sensor connections' localized target: sFrame action: #exitScratchSession]].

	DebugMenu ifTrue: [
		menu addLine.
		menu add: 'show tuples' localized target: self action: #showTuples].
	
	menu popUpInWorld
! !
