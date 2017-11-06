
!EventTitleMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 16:13'!
presentMenu
	| eventNames menu frameHeight |
	eventNames := #().
	self ownerScratchFrame
		ifNotNil: [:sFrame | eventNames := sFrame workPane allEventNames.
			frameHeight := sFrame height]
		ifNil:[frameHeight:= 400].

	menu := ScratchMenuMorph new itemHeight: 22; color: color.

	eventNames do: [:ev|
		menu add:  ev asString target: self selector: #eventName: argument: ev].
	menu addLine. 
	menu add: 'new' localized, '/', 'edit' localized, ScratchTranslator ellipsesSuffix target: self selector: #addNewMessageName.

	menu limitHeightTo: frameHeight * 3/4.
	menu popUpInWorld! !
