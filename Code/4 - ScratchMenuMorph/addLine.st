
!ScratchMenuMorph methodsFor: 'construction' stamp: 'EMP 11/5/2017 17:03'!
addLine
	"Append a divider line to this menu. Suppress duplicate lines."

	| colorToUse |
	self hasItems ifFalse: [^ self].
	self lastSubmorph knownName = #line ifTrue: [^ self].
	
	colorToUse := color withBrightness: 0.5.
	self addMorphBack: (Morph new
		color: colorToUse;
		hResizing: #spaceFill;
		height: 1;
		borderWidth: 0;
		name: #line; "see above"
		yourself).! !
