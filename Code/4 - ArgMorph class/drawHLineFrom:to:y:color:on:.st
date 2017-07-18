
!ArgMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:12'!
drawHLineFrom: startX to: endX y: yOffset color: c on: aCanvas 

	aCanvas fillRectangle: (startX @ yOffset corner: endX @ (yOffset + 1))
		color: c! !
