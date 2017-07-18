
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 10/3/2005 17:13'!
setDimensionsFromSVG: anElement
	"Set the receiver's dimensions from the given svg element."

	|w h viewBox str|
	w := anElement attributeAt: 'width'ifAbsent: ['100%'].
	h := anElement attributeAt: 'height' ifAbsent: ['100%'].
	str := anElement attributeAt: 'viewBox'.
	viewBox := str isNil
		ifTrue: [self defaultViewBox]
		ifFalse: [str := str readStream.
				str nextNumber@str nextNumber extent: str nextNumber@str nextNumber].
	(w withBlanksTrimmed endsWith: '%')
		ifTrue: [w := viewBox width * w asNumber // 100]
		ifFalse: [(w withBlanksTrimmed endsWith: 'mm')
				ifTrue: [w := (w asNumber * 3.571429) rounded]
				ifFalse: [w := w asInteger]].
	(h withBlanksTrimmed endsWith: '%')
		ifTrue: [h := viewBox height * h asNumber // 100]
		ifFalse: [(h withBlanksTrimmed endsWith: 'mm')
				ifTrue: [h := (h asNumber * 3.571429) rounded]
				ifFalse: [h := h asInteger]].
	self extent: w@h! !
