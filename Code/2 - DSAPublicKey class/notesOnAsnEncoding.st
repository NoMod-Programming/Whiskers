

!DSAPublicKey class methodsFor: 'examples' stamp: 'rww 1/2/2003 02:31'!

notesOnAsnEncoding



"Smalltalk at: #ASN1Constants put: Dictionary new!!

ASN1Constants at: #classApplication put:  64!!

ASN1Constants at: #classContextSpecific put:  128!!

ASN1Constants at: #classPrivate put:  192!!

ASN1Constants at: #classUniversal put:  0!!

ASN1Constants at: #idBitString put:  3!!

ASN1Constants at: #idBoolean put:  1!!

ASN1Constants at: #idIA5String put:  22!!

ASN1Constants at: #idInteger put:  2!!

ASN1Constants at: #idNull put:  5!!

ASN1Constants at: #idObjectIdentifier put:  6!!

ASN1Constants at: #idOctetString put:  4!!

ASN1Constants at: #idPrintableString put:  19!!

ASN1Constants at: #idSequence put:  16!!

ASN1Constants at: #idSet put:  17!!

ASN1Constants at: #idUTCTime put:  23!!

ASN1Constants at: #maskClass put:  192!!

ASN1Constants at: #maskConstructed put:  32!!

ASN1Constants at: #maskTag put:  31!!

ASN1Constants at: #tagHigh put:  31!!



Transcript show: 'ASN1ObjectIdentifiers'; cr!!

Smalltalk at: #ASN1ObjectIdentifiers put: Dictionary new!!

ASN1ObjectIdentifiers at: #x1x2x840x10040x4x1 put:  ('id-dsa')!!

ASN1ObjectIdentifiers at: #x1x2x840x10040x4x3 put:  ('id-dsa-with-sha1')!!

ASN1ObjectIdentifiers at: #x1x2x840x113533x7x65x0 put:  ('entrustVersion')!!

ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x1 put:  ('rsaEncryption')!!

ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x2 put:  ('md2WithRSAEncryption')!!

ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x4 put:  ('md5WithRSAEncryption')!!

ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x5 put:  ('sha-1WithRSAEncryption')!!

ASN1ObjectIdentifiers at: #x1x2x840x113549x1x9x1 put:  ('e-mailAddress')!!

ASN1ObjectIdentifiers at: #x1x3x14x3x2x12 put:  ('dsa')!!

ASN1ObjectIdentifiers at: #x1x3x14x3x2x27 put:  ('dsa With SHA1')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x1 put:  ('netscapeCertificateType')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x12 put:  ('SslServerName')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x13 put:  ('netscapeCertificateComment')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x2 put:  ('BaseURL')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x3 put:  ('RevocationURL')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x4 put:  ('CARevocationURL')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x7 put:  ('renewalURL')!!

ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x8 put:  ('netscapeCaPolicyURL')!!

ASN1ObjectIdentifiers at: #x2x5x29x14 put:  ('subjectKeyIdentifier')!!

ASN1ObjectIdentifiers at: #x2x5x29x15 put:  ('keyUsage')!!

ASN1ObjectIdentifiers at: #x2x5x29x16 put:  ('privateKeyUsagePeriod')!!

ASN1ObjectIdentifiers at: #x2x5x29x17 put:  ('subjectAlternativeName')!!

ASN1ObjectIdentifiers at: #x2x5x29x18 put:  ('issuerAlternativeName')!!

ASN1ObjectIdentifiers at: #x2x5x29x19 put:  ('basicConstraints')!!

ASN1ObjectIdentifiers at: #x2x5x29x20 put:  ('cRLNumber')!!

ASN1ObjectIdentifiers at: #x2x5x29x21 put:  ('reasonCode')!!

ASN1ObjectIdentifiers at: #x2x5x29x23 put:  ('holdInstructionCode')!!

ASN1ObjectIdentifiers at: #x2x5x29x24 put:  ('invalidityDate')!!

ASN1ObjectIdentifiers at: #x2x5x29x27 put:  ('deltaCRLIndicator')!!

ASN1ObjectIdentifiers at: #x2x5x29x28 put:  ('issuingDistributionPoint')!!

ASN1ObjectIdentifiers at: #x2x5x29x29 put:  ('certificateIssuer')!!

ASN1ObjectIdentifiers at: #x2x5x29x3 put:  ('certificate policies - old')!!

ASN1ObjectIdentifiers at: #x2x5x29x30 put:  ('nameConstraints')!!

ASN1ObjectIdentifiers at: #x2x5x29x31 put:  ('cRLDistributionPoints')!!

ASN1ObjectIdentifiers at: #x2x5x29x32 put:  ('certificatePolicies')!!

ASN1ObjectIdentifiers at: #x2x5x29x33 put:  ('policyMappings')!!

ASN1ObjectIdentifiers at: #x2x5x29x35 put:  ('authorityKeyIdentifier')!!

ASN1ObjectIdentifiers at: #x2x5x29x36 put:  ('policyConstraints')!!

ASN1ObjectIdentifiers at: #x2x5x4x10 put:  ('O')!!

ASN1ObjectIdentifiers at: #x2x5x4x11 put:  ('OU')!!

ASN1ObjectIdentifiers at: #x2x5x4x13 put:  ('??')!!

ASN1ObjectIdentifiers at: #x2x5x4x3 put:  ('CN')!!

ASN1ObjectIdentifiers at: #x2x5x4x6 put:  ('C')!!

ASN1ObjectIdentifiers at: #x2x5x4x7 put:  ('L')!!

ASN1ObjectIdentifiers at: #x2x5x4x8 put:  ('S')!!

ASN1ObjectIdentifiers at: #x2x5x8x1x1 put:  ('rsa')!!

"! !

