

!ASN1DefinitionModel methodsFor: 'services pragma' stamp: 'RJT 9/2/2006 23:03'!

getPragmaAccessors

	"return the pragmas defined on this class.  These values are usually put in the accessor of the ivar, but could be in other regular methods if it is appropriate.  The form of the pragma is <asn1FieldAccessor: 'put the name of the field from the left hand side of the asn1Definition here'>.  

	for example if you have an ivar named: #title that has a definition 

		MyASN1Object ::= Sequence {

			asn1Title	DisplayableString

		}

		then the accessor for title should look like this:

		title

			

			<asn1FieldAccessor: 'asn1Title'>

			^title

		

	Every field definition in the asn1Defintion string must have a corresponding pragma"

	

	^(Pragma allNamed: #asn1FieldAccessor: in: self subject) collect: [:aPragma | ASN1PragmaAccessor fromPragma: aPragma].! !

