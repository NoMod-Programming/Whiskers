
!StringDialog class methodsFor: 'instance creation' stamp: 'EMP 11/5/2017 17:25'!
askWithCancel: questionString initialAnswer: aString title: titleString
	"Put up an instance of me to ask the user for string input (such as file name). The initial response text is set to the given string, which the user can replace or edit. This version includes a cancel button. Answer the empty string if cancelled."

	| dialogBox |
	dialogBox := self new
		withButtonsForYes: false no: false okay: true cancel: true;
		message: questionString;
		initialAnswer: aString;
		title: titleString.
	^ dialogBox getUserResponse
! !
