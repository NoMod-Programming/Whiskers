
!Color methodsFor: 'transformations' stamp: 'EMP 11/5/2017 16:59'!
withBrightness: brightness
	"Adjust the relative brightness of this color. (lowest value is 0.005 so that hue information is not lost)"

	^ Color
		h: self hue
		s: self saturation
		v: brightness
		alpha: self alpha! !
