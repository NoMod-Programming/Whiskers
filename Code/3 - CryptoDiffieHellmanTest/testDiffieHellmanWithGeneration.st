

!CryptoDiffieHellmanTest methodsFor: 'testing' stamp: 'rww 10/5/2006 15:51'!

testDiffieHellmanWithGeneration



	| alice bob fromAlice fromBob k1 k2 |

	alice := DiffieHellman bits: 64.  "very low for speed"

	bob := DiffieHellman prime: alice prime generator: alice generator.

	fromAlice := alice sendMessage.

	fromBob := bob sendMessage.

	k1 := alice receiveMessage: fromBob.

	k2 := bob receiveMessage: fromAlice.

	self assert: k1 = k2! !

