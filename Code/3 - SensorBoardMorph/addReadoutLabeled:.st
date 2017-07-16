
!SensorBoardMorph methodsFor: 'initialization' stamp: 'EMP 7/13/2017 18:41'!
addReadoutLabeled: aString
	"Add a readout row with the given label. Answer the stringmorph that's the readout."

	| row box readout |
	row := AlignmentMorph newRow color: column color; layoutInset: 2; listCentering: #justified; cellInset: 3.
	row addMorphBack: (StringMorph contents: aString capitalized font: (ScratchFrameMorph getFont: #XYReadoutBold)).
	box := WatcherReadoutFrameMorph new
		extent: 42@14;
		color: (ScratchViewerMorph colorForCategory: 'Sensing').
	readout := StringMorph contents: '0' font: (ScratchFrameMorph getFont: #XYReadoutBold).
	readout color: Color white; lock.
	box addMorph: readout.
	row addMorphBack: box.
	column addMorphBack: row.
	^ readout
! !
