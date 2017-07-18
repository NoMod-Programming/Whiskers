
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/3/2005 10:15'!
pathDataFromSVG: anElement
	"Answer a collection of parameters from the path data."

	|data path c cmds params str n sizes size|
	cmds := 'zMmLlCcQqAaHhVvSsTt'.
	sizes := #(0 2 2 2 2 6 6 4 4 7 7 1 1 1 1 4 4 2 2).
	path := (anElement attributeAt: 'd') readStream.
	data := OrderedCollection new.
	[path atEnd] whileFalse: [
		(path upToAny: cmds).
		c := path next.
		str := (path upToAny: cmds) readStream.
		params := OrderedCollection new.
		[str atEnd or: [(n := str nextNumber) isNil]] whileFalse: [
			params add: n].
		c = $z
			ifTrue: [data add: c-> #()].
		(c = $M and: [params size > 2])
			ifTrue: [data add: c -> (params first: 2).
					c := $L.
					params := params allButFirst: 2].
		(c = $m and: [params size > 2])
			ifTrue: [data add: c -> (params first: 2).
					c := $l.
					params := params allButFirst: 2].
		size := sizes at: (cmds indexOf: c).
		size > 0
			ifTrue: [1 to: params size by: (size := sizes at: (cmds indexOf: c)) do: [:i |
					data add: c -> (params copyFrom: i to: i + size - 1)]]].
	^data! !
