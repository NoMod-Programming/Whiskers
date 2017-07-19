

!Pkcs12KeyDerivationFunction methodsFor: 'private' stamp: 'rww 3/30/2007 08:57'!

passwordBufferFromPassword: pass length: pLen



	| password |

	password := ByteArray new: pLen.

	0 to: pLen-1 do: [:i | password at: i + 1 put: (pass at: (i \\ pass size + 1))].

	^ password! !

