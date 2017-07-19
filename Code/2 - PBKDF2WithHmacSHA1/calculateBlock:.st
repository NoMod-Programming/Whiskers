

!PBKDF2WithHmacSHA1 methodsFor: 'private' stamp: 'rww 10/12/2016 21:22'!

calculateBlock: blockNumber



	| result iterationBytes u |

	iterationBytes := blockNumber sizeAsFourBytes.

	result := u := self mac: (self salt, iterationBytes).

	2 to: iterations do: [:i |

		u := self mac: u.

		result := result bitXor: u.

	].

	^ result! !

