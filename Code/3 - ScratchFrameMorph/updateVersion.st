
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/14/2017 19:41'!
updateVersion
	| response |
	response := StringDialog askWithCancel: 'New Version?' initialAnswer: (Version substrings first). "Why not? I'll use regexes whenever I want for my developer stuff"
	response = #cancelled ifFalse: [
		Version := response, ((DialogBoxMorph ask: 'Release?') ifTrue: [' (release '] ifFalse: [' (internal ']), (Date today printFormat: #(1 2 3 $- 2 2)), ')'.
		VersionDate := Date today printFormat: #(3 2 1 $- 1 1).
	].
	self saveImageForEndUser.! !