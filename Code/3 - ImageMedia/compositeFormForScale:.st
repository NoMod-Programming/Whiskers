
!ImageMedia methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:25'!
compositeFormForScale: aScale
	"In the future, take into account SVG file types and render them for a certain scale"
	"Answer my composite form, which is my form with the text painted on top of it."

	svgForm ifNotNil: [
		^ form form
	].

	compositeForm ifNotNil: [^ compositeForm].
	self hasTextLayer ifFalse: [^ compositeForm := form].

	compositeForm := Form extent: form extent depth: 32.
	form displayOn: compositeForm.
	textBox
		drawTextOn: ((FormCanvas on: compositeForm) copyOffset: textBox topLeft).

	^ compositeForm
! !
