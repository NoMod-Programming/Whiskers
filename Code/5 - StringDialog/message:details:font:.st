
!StringDialog methodsFor: 'initialization' stamp: 'EMP 11/5/2017 17:21'!
message: aMessage details: aDetailsString font: aStrikeFont
	"Set and position my message/question text. aDetailsString can be nil, in which case it is ignored"

	| lines m |
	"just in case someone calls this repeatedly, clear any old message lines"
	messageLineMorphs ifNotNil: [
		messageLineMorphs submorphsDo: [:lineM | lineM delete]].

	messageLineMorphs  :=  AlignmentMorph newColumn
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		wrapCentering: #center.

	lines  :=  aMessage lines.

	1 to: lines size do: [:n |
		m  :=  StringMorph
					contents: (lines at: n)
					font: aStrikeFont.
		m lock.
		messageLineMorphs addMorphBack: m].

	aDetailsString ifNotNil:[
		lines  :=  aDetailsString lines.
		1 to: lines size do: [:n |
			m  :=  StringMorph
				contents: (lines at: n)
				font: aStrikeFont.
			m lock.
			messageLineMorphs addMorphBack: m]].

	responseArea addMorph: messageLineMorphs.

	self changed.
! !
