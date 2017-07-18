
!KeyHolder methodsFor: 'services' stamp: 'RJT 2/9/2007 10:34'!
key
	^[(TripleDES key: self random) cbc decrypt: self data key] on: CryptographyError do: [:ex | ex retry]! !
