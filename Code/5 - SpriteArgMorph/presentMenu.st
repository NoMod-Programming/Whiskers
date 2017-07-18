
!SpriteArgMorph methodsFor: 'event handling' stamp: 'EMP 7/16/2017 18:58'!
presentMenu
	"Let the user select a Scratch object or the special value #mouse."

	| frame sel objList menu frameHeight |
	(frame := self ownerScratchFrame) ifNil: [^ self].

	(owner isCommandBlockMorph) ifTrue: [sel := owner selector].

	objList := frame scratchObjects.
	objList sort: [:obj1 :obj2 | obj1 objName asLowercase < obj2 objName asLowercase].

	menu := ScratchMenuMorph new.

	(type = #spriteOrStage) ifTrue: [
		menu add: 'Stage' localized target: self selector: #setArgFromMenuChoice: argument: frame workPane.
		objList := objList copyWithout: owner receiver].
	(type = #spriteOrMouse) ifTrue: [
		menu add: 'mouse-pointer' localized target: self selector: #setArgFromMenuChoice: argument: #mouse.
		objList := objList copyWithout: owner receiver].
	(type = #touching) ifTrue: [
		menu add: 'edge' localized target: self selector: #setArgFromMenuChoice: argument: #edge.
		menu add: 'mouse-pointer' localized target: self selector: #setArgFromMenuChoice: argument: #mouse.
		objList := objList copyWithout: owner receiver].
	(type = #spriteOnly) ifTrue: [
		(owner receiver isScratchStageMorph) ifFalse: [
			menu add: 'myself' localized target: self selector: #setArgFromMenuChoice: argument: #_myself_].
		objList := objList copyWithout: owner receiver].
	(type = #location) ifTrue: [
		menu add: 'mouse-pointer' localized target: self selector: #setArgFromMenuChoice: argument: #mouse.
		menu add: 'random position' localized target: self selector: #setArgFromMenuChoice: argument: #_random_.
		objList := objList copyWithout: owner receiver].

	objList size > 0 ifTrue: [menu addLine].
	objList do: [:obj | menu add: obj objName target: self selector: #setArgFromMenuChoice: argument:  obj].

	"roughly how many entries could fit into 3/4 of my frame's height?"
	frameHeight := (self ownerScratchFrame) ifNil:[300] ifNotNil:[:thing| thing height].
	 menu limitHeightTo: frameHeight * 3/4.

	menu popUpInWorld
! !
