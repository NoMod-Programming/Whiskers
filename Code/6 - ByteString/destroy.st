
!ByteString methodsFor: '*Cryptography-RandomAndPrime' stamp: 'RJT 5/7/2007 10:45'!
destroy
	"destroy this string by replacing every character with a space"
	1 to: self size do: [:i | 
		self at: i put: Character space
	]! !
