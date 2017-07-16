
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:09'!
readDictionary
	| m k v needComma |
	m := JsonObject new.
	needComma := false.
	[
		self skipWhitespace.
		(stream peekFor: $}) ifTrue: [ ^ m].
		needComma
			ifTrue: [ (stream peekFor: $,) ifFalse: [JsonInvalidError signal: 'Missing comma'].
					self skipWhitespace]
			ifFalse: [needComma := true].
"		k := self readAny. "
		(stream peekFor: $") ifFalse: [JsonInvalidError signal: 'Key in dictionary must be string'].
		k := self readString.
		self skipWhitespace.
		(stream peekFor: $:) ifFalse: [JsonInvalidError signal: 'Missing colon'].
		v := self readAny.
		m at: k put: v.
	] repeat.
! !
