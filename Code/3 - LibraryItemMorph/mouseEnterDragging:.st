
!LibraryItemMorph methodsFor: 'event handling' stamp: 'EMP 11/3/2017 20:40'!
mouseEnterDragging: evt

	"| m s |

	m := BorderedMorph new
		color: Color gray lighter lighter;
		borderWidth: 1;
		borderColor: Color gray;
		useRoundedCorners.
	s := StringMorph
		contents: ('Copy to ', target objName)
		font: (ScratchFrameMorph getFont: #Button).
	s color: Color white.
	m
		addMorph: (s position: (5@2));
		width: s width + 10;
		height: s height + 5.
	(evt hand submorphs at: 1) addCopyTooltip: (m)."

	isSelected ifTrue: [^ self].

	rolloverOn := true.
	self changed.
! !
