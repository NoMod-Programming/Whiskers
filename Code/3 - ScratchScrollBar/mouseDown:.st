
!ScratchScrollBar methodsFor: 'event handling' stamp: 'EMP 7/16/2017 21:15'!
mouseDown: evt
	"Record the offset between the slider's start offset and the relative event's location."

	| offset pageDelta |
	dragOffset := nil.
	self maxSliderLength = sliderLength ifTrue: [^ self].  "do nothing"

	offset := self linearOffset: evt.
	((offset >= sliderStart) & (offset <= (sliderStart + sliderLength)))
		ifTrue: [  "mouse went down on the slider: start dragging it"
			^ dragOffset := sliderStart - offset].

	"handle page up or down"
	pageDelta := sliderLength / self maxSliderLength.
	offset < sliderStart
		ifTrue: [self scrollFraction: self scrollFraction - pageDelta; updateTarget]
		ifFalse: [self scrollFraction: self scrollFraction + pageDelta; updateTarget]

! !
