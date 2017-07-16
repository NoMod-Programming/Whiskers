
!SVGGradientFillStyle methodsFor: 'accessing' stamp: 'gvc 8/2/2005 13:21'!
computePixelRampOfSize: length
	"Compute the pixel ramp in the receiver"
	| bits lastColor lastIndex nextIndex nextColor distance theta ramp step lastWord nextWord |
	ramp := colorRamp asSortedCollection:[:a1 :a2| a1 key < a2 key].
	bits := Bitmap new: length.
	lastColor := ramp first value.
	lastWord := lastColor pixelWord32.
	lastIndex := 0.
	ramp do:[:assoc|
		nextIndex := (assoc key * length) rounded.
		nextColor := assoc value.
		nextWord := nextColor pixelWord32.
		distance := nextIndex - lastIndex.
		distance = 0 ifTrue: [distance := 1].
		step := 1.0 / distance.
		theta := 0.0.
		lastIndex+1 to: nextIndex do: [:i|
			theta := theta + step.
			bits at: i put: (self interpolatedAlphaMix: theta of: lastWord and: nextWord)].
		lastIndex := nextIndex.
		lastColor := nextColor.
		lastWord := nextWord].
	lastIndex+1 to: length do: [:i| bits at: i put: lastWord].
	^bits! !
