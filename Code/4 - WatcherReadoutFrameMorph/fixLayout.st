
!WatcherReadoutFrameMorph methodsFor: 'drawing' stamp: 'EMP 11/3/2017 22:31'!
fixLayout

	| watcher readout isLarge s e readoutWidth yOffset w inset |
	<pragma: #i18nIssue>
	((submorphs size = 1) and: [submorphs first isStringMorph]) ifFalse: [^ self].
	watcher := self ownerThatIsA: WatcherMorph.
	readout := submorphs first.

	isLarge := watcher ifNil: [false] ifNotNil: [watcher isLarge].
	s := readout contents.
	isLarge
		ifTrue: [self width: 50]
		ifFalse: [self width: 40].

	e := readout font extentOfString: s.
	readoutWidth := e x.
	(readoutWidth + 10) > self width ifTrue: [self width: readoutWidth + 12].
	self width > (readoutWidth + 50) ifTrue: [self width: readoutWidth + 50].

	readout contents: readout contents. "<-- almost certainly redundant"
	"set height"
	isLarge
		ifTrue: [self height: (e y max: 23)]
		ifFalse: [self height: (e y max: 14)].

	yOffset := (self height // 2) - (ScratchTranslator centerOffsetForButtonWithFont: readout font) + 1.
	(((s indexOf: $.) = (s size - 2)) and: [((s indexOf: $.) = 0) not]) "one digit after the decimal point"
		ifTrue: [  "right-justify the string"
			w := (readout font extentOfString: (s copyUpTo: $.)) x.
			inset := (readout font extentOfString: '.0') x.
			self isLarge ifTrue: [inset := inset + 1].
			readout position: self topRight - ((w + inset + 5) @ (-1 * yOffset))]
		ifFalse: [
			readout center: self center + (1@0)].
	(readout bottom > self bottom) ifTrue: [readout bottom: self bottom].
	(readout top < self top) ifTrue: [readout top: self top].
! !
