

!MD4 methodsFor: 'copying' stamp: 'LC 10/26/2001 19:23'!

copy64: anArray startingAt: n 

	| array u answer |

	array := anArray collect: [:char | char asInteger].

	answer := Array new: 16.

	1 to: answer size

		do: 

			[:i | 

			u := (array at: i - 1 * 4 + 3 + n) << 24.

			u := u bitOr: (array at: i - 1 * 4 + 2 + n) << 16.

			u := u bitOr: (array at: i - 1 * 4 + 1 + n) << 8.

			u := u bitOr: (array at: i - 1 * 4 + 0 + n) << 0.

			answer at: i put: u].

	^ answer! !

