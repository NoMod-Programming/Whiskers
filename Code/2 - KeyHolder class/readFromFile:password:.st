
!KeyHolder class methodsFor: 'instance creation' stamp: 'RJT 2/10/2007 22:10'!
readFromFile: aFileName password: aPassword
	"this method takes a long time on purpose, the idea is to increase the amount of time and resources needed to crack password"
	| pwHash cipher cData pwHashAndSalt pwSalt eData aStream aKeyHolder |
	[eData := ((aStream := FileStream fileNamed: aFileName) ifNil: [^nil]) binary contents asByteArray] ensure: [aStream close].
	pwSalt := eData copyFrom: eData size - 31 to: eData size.
	eData := eData copyFrom: 1 to: eData size - 32.
	pwHashAndSalt := PasswordSaltAndStretch hashForPassword: aPassword s: pwSalt.
	pwHash := pwHashAndSalt key.
	pwSalt := pwHashAndSalt value.
	cipher := (TripleDES key: pwHash) cbc.
	cData := cipher decrypt: eData.
	aKeyHolder := self holdKey: cData.
	cData destroy.
	^aKeyHolder
	! !
