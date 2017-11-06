
!ScriptableScratchMorph methodsFor: 'list ops' stamp: 'EMP 11/5/2017 17:07'!
deleteList
"Ask user for the list to delete and remove it"
	| sFrame stage menu  |

	sFrame := self ownerScratchFrame.
	sFrame
		ifNil: [^ self].
	stage := sFrame workPane.
	stage listVarNames isEmpty & self listVarNames isEmpty
		ifTrue: [^ self inform: 'No lists.' localized].
	menu := ScratchMenuMorph new.
	stage listVarNames
		do: [:v | menu
				add: v
				target: stage
				selector: #deleteList:
				argument: v].
	self = stage
		ifFalse: [stage listVarNames isEmpty | self listVarNames isEmpty
				ifFalse: [menu addLine].
			self listVarNames
				do: [:v | menu
						add: v
						target: self
						selector: #deleteList:
						argument: v]].

	menu limitHeightTo: sFrame height * 3 / 4.
	menu popUpInWorld! !
