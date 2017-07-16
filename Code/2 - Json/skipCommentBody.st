
!Json methodsFor: 'private' stamp: 'Igor.Stasenko 4/7/2010 01:22'!
skipCommentBody
	[
		[stream next == $*] whileFalse.
		stream peek == $/
	] whileFalse.
	stream next. "skip that last slash"
	self skipWhitespace.! !
