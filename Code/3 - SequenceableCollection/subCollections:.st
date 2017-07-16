
!SequenceableCollection methodsFor: '*SVG-Morphic' stamp: 'gvc 4/8/2006 21:52'!
subCollections: aBlock
	"Answser an ordered collection of ordered collections
		where each subcollection is delimited by an element of the receiver
		for which the given block evaluates to true."

	|str answer current e|
	str := self readStream.
	answer := OrderedCollection new.
	current := OrderedCollection new.
	[str atEnd] whileFalse: [
		e := str next.
		current add: e.
		(aBlock value: e)
			ifTrue: [answer add: current.
					current := OrderedCollection new]].
	current isEmpty
		ifFalse: [answer add: current].
	^answer! !
