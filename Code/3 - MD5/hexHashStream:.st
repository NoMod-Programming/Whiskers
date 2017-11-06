
!MD5 methodsFor: 'accessing' stamp: 'EMP 11/3/2017 21:50'!
hexHashStream: aStream
	(String streamContents: [:m |
		(MD5 hashStream: aStream) do: [:d |
			m nextPutAll: (d radix: 16)
		]
	]) asLowercase! !
