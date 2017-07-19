

!RSAEncryptionScheme methodsFor: 'mask generator' stamp: 'cs 8/12/2002 13:23'!

maskOfLength: numberOfBytes fromString: seedString

	| t c |

	numberOfBytes > ((2 raisedTo: 32) * hashLen) ifTrue: 

		[self error: 'mask too long'].

	t := ByteArray new.

	0 to: (numberOfBytes / hashLen) floor do: [:counter |

		c := counter asByteArrayOfSize: 4.

		t := t, ((hash hashMessage: seedString, c) asByteArrayOfSize: hashLen)].

	^ t copyFrom: 1 to: numberOfBytes

! !

