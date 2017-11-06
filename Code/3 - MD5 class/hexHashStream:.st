
!MD5 class methodsFor: 'accessing' stamp: 'EMP 11/3/2017 22:17'!
hexHashStream: aStream
	^ (String streamContents: [:m |
		(MD5 hashStream: aStream) do: [:d |
			m nextPutAll: ((d radix: 16) padded: #left to: 2 with: $0)
		]
	]) asLowercase! !
