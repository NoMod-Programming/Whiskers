
!ScratchMenuMorph methodsFor: 'construction' stamp: 'EMP 11/5/2017 14:06'!
add: aString target: target selector: aSymbol argumentList: argList
	"Append a menu item with the given label - see superclass comments.
	Add setting of the font. Also catches users of #add:target:selector:argument:, #add:action:"

	| item |
	item := ScratchMenuItemMorph new
		contents: aString withMarkers: false;
		target: target;
		selector: aSymbol;
		arguments: argList asArray;
		color: Color white.
	item font: self font.	
	self addMorphBack: item.
! !
