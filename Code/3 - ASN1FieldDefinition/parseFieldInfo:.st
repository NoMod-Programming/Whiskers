
!ASN1FieldDefinition methodsFor: 'parsing' stamp: 'RJT 9/8/2006 15:16'!
parseFieldInfo: fieldInfo
	"fill the current instance with fieldInformation"
	| subStrings explodedString noTagIndexString |
	subStrings := fieldInfo subStrings.
	self fieldName: subStrings first.
	noTagIndexString :=  (fieldInfo includes: $[) ifTrue: [
		self tagIndex: (fieldInfo copyFrom: (fieldInfo indexOf: $[) + 1 to: (fieldInfo indexOf: $]) - 1).
		(fieldInfo copyFrom:  1 to: (fieldInfo indexOf: $[) -1), (fieldInfo copyFrom: (fieldInfo indexOf: $]) +1 to: fieldInfo size).
	] ifFalse: [
		fieldInfo
	].
	explodedString := noTagIndexString subStrings asOrderedCollection.
	(explodedString includes: 'EXPLICIT') ifTrue: [
		explodedString := explodedString remove: 'EXPLICIT'; yourself.
		self isExplicit: true.
	].
	(explodedString includes: 'OPTIONAL') ifTrue: [
		explodedString := explodedString remove: 'OPTIONAL'; yourself.
		self isOptional: true.
	].
	(explodedString includes: 'DEFAULT') ifTrue: [
		explodedString := explodedString remove: 'DEFAULT'; yourself.
		self defaultValue: explodedString last.
		explodedString remove: explodedString last.
	].
	self tagType: explodedString last.! !
