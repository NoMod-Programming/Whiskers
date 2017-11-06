
!ScratchMenuMorph methodsFor: 'initialization' stamp: 'EMP 11/5/2017 16:13'!
initialize
	"setup as a Scratch menu"
	super initialize.
	self beSticky. "; useRoundedCorners."
	self borderWidth: 0.
	self color: ScratchFrameMorph menuColor.
	self hasDropShadow: true.
	self shadowOffset: ScratchFrameMorph menuShadowOffset.
	self shadowColor: ScratchFrameMorph menuShadowColor.
	self layoutInset: 1.
	itemHeight := 28.! !
