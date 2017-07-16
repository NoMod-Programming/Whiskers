
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:19'!
styleIn: aComponent fromSVGStyle: svgStyle
	"Answer a dictionary of the style parameters for the given svg style dictionary."

	|balloonStyle textStyle regenFill|
	regenFill := false.
	balloonStyle := aComponent composedStyle.
	(svgStyle includesKey: 'font-size')
		ifTrue: [balloonStyle at: 'font-size' put: (svgStyle at: 'font-size')]
		ifFalse: [(balloonStyle includesKey: 'font-size')
				ifFalse: [balloonStyle at: 'font-size' put: 12]].
	(svgStyle includesKey: 'font-family')
		ifTrue: [textStyle := TextStyle named: (svgStyle at: 'font-family').
				textStyle isNil ifTrue: [textStyle := TextStyle default].
				balloonStyle at: 'font' put: (textStyle fontOfSize: (balloonStyle at: 'font-size'))]
		ifFalse: [(balloonStyle includesKey: 'font')
				ifFalse: [balloonStyle at: 'font' put: TextStyle defaultFont]].
	(svgStyle includesKey: 'text-anchor')
		ifTrue: [balloonStyle at: 'text-anchor' put: (svgStyle at: 'text-anchor')]
		ifFalse: [(balloonStyle includesKey: 'text-anchor')
				ifFalse: [balloonStyle at: 'text-anchor' put: 'start']].
	(svgStyle includesKey: 'opacity')
		ifTrue: [balloonStyle at: 'opacity' put: (svgStyle at: 'opacity').
				regenFill := true.]
		ifFalse: [(balloonStyle includesKey: 'opacity')
				ifFalse: [balloonStyle at: 'opacity' put: 1.0]].
	(svgStyle includesKey: 'fill-opacity')
		ifTrue: [balloonStyle at: 'fill-opacity' put: (svgStyle at: 'fill-opacity').
				regenFill := true]
		ifFalse: [(balloonStyle includesKey: 'fill-opacity')
				ifFalse: [balloonStyle at: 'fill-opacity' put: 1.0]].
	(svgStyle includesKey: 'fill')
		ifTrue: [balloonStyle at: 'fill' put: (svgStyle at: 'fill').
				regenFill := true]
		ifFalse: [(balloonStyle includesKey: 'fill')
				ifFalse: [balloonStyle at: 'fill' put: Color transparent]].
	regenFill 
		ifTrue: [balloonStyle at: 'fill' put: ((balloonStyle at: 'fill')
					alphaMixed: (balloonStyle at: 'fill-opacity') * (balloonStyle at: 'opacity'))].
	(svgStyle includesKey: 'fill-rule')
		ifTrue: [balloonStyle at: 'fill-rule' put: (svgStyle at: 'fill-rule')]
		ifFalse: [(balloonStyle includesKey: 'fill-rule')
				ifFalse: [balloonStyle at: 'fill-rule' put: 'nonzero']].
	(svgStyle includesKey: 'stroke-width')
		ifTrue: [balloonStyle at: 'stroke-width' put: (svgStyle at: 'stroke-width')]
		ifFalse: [(balloonStyle includesKey: 'stroke-width')
				ifFalse: [balloonStyle at: 'stroke-width' put: 1]].
	(svgStyle includesKey: 'stroke-linecap')
		ifTrue: [balloonStyle at: 'stroke-linecap' put: (svgStyle at: 'stroke-linecap')]
		ifFalse: [(balloonStyle includesKey: 'stroke-linecap')
				ifFalse: [balloonStyle at: 'stroke-linecap' put: #square]].
	(svgStyle includesKey: 'stroke-opacity')
		ifTrue: [balloonStyle at: 'stroke-opacity' put: (svgStyle at: 'stroke-opacity')]
		ifFalse: [(balloonStyle includesKey: 'stroke-opacity')
				ifFalse: [balloonStyle at: 'stroke-opacity' put: 1.0]].
	(svgStyle includesKey: 'stroke')
		ifTrue: [balloonStyle at: 'stroke' put: ((svgStyle at: 'stroke')
				alphaMixed: (balloonStyle at: 'stroke-opacity') * (balloonStyle at: 'opacity'))]
		ifFalse: [(balloonStyle includesKey: 'stroke')
				ifFalse: [balloonStyle at: 'stroke' put: Color transparent]].
	(svgStyle includesKey: 'display')
		ifTrue: [balloonStyle at: 'display' put: ((svgStyle at: 'display') withBlanksTrimmed ~= 'none')]
		ifFalse: [(balloonStyle includesKey: 'display')
				ifFalse: [balloonStyle at: 'display' put: true]].
	(svgStyle includesKey: 'visibility')
		ifTrue: [balloonStyle at: 'visibility' put: ((svgStyle at: 'visibility') withBlanksTrimmed = 'visible')]
		ifFalse: [(balloonStyle includesKey: 'visibility')
				ifFalse: [balloonStyle at: 'visibility' put: true]].
	(balloonStyle at: 'stroke') isColor
		ifTrue: [(balloonStyle at: 'stroke') isTransparent
			ifTrue: [balloonStyle at: 'stroke-width' put: 0]
			ifFalse: [balloonStyle at: 'stroke' put: ((balloonStyle at: 'stroke') alpha: (balloonStyle at: 'stroke-opacity'))]]
		ifFalse: [].
	^balloonStyle ! !
