

!CryptoRijndaelTest methodsFor: 'others' stamp: 'rww 10/5/2006 07:02'!

testEncryptDecrypt

	BlockCipherMode allSubclasses asArray do:

		[ : each |

		[ self runEncryptDecrypt: each ]

			on: Warning

			do: [ : warn | warn resume ] ]! !

