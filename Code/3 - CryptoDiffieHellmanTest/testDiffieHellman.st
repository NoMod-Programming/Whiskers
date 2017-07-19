

!CryptoDiffieHellmanTest methodsFor: 'testing' stamp: 'rww 10/5/2006 15:48'!

testDiffieHellman



	| alice bob fromAlice fromBob k1 k2 |

	alice := DiffieHellman prime: self prime generator: self generator.

	bob := DiffieHellman prime: self prime generator: self generator.

	fromAlice := alice sendMessage.

	fromBob := bob sendMessage.

	k1 := alice receiveMessage: fromBob.

	k2 := bob receiveMessage: fromAlice.

	self assert: k1 = k2! !

