
!WhenGreaterThanHatBlockMorph methodsFor: 'layout' stamp: 'EMP 7/16/2017 20:17'!
doBlockLayout
	"Update the positions of my submorphs."

	| x centerY nextB |
	argMorph ifNil: [^ self].  "happens during initialization"

	cachedForm := nil.
	cachedFeedbackForm := nil.

	((argMorph isArgMorph) and: [argMorph owner = self])
		ifTrue: [argMorph fixArgLayout].
	self height: 26 + argMorph height.

	x := self left + 8.
	centerY := bounds center y + 5.
	self nonControlFlowSubmorphs do: [:m |
		m position: x@(centerY - (m height // 2)).
		x := x + m width + 5].

	self width: ((x + 4 - self left) max: self hatTopForm width).

	(nextB := self nextBlock) ifNotNil: [
		nextB top: self bottom - 4.
		nextB fullBounds].
! !
