
!ScriptableScratchMorph class methodsFor: 'block specs' stamp: 'EMP 11/3/2017 22:52'!
blockSpecs
	"Answer a collection of block specifications for the blocks that are common to all objects. Block specificatons (Arrays) are interspersed with category names (Strings). A block specification is an Array of the form: (<block spec string> <block type> <selector> [optional initial argument values]).
	Explanation of flags:
		-	no flags
		b	boolean reporter
		c	c-shaped block containing a sequence of commands (always special form)
		r	reporter
		s	special form command with its own evaluation rule
		t	timed command, like wait or glide
		E	message event hat
		K	key event hat
		M	mouse-click event hat
		S	start event hat
		W	when <condition> hat (obsolete)
		B	when backdrop switches to..."

	| blocks |
	blocks _ #(
		'Events'
			('when @greenFlag clicked'		S	-)
			('when %m.key key pressed'	K	-)
			('when this sprite clicked'		M	-)
			('when backdrop switches to %m.backdrop'	B	-)
			-
			('when [loudness v] > %n'		H	-)
			-
			('when I receive %m.broadcast'			E	-)
			('broadcast %m.broadcast'					-	broadcast:)
			('broadcast %m.broadcast and wait'			s	doBroadcastAndWait)
		'Operators'
			('%n + %n'						r	+ - -)
			('%n - %n'						r	- - -)
			('%n * %n'						r	* - -)
			('%n / %n'						r	/ - -)
			-
			('pick random %n to %n'		r	randomFrom:to: 1 10)
			-
			('%s < %s'						b	< '' '')
			('%s = %s'						b	= '' '')
			('%s > %s'						b	> '' '')
			-
			('%b and %b'					b	&)
			('%b or %b'						b	|)
			('not %b'						b	not)
			-
			('join %s %s'					r	concatenate:with: 'hello ' 'world')
			('letter %n of %s'				r	letter:of: 1 'world')
			('length of %s'					r	stringLength: 'world')
			-
			('%n mod %n'					r	\\ - -)
			('round %n'						r	rounded -)
			-
			('%m.mathOp of %n'						r	computeFunction:of: 'sqrt' 10)
		'Sound'
			('play sound %m.sound'				-	playSound:)
			('play sound %m.sound until done'		s	doPlaySoundAndWait)
			('stop all sounds'				-	stopAllSounds)
			-
			('play drum %d.drum for %n beats'	t 	drum:duration:elapsed:from: 1 0.25)
			('rest for %n beats'				t 	rest:elapsed:from: 0.25)
			-
			('play note %d.note for %n beats'	t	noteOn:duration:elapsed:from: 60 0.5)
			('set instrument to %d.instrument'			- 	midiInstrument: 1)
			-
			('change volume by %n'		- 	changeVolumeBy: -10)
			('set volume to %n %'			- 	setVolumeTo: 100)
			('volume'						r 	volume)
			-
			('change tempo by %n'			- 	changeTempoBy: 20)
			('set tempo to %n bpm'			- 	setTempoTo: 60)
			('tempo'							r 	tempo)
		'Motor'
			('motor on for %n secs'			t	motorOnFor:elapsed:from: 1)
			('motor on'						-	allMotorsOn)
			('motor off'						-	allMotorsOff)
			('motor power %n'				-	startMotorPower: 100)
			('motor direction %m.motorDirection'			-	setMotorDirection: 'this way')
		'Data'
			('show variable %m.var'				-	showVariable:)
			('hide variable %m.var'				-	hideVariable:)
		'List'
			('add %s to %m.list'					-	append:toList: 'thing')
			-
			('delete %d.listDeleteItem of %m.list'				-	deleteLine:ofList: 1)
			('insert %s at %d.listItem of %m.list'			-	insert:at:ofList: 'thing' 1)
			('replace item %d.listItem of %m.list with %s'		-	setLine:ofList:to: 1 'list' 'thing')
			-
			('item %d.listItem of %m.list'					r	getLine:ofList: 1)
			('length of %m.list'					r	lineCountOfList:)
			('%m.list contains %s'				b	list:contains: 'list' 'thing')
			-
			('show list %m.list'					-	showList:)
			('hide list %m.list'					-	hideList:)
	).
	^ blocks, self obsoleteBlockSpecs! !
