
!SecureRandom class methodsFor: 'instance creation' stamp: 'len 8/4/2002 00:18'!
fromUser
	"Ask the user to type a long random string and use the result to seed the secure random number generator."

	| string |
	string := FillInTheBlank request: 'Enter a long random string to seed the random generator.'.
	^ self key: string! !
