
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:08'!
consume: aString returning: anObject
	|v|
	aString do: [:c |
		v := stream next.
		v ifNil: [JsonIncompleteError signal: 'Incomplete ''', aString, ''' seen'].
		v == c ifFalse: [JsonInvalidError signal: 'Expected ''', aString, ''''] ].
	^ anObject! !
