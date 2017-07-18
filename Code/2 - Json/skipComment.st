
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:09'!
skipComment
	stream peek == $/ ifTrue: [
		stream next.
		stream peek == $/
			ifTrue: [self skipToEndOfLine]
			ifFalse: [stream peek == $*
						ifTrue: [stream next. self skipCommentBody]
						ifFalse: [JsonInvalidError signal: 'Invalid comment syntax']]]
! !
