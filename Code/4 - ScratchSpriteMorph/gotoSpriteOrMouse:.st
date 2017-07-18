
!ScratchSpriteMorph methodsFor: 'motion ops' stamp: 'EMP 7/16/2017 21:05'!
gotoSpriteOrMouse: anObject
	"Go to the given sprite or mouse position."

	| aSpriteOrSymbol p |
	aSpriteOrSymbol := self coerceSpriteArg: anObject.

	aSpriteOrSymbol = #mouse ifTrue: [^ self gotoX: self mouseX y: self mouseY].
	aSpriteOrSymbol = #_random_ ifTrue: [^ self gotoX: (self randomFrom: -240 to: 240) y: (self randomFrom: -180 to: 180)].
	(aSpriteOrSymbol isKindOf: self class) ifFalse: [^ self].
	p := aSpriteOrSymbol scratchStagePosition.
	self gotoX: p x y: p y.

! !
