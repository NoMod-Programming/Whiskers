
!ASN1DefinitionModel methodsFor: 'services pragma' stamp: 'RJT 9/2/2006 23:07'!
getPragmaMutators
	"return the pragmas defined on this class.  These values are usually put in the mutator of the ivar, but could be in other regular methods if it is appropriate.  The form of the pragma is <asn1FieldMutator: 'put the name of the field from the right hand side of the asn1Definition here' class: #ClassOfMutatorArgument>.    Use symbol for class because of monticello loading problems.
	for example if you have an ivar named: #title that has a definition 
		MyASN1Object ::= Sequence {
			asn1Title	DisplayableString
		}
		then the mutaotr for title should look like this:
		title: aTitle
			
			<asn1FieldMutator: 'asn1Title' class: #String>
			title := aTitle.
		
	Every field definition in the asn1Defintion string must have a corresponding pragma"
	
	^(Pragma allNamed: #asn1FieldMutator:class: in: self subject) collect: [:aPragma | ASN1PragmaMutator fromPragma: aPragma].! !
