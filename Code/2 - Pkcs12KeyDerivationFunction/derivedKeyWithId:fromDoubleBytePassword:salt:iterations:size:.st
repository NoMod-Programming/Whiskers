
!Pkcs12KeyDerivationFunction methodsFor: 'as yet unclassified' stamp: 'rww 3/30/2007 09:18'!
derivedKeyWithId: id fromDoubleBytePassword: passIn salt: saltIn iterations: iterate size: size

	| password salt diversifier initial final digest v u pLen sLen c k buffer ij |
	v := 64.
	u := 20.
	diversifier := ByteArray new: v withAll: id.
	pLen := v * (passIn size + v - 1 // v).
	sLen := v * (saltIn size + v - 1 // v).
	k := (passIn size + v - 1 // v) + (saltIn size + v - 1 // v).

	password := self passwordBufferFromPassword: passIn length: pLen.
	salt := self saltBufferFromSalt: saltIn length: sLen.
	initial := salt, password.
	c := size + u - 1 // u.
	final := ByteArray new.
	1 to: c do: [:idx |
		digest := diversifier, initial.
		iterate timesRepeat: [digest := SHA1 hashMessage: digest].
		final := final, digest.
		buffer := self copyResult: digest toBufferOfSize: v.
		0 to: k - 1 do: [:j |
			ij := initial copyFrom: v*j + 1 to: v*(j+1).
			ij := (ij asInteger + buffer asInteger + 1) asByteArray.
			ij size > v ifTrue: [ij := ij copyFrom: 2 to: v+1].
			ij size < v ifTrue: [ij := ij, (ByteArray new: v - ij size withAll: 0)].
			initial replaceFrom: v*j + 1 to: v*(j+1) with: ij]].
	^ final copyFrom: 1 to: size.! !
