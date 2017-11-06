
!ScratchMenuMorph methodsFor: 'accessing' stamp: 'EMP 11/4/2017 23:37'!
updateDropShadowCache

	| shadowBounds offset form canvas drawBlock localBounds mask maskCanvas |
	shadowBounds := self shadowOffset isRectangle
		ifTrue: [0@0 corner: (self bounds outsetBy: self shadowOffset) extent]
		ifFalse: [0@0 corner: self extent + self shadowOffset abs].
	offset := self shadowOffset isRectangle
		ifTrue: [0@0]
		ifFalse: [self shadowOffset max: 0@0].
	localBounds := self shadowOffset isRectangle
		ifTrue: [self shadowOffset topLeft extent: self extent]
		ifFalse: [(self shadowOffset negated max: 0@0) extent: self extent].
		
	form := Form extent: shadowBounds extent depth: Display depth.
	canvas := form getCanvas.

	drawBlock := [:c | 0 to: (self shadowOffset width) do: [:i | 
						c
							fillRectangle: (shadowBounds insetBy: i)
							fillStyle: (self shadowColor alpha: (i / (self shadowOffset width + 5)))]].
			
	canvas 
		translateBy: offset
		during: [ :shadowCanvas | drawBlock value: shadowCanvas].

	"Support transparent morph colors without having the shadow to shine through.."
	mask := Form extent: shadowBounds extent depth: Display depth.
	maskCanvas := mask getCanvas.
	self wantsRoundedCorners
		ifTrue: [maskCanvas fillRoundRect: (localBounds insetBy: self borderWidth) radius: self cornerRadius fillStyle: Color black]
		ifFalse: [maskCanvas fillRectangle: (localBounds insetBy: self borderWidth) fillStyle: Color black].
	mask
		displayOn: form
		at: 0@0
		rule: Form erase.
	
	self setProperty: #dropShadow toValue: form.! !
