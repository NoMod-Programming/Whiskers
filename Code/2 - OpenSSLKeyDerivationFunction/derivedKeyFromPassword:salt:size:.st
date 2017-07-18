
!OpenSSLKeyDerivationFunction methodsFor: 'as yet unclassified' stamp: 'rww 9/26/2006 15:45'!
derivedKeyFromPassword: password salt: salt size: size

	| result block digest |
	result := ByteArray new.
	digest := ByteArray new.
	(size + 15 // 16) timesRepeat: [
		block := digest, password, salt.
		digest := MD5 hashMessage: block.
		result := result, digest].
	^ result readStream next: size.

! !
