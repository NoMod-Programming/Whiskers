
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 8/1/2005 12:09'!
drawOn: aCanvas 
	"Display the receiver."
	
	super drawOn: aCanvas.
	aCanvas frameAndFillRectangle: self bounds fillColor: self color borderWidth: 1 borderColor: Color black! !
