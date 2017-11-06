
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 11/5/2017 16:15'!
languageMenu: aToggleButtonMorph
	"Present a menu of possible languages for blocks."
	| menu choice |
	
	menu := ScratchMenuMorph new.

	"Build the menu and limit its height. We use the menu as the target and #modalSelection: as the selector so that we  get the language name as the result"
	ScratchTranslator languageNames do: [:lang|
				((ScratchTranslator isoCodeForName: lang) = (ScratchTranslator currentLanguage))
			ifTrue: [menu add: ScratchTranslator bulletPrefix, lang target: menu selector: #modalSelection: argument: lang]
			ifFalse: [menu add: lang target: menu selector: #modalSelection: argument: lang]].
	
	menu limitHeightTo: (self height * 3/4).
	
	choice := menu invokeModalAt: aToggleButtonMorph bottomLeft + (0@3) in: ActiveWorld.
	choice ifNotNil:[self setLanguageFromMenuChoice: choice]! !
