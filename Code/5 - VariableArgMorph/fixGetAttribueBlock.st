
!VariableArgMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 18:16'!
fixGetAttribueBlock
	"If my owner is a get attribute block, make sure that the attribute is consistent the the type of the target sprite or stage."

	| attributeArg possibleAttributes |
	morph ifNil: [^ self].
	((owner isReporterBlockMorph) and: [owner selector = #getAttribute:of:]) ifFalse: [^ self].

	attributeArg := owner submorphs detect: [:m | m isAttributeArgMorph] ifNone: [^ self].

	possibleAttributes := morph attributeNames, morph varNames.
	(possibleAttributes includes: attributeArg choice) ifFalse: [
		 attributeArg choice: possibleAttributes first].
! !
