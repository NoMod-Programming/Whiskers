
!StringFieldMorph methodsFor: 'event handling' stamp: 'EMP 7/17/2017 11:59'!
keyboardFocusChange: amGettingFocus
	"Set my color to show whether I have focus."

	(amGettingFocus and: [isKeyboardFocus not]) ifTrue: [
		lastContents := stringMorph contents].

	(isKeyboardFocus and: [amGettingFocus not]) ifTrue: [
		lastContents := nil.
		isNumeric ifTrue: [
			self contents: stringMorph contents asNumberNoError printStringNoExponent].
		acceptWhenFocusLost ifTrue: [self acceptEdits]].

	isKeyboardFocus := amGettingFocus.
	isKeyboardFocus ifTrue: [
		selectionStart := 0. 
		selectionEnd := stringMorph contents size.
		ActiveHand compositionWindowManager keyboardFocusForAMorph: self].
	(owner notNil and: [owner isCustomBlockLabel]) ifTrue: [
		isKeyboardFocus
			ifTrue: [owner lightColor]
			ifFalse: [owner darkColor]
	].
	self changed.
! !
