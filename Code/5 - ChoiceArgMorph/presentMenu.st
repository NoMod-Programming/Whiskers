
!ChoiceArgMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 16:13'!
presentMenu
	"Pop up a menu of choices."

	| optionList menu frameHeight doLocalization option |
	<pragma: #i18nIssue>
	optionList  :=  self options.
	optionList size = 0 ifTrue: [^ self].

	menu  :=  ScratchMenuMorph new defaultTarget: self; itemHeight: 22; color: color.

	doLocalization := (#(#costumeNames #soundNames #varNamesMenu #listVarMenu ) includes: getOptionsSelector) not.

	optionList do: [:sym | '-' = sym
				ifTrue: [menu addLine]
				ifFalse: [doLocalization & sym isUnicode not
						ifTrue: [option := sym localized]
						ifFalse: [option := sym].
					((#(#hookupSensorNames #hookupBooleanSensorNames ) includes: getOptionsSelector)
							and: [#(#connected #resistance ) includes: sym])
						ifTrue: [#(#A #B #C #D )
								do: [:c | self owner isBooleanReporter
										ifTrue: [menu
												add: c , ' ' , option
												selector: #choice:
												argument: c , ' ' , sym]
										ifFalse: [menu
												add: option , '-' , c
												selector: #choice:
												argument: sym , '-' , c]]]
						ifFalse: [menu
								add: option
								selector: #choice:
								argument: sym]]].


	"roughly how many entries could fit into 3/4 of my frame's height?"
	frameHeight := self ownerScratchFrame ifNil:[300] ifNotNil:[:thing| thing height].
	 menu limitHeightTo: frameHeight * 3/4.

	menu popUpInWorld
! !
