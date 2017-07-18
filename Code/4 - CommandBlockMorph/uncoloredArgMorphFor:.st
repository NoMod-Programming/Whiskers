
!CommandBlockMorph methodsFor: 'private' stamp: 'EMP 7/16/2017 18:00'!
uncoloredArgMorphFor: specString
	"Answer an argument morph for the given argument specification string."
	| code |
	code _ specString copyFrom: 2 to: (specString size).
	'm.rotationStyle' = code ifTrue: [^ ChoiceArgMorph new choice: 'left-right'; options: #(#'left-right' #'don''t rotate' #'all around')].
	'm.attribute' = code ifTrue: [^ AttributeArgMorph new choice: 'volume'].
	'b' = code ifTrue: [^ BooleanArgMorph new].
	'm.stop' = code ifTrue: [^ ChoiceArgMorph new choice: 'all'; options: #(#'all' #'this script' #'other scripts in sprite')].
	'm.colorPicker' = code ifTrue: [^ ColorArgMorph new showPalette: true].
	'c' = code ifTrue: [^ ColorArgMorph new showPalette: false].  "don't use palette; pick from screen"
	'd.direction' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '0'; menuSelector: #directionMenu].
	'd.drum' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '48'; menuSelector: #midiDrumMenu].
	'm.broadcast' = code ifTrue: [^ EventTitleMorph new].
	'm.mathOp' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #mathFunctionNames; choice: 'sqrt'].
	'm.effect' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #graphicEffectNames; choice: 'color'].
	'm.sensor' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #hookupSensorNames].
	'm.booleanSensor' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #hookupBooleanSensorNames].
	'd.instrument' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #midiInstrumentMenu].
	'd.listItem' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #listIndexMenu].
	'm.key' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #keyNames; choice: 'space'].
	'm.list' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #listVarMenu].
	'm.costume' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #costumeNames; choice: 'costume1'].
	'm.spriteOnly' = code ifTrue: [^ SpriteArgMorph new type: #spriteOnly].
	'm.spriteOrMouse' = code ifTrue: [^ SpriteArgMorph new type: #spriteOrMouse].
	'm.spriteOrStage' = code ifTrue: [^ SpriteArgMorph new type: #spriteOrStage].
	'm.location' = code ifTrue: [^ SpriteArgMorph new type: #location].
	'm.touching' = code ifTrue: [^ SpriteArgMorph new type: #touching].
	'M' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #motorNames].
	'n' = code ifTrue: [^ ExpressionArgMorph new numExpression: '10'].
	'd.note' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '60'; menuSelector: #noteSelector].
	's' = code ifTrue: [^ ExpressionArgMorph new stringExpression: ''].
	'm.sound' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #soundNames; choice: 'pop'].
	'm.var' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #varNamesMenu; choice: ''].
	'm.backdrop' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #backdropNames; choice: 'backdrop1'].
	'm.motorDirection' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #motorDirection].
	'd.listDeleteItem' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #listIndexForDeleteMenu].
	'm.timeAndDate' = code ifTrue: [^ ChoiceArgMorph new choice: 'minute'; options: #(#'year' #'month' #'date' #'day of week' #'hour' #'minute' #'second')].
	^ ExpressionArgMorph new numExpression: '10'! !
