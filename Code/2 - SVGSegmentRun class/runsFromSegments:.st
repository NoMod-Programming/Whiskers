
!SVGSegmentRun class methodsFor: 'as yet unclassified' stamp: 'gvc 10/25/2005 12:49'!
runsFromSegments: aCollection
	"Answer a collection of runs from the given segments."

	|answer str seg run runClass position|
	answer _ OrderedCollection new.
	aCollection isEmpty
		ifTrue: [^answer].
	str _ aCollection readStream.
	run  _ str next run.
	runClass _ aCollection first runClass.
	position _ aCollection first end.
	[str atEnd] whileFalse: [
		seg _ str next.
		(seg runClass ~= runClass or: [seg start ~= position])
			ifTrue: [answer add: run.
					runClass _ seg runClass.
					run _ seg run]
			ifFalse: [run add: seg run].
		position _ seg end].
	answer add: run.
	^answer
		! !
