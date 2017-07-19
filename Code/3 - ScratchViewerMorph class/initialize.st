
!ScratchViewerMorph class methodsFor: 'class initialization' stamp: 'EMP 7/18/2017 16:15'!
initialize
	"self initialize"

	CatList := #(
		"Category		R		G		B		Show?"
		('Motion'		74		108	212	true)
		('Events'		200	131	48		true)
		('Looks'			138	85		215	true)
		('Control'		225	169	26		true)
		('Sound'		187	66		195	true)
		('Sensing'		44		165	226	true)
		('Pen'			14		154	108	true)
		('Operators'		92		183	18		true)
		('Data'			238	125	22		true)
		('More Blocks'	99		45		153	true)
		"Other categories (not shown in category selector"
		('Lists'			204	91		32		false)
		('Extensions'	75		74		96		false)
		('Parameter'	89		71		177	false)
		('undefined'	212	40		40		false)
		('Motor'			54		55		180	false)
	).! !
