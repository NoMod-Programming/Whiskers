

!ARC4 methodsFor: 'accessing' stamp: 'rww 4/10/2007 17:54'!

encrypt: aByteArray

	| newBytes |

	newBytes := aByteArray copy.

	1 to: aByteArray size do: [ :each | newBytes at: each put: ((aByteArray at: each) bitXor: self next)].

	^ newBytes! !

