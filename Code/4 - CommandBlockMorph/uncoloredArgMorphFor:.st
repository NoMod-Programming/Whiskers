
!CommandBlockMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 22:58'!
uncoloredArgMorphFor: code
	"Answer an argument morph for the given argument specification string."

	'%a' = code ifTrue: [^ AttributeArgMorph new choice: 'volume'].
	'%b' = code ifTrue: [^ BooleanArgMorph new].
	'%c' = code ifTrue: [^ ColorArgMorph new showPalette: true].
	'%C' = code ifTrue: [^ ColorArgMorph new showPalette: false].  "don't use palette; pick from screen"
	'%d' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '0'; menuSelector: #directionMenu].
	'%D' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '48'; menuSelector: #midiDrumMenu].
	'%e' = code ifTrue: [^ EventTitleMorph new].
	'%f' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #mathFunctionNames; choice: 'sqrt'].
	'%g' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #graphicEffectNames; choice: 'color'].
	'%H' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #hookupSensorNames].
	'%h' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #hookupBooleanSensorNames].
	'%I' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #midiInstrumentMenu].
	'%i' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #listIndexMenu].
	'%k' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #keyNames; choice: 'space'].
	'%L' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #listVarMenu].
	'%l' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #costumeNames; choice: 'costume1'].
	'%m' = code ifTrue: [^ SpriteArgMorph new].
	'%M' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #motorNames].
	'%n' = code ifTrue: [^ ExpressionArgMorph new numExpression: '10'].
	'%N' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '60'; menuSelector: #noteSelector].
	'%s' = code ifTrue: [^ ExpressionArgMorph new stringExpression: ''].
	'%S' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #soundNames; choice: 'pop'].
	'%v' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #varNamesMenu; choice: ''].
	'%W' = code ifTrue: [^ ChoiceArgMorph new getOptionsSelector: #motorDirection].
	'%x' = code ifTrue: [^ ChoiceOrExpressionArgMorph new getOptionsSelector: #sceneNames; choice: ''].
	'%y' = code ifTrue: [^ ExpressionArgMorphWithMenu new numExpression: '1'; menuSelector: #listIndexForDeleteMenu].

	^ ExpressionArgMorph new numExpression: '10'
! !
