
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:42'!
styleFromSVG: anElement
	"Answer a dictionary of the style parameters from the element."

	|svgStyle answer attrs|
	answer := SVGPropertyDictionary withParent: self context.
	attrs := anElement attributes.
	svgStyle := anElement attributeAt: 'style'.
	svgStyle isNil ifFalse: [
		(svgStyle subStrings: ':;') pairsDo: [:name :value |
			attrs
				at: name
				put: value]].
	(attrs includesKey: 'font-family')
		ifTrue: [answer at: 'font-family' put: (attrs at: 'font-family')].
	(attrs includesKey: 'font-size')
		ifTrue: [answer at: 'font-size' put: (attrs at: 'font-size') asSVGNumber].
	(attrs includesKey: 'text-anchor')
		ifTrue: [answer at: 'text-anchor' put: (attrs at:'text-anchor') asSymbol].
	(attrs includesKey: 'opacity')
		ifTrue: [answer at: 'opacity' put: (attrs at: 'opacity') asSVGNumberOrPercentage].
	(attrs includesKey: 'fill')
		ifTrue: [answer at: 'fill' put: (self fillFromSVGSpec: (attrs at:'fill'))].
	(attrs includesKey: 'fill-opacity')
		ifTrue: [answer at: 'fill-opacity' put: (attrs at: 'fill-opacity') asSVGNumberOrPercentage].
	(attrs  includesKey: 'fill-rule')
		ifTrue: [answer at: 'fill-rule' put: (attrs at: 'fill-rule') asSymbol].
	(attrs  includesKey: 'stroke')
		ifTrue: [answer at: 'stroke' put: (self fillFromSVGSpec: (attrs at:'stroke'))].
	(attrs  includesKey: 'stroke-opacity')
		ifTrue: [answer at: 'stroke-opacity' put: (attrs at: 'stroke-opacity') asSVGNumberOrPercentage].
	(attrs  includesKey: 'stroke-width')
		ifTrue: [answer at: 'stroke-width' put: (attrs at: 'stroke-width') asSVGNumber].
	(attrs  includesKey: 'display')
		ifTrue: [answer at: 'display' put: (attrs at: 'display') withBlanksTrimmed asSymbol].
	(attrs  includesKey: 'visibility')
		ifTrue: [answer at: 'visibility' put: (attrs at: 'visibility') withBlanksTrimmed asSymbol].
	^answer! !
