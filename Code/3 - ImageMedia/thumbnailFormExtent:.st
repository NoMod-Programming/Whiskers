
!ImageMedia methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:26'!
thumbnailFormExtent: extent 
	| f compositeF scale shrunk |
	f := (Form extent: extent depth: 16)
				fillColor: Color transparent.
	form
		ifNotNil: 
			[compositeF := self compositeFormForScale: 1.0.
			compositeF width > 0 & (compositeF height > 0)
				ifTrue: [scale := f width / compositeF width min: f height / compositeF height]
				ifFalse: [scale := 1].
			scale < 1
				ifTrue: [shrunk := (compositeF asFormOfDepth: 16)
								magnify: compositeF boundingBox
								by: scale
								smoothing: 2]
				ifFalse: [shrunk := compositeF].
			shrunk
				displayOn: f
				at: f extent - shrunk extent // 2
				rule: Form paint].
	^ f! !
