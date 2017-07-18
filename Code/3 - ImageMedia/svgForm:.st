
!ImageMedia methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:27'!
svgForm: anXMLDocument

	svgForm := anXMLDocument.
	form := (SVGRenderMorph new createFromSVGDocument: svgForm) imageForm "Cache the svg morph, but we still retain a copy of the original xml"! !
