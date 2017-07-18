
!Color class methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 01:01'!
fromCSS2String: aString
	"Answer a color from the given W3C spec."

	(aString beginsWith: '#')
		ifTrue: [^self fromString: aString].
	(aString beginsWith: 'rgb')
		ifTrue: [|values r g b|
				values := (aString allButFirst: 4) allButLast subStrings: ','.
				r  := (values first includes: $%)
						ifTrue: [(values first asNumber min: 100 max: 0) / 100.0]
						ifFalse: [(values first asInteger min: 255 max: 0) / 255.0].
				g := (values second includes: $%)
						ifTrue: [(values second asNumber min: 100 max: 0) / 100.0]
						ifFalse: [(values second asInteger min: 255 max: 0) / 255.0].
				b := (values third includes: $%)
						ifTrue: [(values third asNumber min: 100 max: 0) / 100.0]
						ifFalse: [(values third asInteger min: 255 max: 0) / 255.0].
				^self r: r g: g b: b].
	^self css2NamedColors at: aString ifAbsent: [Color black]! !
