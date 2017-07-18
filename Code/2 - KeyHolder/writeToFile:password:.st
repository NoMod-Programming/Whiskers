
!KeyHolder methodsFor: 'services' stamp: 'RJT 2/9/2007 16:13'!
writeToFile: aFileName password: aPassword
	"this method takes a long time on purpose, the idea is to increase the amount of time and resources needed to crack password"
	| pwHash cipher cData pwHashAndSalt pwSalt |
	pwHashAndSalt := PasswordSaltAndStretch hashForPassword: aPassword.
	pwHash := pwHashAndSalt key.
	pwSalt := pwHashAndSalt value.
	cipher := (TripleDES key: pwHash) cbc.
	cData := cipher encrypt: self key.
	(FileStream forceNewFileNamed: aFileName)
		nextPutAll: cData;
		nextPutAll: pwSalt;
		close.
	! !
