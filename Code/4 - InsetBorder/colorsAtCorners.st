
!InsetBorder methodsFor: 'accessing' stamp: 'EMP 11/4/2017 23:01'!
colorsAtCorners
	| c c14 c23 |
	c := self color.
	"c14 := c lighter. c23 := c darker".
	c23 := Color black.
	c14 := Color white.
	^Array with: c23 with: c14 with: c14 with: c23.! !
