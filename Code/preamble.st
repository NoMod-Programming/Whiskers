BlockCipher subclass: #ARC2
	instanceVariableNames: 'T1 T8 TM keyHolder j'
	classVariableNames: 'PITABLE'
	poolDictionaries: ''
	category: 'Cryptography-ARC2'!

!ARC2 commentStamp: 'RJT 3/30/2007 09:48' prior: 0!
Network Working Group                                          R. Rivest
Request for Comments: 2268           MIT Laboratory for Computer Science
Category: Informational                      and RSA Data Security, Inc.
                                                              March 1998


            
A Description of the RC2(r) Encryption Algorithm


Status of this Memo

   This memo provides information for the Internet community.  It does
   not specify an Internet standard of any kind.  Distribution of this
   memo is unlimited.

Copyright Notice

   Copyright (C) The Internet Society (1998).  All Rights Reserved.

1. Introduction


   This memo is an RSA Laboratories Technical Note.  It is meant for
   informational use by the Internet community.

   This memo describes a conventional (secret-key) block encryption
   algorithm, called RC2, which may be considered as a proposal for a
   DES replacement. The input and output block sizes are 64 bits each.
   The key size is variable, from one byte up to 128 bytes, although the
   current implementation uses eight bytes.

   The algorithm is designed to be easy to implement on 16-bit
   microprocessors. On an IBM AT, the encryption runs about twice as
   fast as DES (assuming that key expansion has been done).

1.1 Algorithm description


   We use the term "word" to denote a 16-bit quantity. The symbol + will
   denote twos-complement addition. The symbol & will denote the bitwise
   "and" operation. The term XOR will denote the bitwise "exclusive-or"
   operation. The symbol ~ will denote bitwise complement.  The symbol ^
   will denote the exponentiation operation.  The term MOD will denote
   the modulo operation.

   There are three separate algorithms involved:

     Key expansion. This takes a (variable-length) input key and
     produces an expanded key consisting of 64 words K[0],...,K[63].





Rivest                       Informational                      [Page 1]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


     Encryption. This takes a 64-bit input quantity stored in words
     R[0], ..., R[3] and encrypts it "in place" (the result is left in
     R[0], ..., R[3]).

     Decryption. The inverse operation to encryption.

2. Key expansion


   Since we will be dealing with eight-bit byte operations as well as
   16-bit word operations, we will use two alternative notations

   for referring to the key buffer:

        For word operations, we will refer to the positions of the
             buffer as K[0], ..., K[63]; each K[i] is a 16-bit word.

        For byte operations,  we will refer to the key buffer as
             L[0], ..., L[127]; each L[i] is an eight-bit byte.

   These are alternative views of the same data buffer. At all times it
   will be true that

                       K[i] = L[2*i] + 256*L[2*i+1].

   (Note that the low-order byte of each K word is given before the
   high-order byte.)

   We will assume that exactly T bytes of key are supplied, for some T
   in the range 1 <= T <= 128. (Our current implementation uses T = 8.)
   However, regardless of T, the algorithm has a maximum effective key
   length in bits, denoted T1. That is, the search space is 2^(8*T), or
   2^T1, whichever is smaller.

   The purpose of the key-expansion algorithm is to modify the key
   buffer so that each bit of the expanded key depends in a complicated
   way on every bit of the supplied input key.

   The key expansion algorithm begins by placing the supplied T-byte key
   into bytes L[0], ..., L[T-1] of the key buffer.

   The key expansion algorithm then computes the effective key length in
   bytes T8 and a mask TM based on the effective key length in bits T1.
   It uses the following operations:

   T8 = (T1+7)/8;
   TM = 255 MOD 2^(8 + T1 - 8*T8);

   Thus TM has its 8 - (8*T8 - T1) least significant bits set.



Rivest                       Informational                      [Page 2]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


   For example, with an effective key length of 64 bits, T1 = 64, T8 = 8
   and TM = 0xff.  With an effective key length of 63 bits, T1 = 63, T8
   = 8 and TM = 0x7f.

   Here PITABLE[0], ..., PITABLE[255] is an array of "random" bytes
   based on the digits of PI = 3.14159... . More precisely, the array
   PITABLE is a random permutation of the values 0, ..., 255. Here is
   the PITABLE in hexadecimal notation:

        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
   00: d9 78 f9 c4 19 dd b5 ed 28 e9 fd 79 4a a0 d8 9d
   10: c6 7e 37 83 2b 76 53 8e 62 4c 64 88 44 8b fb a2
   20: 17 9a 59 f5 87 b3 4f 13 61 45 6d 8d 09 81 7d 32
   30: bd 8f 40 eb 86 b7 7b 0b f0 95 21 22 5c 6b 4e 82
   40: 54 d6 65 93 ce 60 b2 1c 73 56 c0 14 a7 8c f1 dc
   50: 12 75 ca 1f 3b be e4 d1 42 3d d4 30 a3 3c b6 26
   60: 6f bf 0e da 46 69 07 57 27 f2 1d 9b bc 94 43 03
   70: f8 11 c7 f6 90 ef 3e e7 06 c3 d5 2f c8 66 1e d7
   80: 08 e8 ea de 80 52 ee f7 84 aa 72 ac 35 4d 6a 2a
   90: 96 1a d2 71 5a 15 49 74 4b 9f d0 5e 04 18 a4 ec
   a0: c2 e0 41 6e 0f 51 cb cc 24 91 af 50 a1 f4 70 39
   b0: 99 7c 3a 85 23 b8 b4 7a fc 02 36 5b 25 55 97 31
   c0: 2d 5d fa 98 e3 8a 92 ae 05 df 29 10 67 6c ba c9
   d0: d3 00 e6 cf e1 9e a8 2c 63 16 01 3f 58 e2 89 a9
   e0: 0d 38 34 1b ab 33 ff b0 bb 48 0c 5f b9 b1 cd 2e
   f0: c5 f3 db 47 e5 a5 9c 77 0a a6 20 68 fe 7f c1 ad

   The key expansion operation consists of the following two loops and
   intermediate step:

   for i = T, T+1, ..., 127 do
     L[i] = PITABLE[L[i-1] + L[i-T]];

   L[128-T8] = PITABLE[L[128-T8] & TM];

   for i = 127-T8, ..., 0 do
     L[i] = PITABLE[L[i+1] XOR L[i+T8]];

   (In the first loop, the addition of L[i-1] and L[i-T] is performed
   modulo 256.)

   The "effective key" consists of the values L[128-T8],..., L[127].
   The intermediate step's bitwise "and" operation reduces the search
   space for L[128-T8] so that the effective number of key bits is T1.
   The expanded key depends only on the effective key bits, regardless






Rivest                       Informational                      [Page 3]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


   of the supplied key K. Since the expanded key is not itself modified
   during encryption or decryption, as a pragmatic matter one can expand
   the key just once when encrypting or decrypting a large block of
   data.

3. Encryption algorithm


   The encryption operation is defined in terms of primitive "mix" and
   "mash" operations.

   Here the expression "x rol k" denotes the 16-bit word x rotated left
   by k bits, with the bits shifted out the top end entering the bottom
   end.

3.1 Mix up R[i]


   The primitive "Mix up R[i]" operation is defined as follows, where
   s[0] is 1, s[1] is 2, s[2] is 3, and s[3] is 5, and where the indices
   of the array R are always to be considered "modulo 4," so that R[i-1]
   refers to R[3] if i is 0 (these values are

   "wrapped around" so that R always has a subscript in the range 0 to 3
   inclusive):

   R[i] = R[i] + K[j] + (R[i-1] & R[i-2]) + ((~R[i-1]) & R[i-3]);
   j = j + 1;
   R[i] = R[i] rol s[i];

   In words: The next key word K[j] is added to R[i], and j is advanced.
   Then R[i-1] is used to create a "composite" word which is added to
   R[i]. The composite word is identical with R[i-2] in those positions
   where R[i-1] is one, and identical to R[i-3] in those positions where
   R[i-1] is zero. Then R[i] is rotated left by s[i] bits (bits rotated
   out the left end of R[i] are brought back in at the right). Here j is
   a "global" variable so that K[j] is always the first key word in the
   expanded key which has not yet been used in a "mix" operation.

3.2 Mixing round


   A "mixing round" consists of the following operations:

   Mix up R[0]
   Mix up R[1]
   Mix up R[2]
   Mix up R[3]






Rivest                       Informational                      [Page 4]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


3.3 Mash R[i]


   The primitive "Mash R[i]" operation is defined as follows (using the
   previous conventions regarding subscripts for R):

   R[i] = R[i] + K[R[i-1] & 63];

   In words: R[i] is "mashed" by adding to it one of the words of the
   expanded key. The key word to be used is determined by looking at the
   low-order six bits of R[i-1], and using that as an index into the key
   array K.

3.4 Mashing round


   A "mashing round" consists of:

   Mash R[0]
   Mash R[1]
   Mash R[2]
   Mash R[3]

3.5 Encryption operation


   The entire encryption operation can now be described as follows. Here
   j is a global integer variable which is affected by the mixing
   operations.

        1. Initialize words R[0], ..., R[3] to contain the
           64-bit input value.

        2. Expand the key, so that words K[0], ..., K[63] become
           defined.

        3. Initialize j to zero.

        4. Perform five mixing rounds.

        5. Perform one mashing round.

        6. Perform six mixing rounds.

        7. Perform one mashing round.

        8. Perform five mixing rounds.

   Note that each mixing round uses four key words, and that there are
   16 mixing rounds altogether, so that each key word is used exactly




Rivest                       Informational                      [Page 5]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


   once in a mixing round. The mashing rounds will refer to up to eight
   of the key words in a data-dependent manner. (There may be
   repetitions, and the actual set of words referred to will vary from
   encryption to encryption.)

4. Decryption algorithm


   The decryption operation is defined in terms of primitive operations
   that undo the "mix" and "mash" operations of the encryption
   algorithm. They are named "r-mix" and "r-mash" (r- denotes the
   reverse operation).

   Here the expression "x ror k" denotes the 16-bit word x rotated right
   by k bits, with the bits shifted out the bottom end entering the top
   end.

4.1 R-Mix up R[i]


   The primitive "R-Mix up R[i]" operation is defined as follows, where
   s[0] is 1, s[1] is 2, s[2] is 3, and s[3] is 5, and where the indices
   of the array R are always to be considered "modulo 4," so that R[i-1]
   refers to R[3] if i is 0 (these values are "wrapped around" so that R
   always has a subscript in the range 0 to 3 inclusive):

   R[i] = R[i] ror s[i];
   R[i] = R[i] - K[j] - (R[i-1] & R[i-2]) - ((~R[i-1]) & R[i-3]);
   j = j - 1;

   In words: R[i] is rotated right by s[i] bits (bits rotated out the
   right end of R[i] are brought back in at the left). Here j is a
   "global" variable so that K[j] is always the key word with greatest
   index in the expanded key which has not yet been used in a "r-mix"
   operation. The key word K[j] is subtracted from R[i], and j is
   decremented. R[i-1] is used to create a "composite" word which is
   subtracted from R[i].  The composite word is identical with R[i-2] in
   those positions where R[i-1] is one, and identical to R[i-3] in those
   positions where R[i-1] is zero.

4.2 R-Mixing round


   An "r-mixing round" consists of the following operations:

   R-Mix up R[3]
   R-Mix up R[2]
   R-Mix up R[1]
   R-Mix up R[0]





Rivest                       Informational                      [Page 6]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


4.3 R-Mash R[i]


   The primitive "R-Mash R[i]" operation is defined as follows (using
   the previous conventions regarding subscripts for R):

   R[i] = R[i] - K[R[i-1] & 63];

   In words: R[i] is "r-mashed" by subtracting from it one of the words
   of the expanded key. The key word to be used is determined by looking
   at the low-order six bits of R[i-1], and using that as an index into
   the key array K.

4.4 R-Mashing round


   An "r-mashing round" consists of:

   R-Mash R[3]
   R-Mash R[2]
   R-Mash R[1]
   R-Mash R[0]

4.5 Decryption operation


   The entire decryption operation can now be described as follows.
   Here j is a global integer variable which is affected by the mixing
   operations.

        1. Initialize words R[0], ..., R[3] to contain the 64-bit
           ciphertext value.

        2. Expand the key, so that words K[0], ..., K[63] become
           defined.

        3. Initialize j to 63.

        4. Perform five r-mixing rounds.

        5. Perform one r-mashing round.

        6. Perform six r-mixing rounds.

        7. Perform one r-mashing round.

        8. Perform five r-mixing rounds.

5. Test vectors


   Test vectors for encryption with RC2 are provided below.



Rivest                       Informational                      [Page 7]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


   All quantities are given in hexadecimal notation.

   Key length (bytes) = 8
   Effective key length (bits) = 63
   Key = 00000000 00000000
   Plaintext = 00000000 00000000
   Ciphertext = ebb773f9 93278eff

   Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = ffffffff ffffffff
   Plaintext = ffffffff ffffffff
   Ciphertext = 278b27e4 2e2f0d49

   Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = 30000000 00000000
   Plaintext = 10000000 00000001
   Ciphertext = 30649edf 9be7d2c2

   Key length (bytes) = 1
   Effective key length (bits) = 64
   Key = 88
   Plaintext = 00000000 00000000
   Ciphertext = 61a8a244 adacccf0

   Key length (bytes) = 7
   Effective key length (bits) = 64
   Key = 88bca90e 90875a
   Plaintext = 00000000 00000000
   Ciphertext = 6ccf4308 974c267f

   Key length (bytes) = 16
   Effective key length (bits) = 64
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 1a807d27 2bbe5db1

   Key length (bytes) = 16
   Effective key length (bits) = 128
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 2269552a b0f85ca6

   Key length (bytes) = 33
   Effective key length (bits) = 129
   Key = 88bca90e 90875a7f 0f79c384 627bafb2 16f80a6f 85920584
         c42fceb0 be255daf 1e



Rivest                       Informational                      [Page 8]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


   Plaintext = 00000000 00000000
   Ciphertext = 5b78d3a4 3dfff1f1

6. RC2 Algorithm Object Identifier


   The Object Identifier for RC2 in cipher block chaining mode is

   rc2CBC OBJECT IDENTIFIER
     ::= {iso(1) member-body(2) US(840) rsadsi(113549)
          encryptionAlgorithm(3) 2}

   RC2-CBC takes parameters

   RC2-CBCParameter ::= CHOICE {
     iv IV,
     params SEQUENCE {
       version RC2Version,
       iv IV
     }
   }

   where

   IV ::= OCTET STRING -- 8 octets
   RC2Version ::= INTEGER -- 1-1024

   RC2 in CBC mode has two parameters: an 8-byte initialization vector
   (IV) and a version number in the range 1-1024 which specifies in a
   roundabout manner the number of effective key bits to be used for the
   RC2 encryption/decryption.

   The correspondence between effective key bits and version number is
   as follows:

   1. If the number EKB of effective key bits is in the range 1-255,
      then the version number is given by Table[EKB], where the 256-byte
      translation table Table[] is specified below. Table[] specifies a
      permutation on the numbers 0-255; note that it is not the same
      table that appears in the key expansion phase of RC2.

   2. If the number EKB of effective key bits is in the range
      256-1024, then the version number is simply EKB.

      The default number of effective key bits for RC2 is 32. If RC2-CBC
      is being performed with 32 effective key bits, the parameters
      should be supplied as a simple IV, rather than as a SEQUENCE
      containing a version and an IV.




Rivest                       Informational                      [Page 9]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f

   00: bd 56 ea f2 a2 f1 ac 2a b0 93 d1 9c 1b 33 fd d0
   10: 30 04 b6 dc 7d df 32 4b f7 cb 45 9b 31 bb 21 5a
   20: 41 9f e1 d9 4a 4d 9e da a0 68 2c c3 27 5f 80 36
   30: 3e ee fb 95 1a fe ce a8 34 a9 13 f0 a6 3f d8 0c
   40: 78 24 af 23 52 c1 67 17 f5 66 90 e7 e8 07 b8 60
   50: 48 e6 1e 53 f3 92 a4 72 8c 08 15 6e 86 00 84 fa
   60: f4 7f 8a 42 19 f6 db cd 14 8d 50 12 ba 3c 06 4e
   70: ec b3 35 11 a1 88 8e 2b 94 99 b7 71 74 d3 e4 bf
   80: 3a de 96 0e bc 0a ed 77 fc 37 6b 03 79 89 62 c6
   90: d7 c0 d2 7c 6a 8b 22 a3 5b 05 5d 02 75 d5 61 e3
   a0: 18 8f 55 51 ad 1f 0b 5e 85 e5 c2 57 63 ca 3d 6c
   b0: b4 c5 cc 70 b2 91 59 0d 47 20 c8 4f 58 e0 01 e2
   c0: 16 38 c4 6f 3b 0f 65 46 be 7e 2d 7b 82 f9 40 b5
   d0: 1d 73 f8 eb 26 c7 87 97 25 54 b1 28 aa 98 9d a5
   e0: 64 6d 7a d4 10 81 44 ef 49 d6 ae 2e dd 76 5c 2f
   f0: a7 1c c9 09 69 9a 83 cf 29 39 b9 e9 4c ff 43 ab

A. Intellectual Property Notice

   RC2 is a registered trademark of RSA Data Security, Inc. RSA's
   copyrighted RC2 software is available under license from RSA Data
   Security, Inc.

B. Author's Address

   Ron Rivest
   RSA Laboratories
   100 Marine Parkway, #500
   Redwood City, CA  94065  USA

   Phone: (650) 595-7703
   EMail: rsa-labs@rsa.com

















Rivest                       Informational                     [Page 10]
 
RFC 2268              RC2(r) Encryption Algorithm             March 1998


C.  Full Copyright Statement

   Copyright (C) The Internet Society (1998).  All Rights Reserved.

   This document and translations of it may be copied and furnished to
   others, and derivative works that comment on or otherwise explain it
   or assist in its implementation may be prepared, copied, published
   and distributed, in whole or in part, without restriction of any
   kind, provided that the above copyright notice and this paragraph are
   included on all such copies and derivative works.  However, this
   document itself may not be modified in any way, such as by removing
   the copyright notice or references to the Internet Society or other
   Internet organizations, except as needed for the purpose of
   developing Internet standards in which case the procedures for
   copyrights defined in the Internet Standards process must be
   followed, or as required to translate it into languages other than
   English.

   The limited permissions granted above are perpetual and will not be
   revoked by the Internet Society or its successors or assigns.

   This document and the information contained herein is provided on an
   "AS IS" basis and THE INTERNET SOCIETY AND THE INTERNET ENGINEERING
   TASK FORCE DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
   BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION
   HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF
   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
























Rivest                       Informational                     [Page 11]!

Object subclass: #ARC4
	instanceVariableNames: 'sbox i j'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RC4'!
ASN1Value subclass: #ASN1AbstractString
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1BasicType subclass: #ASN1AnyDefinedByType
	instanceVariableNames: 'definedBy typeMap defaultType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1AnyType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1SubType subclass: #ASN1AssignmentSubType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1AbstractString subclass: #ASN1BMPString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1BMPStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Type subclass: #ASN1BasicType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Value subclass: #ASN1BitString
	instanceVariableNames: 'bytes bitsPadding'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1OctetsType subclass: #ASN1BitStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1BooleanType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1OctetsType subclass: #ASN1ByteArrayType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1ChoiceElement
	instanceVariableNames: 'owner symbol type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1StructuredType subclass: #ASN1ChoiceType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Type subclass: #ASN1ConstructedType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1DefinitionModel
	instanceVariableNames: 'subject asn1ClassName asn1DefinitionString fields resultObject currentObject currentField currentMutator currentAccessor fieldStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-DefinitionModel'!

!ASN1DefinitionModel commentStamp: 'RJT 9/2/2006 23:09' prior: 0!
This class is used to parse an asn1Definition of a class.  

Use the prama syntax to define the asn1 encoding
    <ans1Definition: 'put definition here'>

for example:
	<asn1Definition: 'CertificateList  ::=  SEQUENCE  {
        tbsCertList          TBSCertList,
        signatureAlgorithm   AlgorithmIdentifier,
        signatureValue       BIT STRING  }'>!

Object subclass: #ASN1EndOfIndefiniteLengthMarker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1EndOfIndefiniteLengthType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1Entity
	instanceVariableNames: 'symbol module'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Value subclass: #ASN1ExplicitContextValue
	instanceVariableNames: 'tagIndex tagValue tagIsPrimitive'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1SubType subclass: #ASN1ExplicitSubType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Value subclass: #ASN1FieldDefinition
	instanceVariableNames: 'fieldName tagIndex tagType explicitFieldDefinition implicitFieldDefinition defaultValue isExplicit isOptional'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-DefinitionModel'!
ASN1AbstractString subclass: #ASN1GeneralString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1GeneralStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1AbstractString subclass: #ASN1IA5String
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1IA5StringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1SubType subclass: #ASN1ImplicitSubType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1IntegerType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1MappedType subclass: #ASN1MappedSequenceType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1MappedType subclass: #ASN1MappedSetType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1StructuredType subclass: #ASN1MappedType
	instanceVariableNames: 'mapping'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1SubType subclass: #ASN1MappingSubType
	instanceVariableNames: 'mapping mappingSymbol'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1Module
	instanceVariableNames: 'name definitions imports'
	classVariableNames: 'Modules'
	poolDictionaries: ''
	category: 'Cryptography-ASN1'!
ASN1Value subclass: #ASN1Null
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1BasicType subclass: #ASN1NullType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Value subclass: #ASN1ObjectId
	instanceVariableNames: 'oid description'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1BasicType subclass: #ASN1ObjectIdentifierType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1OctetsType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1Pragma
	instanceVariableNames: 'pragma asn1name systemClass method'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-DefinitionModel'!
ASN1Pragma subclass: #ASN1PragmaAccessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-DefinitionModel'!
ASN1Pragma subclass: #ASN1PragmaMutator
	instanceVariableNames: 'classOfMutatorArgument'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-DefinitionModel'!
ASN1AbstractString subclass: #ASN1PrintableString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1PrintableStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1UnstructuredType subclass: #ASN1SequenceOfType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1UnmappedType subclass: #ASN1SequenceType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1UnstructuredType subclass: #ASN1SetOfType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1UnmappedType subclass: #ASN1SetType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1Stream
	instanceVariableNames: 'stream currentTag'
	classVariableNames: 'TagToTypeDispatchTable'
	poolDictionaries: ''
	category: 'Cryptography-ASN1'!
ASN1OctetsType subclass: #ASN1StringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1ChoiceElement subclass: #ASN1StructureElement
	instanceVariableNames: 'default optional'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1ConstructedType subclass: #ASN1StructuredType
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Type subclass: #ASN1SubType
	instanceVariableNames: 'parent tag'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1AbstractString subclass: #ASN1TeletexString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1TeletexStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1TestModel
	instanceVariableNames: 'testSlot1 testSlot2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
ASN1Entity subclass: #ASN1Type
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Entity subclass: #ASN1TypeReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1BasicType subclass: #ASN1UTCTimeType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1AbstractString subclass: #ASN1UniversalString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1UniversalStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1ConstructedType subclass: #ASN1UnmappedType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1ConstructedType subclass: #ASN1UnstructuredType
	instanceVariableNames: 'elementType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
Object subclass: #ASN1Value
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1AbstractString subclass: #ASN1VisibleString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
ASN1WrappedStringType subclass: #ASN1VisibleStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1OctetsType subclass: #ASN1WrappedStringType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1WrapperType subclass: #ASN1WrapperConstructedType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1WrapperType subclass: #ASN1WrapperPrimitiveType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
ASN1Type subclass: #ASN1WrapperType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Types'!
EventHatMorph subclass: #BackdropEventHatMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!

!BackdropEventHatMorph commentStamp: '<historical>' prior: 0!
I am a hat block for stacks triggered by Scratch keyboard events.
!

Object subclass: #BlockCipher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!BlockCipher commentStamp: 'rww 10/17/2016 06:26' prior: 0!
Abstract class for blockmode ciphers (those which encrypt/decrypt more than 1 byte at a time, typically 64 bits)

Cryptography is now the shared package between Squeak and Pharo

- RandomGenerator class>>#unpredictableStringsDo: changed details to be squeak/pharo compliant (see comment)
- senders/implementers of #asAsn1Bytes (removed) changed to #asAsn1DerBytes
- senders/implementers of #fromAsn1Bytes: (removed) changed to #fromAsn1DerBytes:
- X509Certificate class>>#fromFile: changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- X509CertificateDerReader>>#asCertificate  changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- all CryptoX509Test>>#certificateX  changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- moved asn1 module definitions and support accessers for RSA and DSA Keys to Cryptography
- changed DiffieHellman>>sendMessage to use SecureRandom>>#nextBits: to keep bitSize
- added CryptoHashFunctionTest tests for HMAC Specs
- added String>>#padLeftTo:with: for squeak
- fixed padding mode to set and retrieve the IV vector!

BlockCipher subclass: #BlockCipherMode
	instanceVariableNames: 'cipher vector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
DialogBoxMorph subclass: #BlockCreationDialog
	instanceVariableNames: 'isAtomic block blockColumn blockParts blockPartsBin showHideButton isAtomicButton bin showingBin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Dialogs'!
CommandBlockMorph subclass: #BlockCreatorMorph
	instanceVariableNames: 'lastParameters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockCipherMode subclass: #CBC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
BlockCipherMode subclass: #CFB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
BlockCipherMode subclass: #CTR
	instanceVariableNames: 'counter counterBits maximumCounterValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!CTR commentStamp: 'cmm 5/11/2006 22:33' prior: 0!
This CTR mode implementation was guided by

	Nils Ferguson, Bruce Schneier.  Pratical Cryptography.  
	Wiley, 2003.
	pp. 75-82, 111-127.

With CTR, my initialVector is partitioned into a nonce and a counter ("i" in the book).  My blockSize, 128-bits, are available to accommodate both of these "fields".  The two of them combined together form my #initialVector (IV).  The book suggests the nonce portion used as a message-number used also in sequencing messages of a secure-channel (chapter 8).  The overall requirement is that the same initialVector (i.e., counter+nonce combination) never be used twice for this key (instance).  The counter is re-set to 1 each time the nonce is set.

If you run out of counter, I signal a CryptographyError.!

ExpressionArgMorph subclass: #ColoredExpressionArgMorph
	instanceVariableNames: 'type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockMorph subclass: #CommandBlockMorph
	instanceVariableNames: 'commandSpec argPermutation argMorphs titleMorph receiver selector isReporter isTimed wantsName wantsPossession numberArgFlags stopFrame '
	classVariableNames: 'CBlockBottomBarForm CBlockBottomBarWithTabsForm CBlockTopBarForms '
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
TestCase subclass: #CryptoASN1Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoDESTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoDSATest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoDiffieHellmanTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoElGamalTest
	instanceVariableNames: 'elGamalGenerators'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoHashFunctionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoPBKDF2AndPBEStorageTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoPKCS12Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRC2Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRC4Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRSATest
	instanceVariableNames: 'privateKey publicKey'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRandomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRigndaelCBCTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoRijndaelTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
TestCase subclass: #CryptoX509Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Tests'!
Error subclass: #CryptographyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
ExpressionArgMorph subclass: #CustomBlockLabelMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
CommandBlockMorph subclass: #CustomProcedureHolder
	instanceVariableNames: 'paramNames'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
ReporterBlockMorph subclass: #CustomReporterMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockCipher subclass: #DES
	instanceVariableNames: 'cookedKey key encrypting nonPrimitive'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-DES'!

!DES commentStamp: '<historical>' prior: 0!
This class implements the Data Encryption Standard (DES) block cipher per
ANSI X3.92.  It requires the presence of the 'DESPlugin'.  At some future
date the functionality of the plugin may be provided in pure Smalltalk, but
the slowness would be prohibitive for anything other than trivial usage.
The main barrier to translation is the heavy use of zero-based indexing of
arrays.

How to use: you first provide an 8-byte key which will be used to encode
and decode the data. Internally, this is 'cooked' into a 32-word format to
speed up the encryption process.  The data is then sent in 8-byte packets
to be encoded or decoded.  You must externally account for padding.  See
the 'testing' category on the class side for examples.

As of this date (1/26/2000), the U.S. Government has lifted many of the
previous restrictions on the export of encryption software, but you should
check before exporting anything including this code.

Submitted by Duane Maxwell.

!

Object subclass: #DESBitPermutation
	instanceVariableNames: 'tables'
	classVariableNames: 'ChunkBits ChunkMask'
	poolDictionaries: ''
	category: 'Cryptography-DES'!

!DESBitPermutation commentStamp: 'hmm 3/26/2002 18:15' prior: 0!
Instances of this class can be used to permute bits in an integer according to a predefined mapping. It's used for DES encryption in several places.!

BlockCipher subclass: #DESNonPrimitive
	instanceVariableNames: 'k'
	classVariableNames: 'EBitSelectionTable IIP IP P PC1 PC2 SBoxes'
	poolDictionaries: ''
	category: 'Cryptography-DES'!
Object subclass: #DSAKeyPairGenerator
	instanceVariableNames: 'p q g x y random'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-DSA'!
Object subclass: #DSAPrivateKey
	instanceVariableNames: 'p q g x'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-DSA'!
Object subclass: #DSAPrivateKeyFileReader
	instanceVariableNames: 'bytes decryptedBytes iv password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Readers'!
Object subclass: #DSAPublicKey
	instanceVariableNames: 'p q g y'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-DSA'!
Object subclass: #DiffieHellman
	instanceVariableNames: 'prime generator secret sharedKey'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ElGamal'!

!DiffieHellman commentStamp: 'cs 12/5/2002 18:50' prior: 0!
I represent the basic version of the Diffie-Hellman key agreement. 
See Handbook of Applied Cryptography, Ch. 12, p. 516

One time setup:
* a safe prime p and a generator alpha of Zp* are published.

Protocol actions:
* Alice chooses a random secret x between 1 and p-2.
* Alice sends Bob message alpha^x mod p.
* Bob chooses a random secret y between 1 and p-2.
* Bob sends Alice message alpha^y mod p.
* Alice receives alpha^y and computes the shared key:
	K = (alpha^y)^x mod p.
* Bob receives alpha^x and computes the shared key:
	K = (alpha^x)^y mod p.

Example from testCase:
| alice bob fromAlice fromBob k1 k2 |
alice := DiffieHellman bits: 15.
bob := DiffieHellman prime: alice prime generator: alice generator.
fromAlice := alice sendMessage.
fromBob := bob sendMessage.
k1 := alice receiveMessage: fromBob.
k2 := bob receiveMessage: fromAlice.
self assert: k1 = k2
!

Object subclass: #ElGamalKeyGenerator
	instanceVariableNames: 'p alpha a'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ElGamal'!

!ElGamalKeyGenerator commentStamp: '<historical>' prior: 0!
The ElGamal public-key encryption scheme is related to the Diffie-Hellman key agreement. Their security is based on the intractability of the same number theoretic problems (the discrete logarithm problem and the Diffie-Hellman problem).

See Handbook of Applied Cryptography, Ch. 8, p. 294.

Key generation:
* Generate a large random prime p and a generator alpha of the multiplicative group Zp* of the integers modulo p
* Select a random integer a between 1 and p-2, and compute alpha^a mod p
* The public key is (p, alpha, alpha^a)
  The private key is a

Example of encryption:
| elgamal pub priv c |
elgamal := ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub := elgamal publicKey.
priv := elgamal privateKey.
c := pub encryptElement: 31.
priv decryptElement: c.


Example of signature:
| elgamal pub priv signature |
elgamal := ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub := elgamal publicKey.
priv := elgamal privateKey.
signature := priv signMessage: 'hello'.
pub verifySignature: signature onMessage: 'hello'.

!

Object subclass: #ElGamalPrivateKey
	instanceVariableNames: 'modulo generator secretExponent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ElGamal'!

!ElGamalPrivateKey commentStamp: '<historical>' prior: 0!
See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	a = secretExponent

Decryption:
* Receive the ciphertext c = (gamma, delta).
* Use the private key to compute:
	gamma^(p-1-a) = gamma^(-a) = alpha^(-a*k) mod p
* Recover m = (gamma^(p-1-a)) * delta mod p

Signature generation:
* Select a random secret integer k between 1 and p-2, with gcd(k, p-1) = 1.
* Compute r = alpha^k mod p.
* Compute k^(-1) mod (p-1).
* Compute s = k^(-1) * ( h(m) - a*r ) mod (p-1), where h is a hash function.
* The signature for m is the pair (r,s).


!

Object subclass: #ElGamalPublicKey
	instanceVariableNames: 'modulo generator generatorRaisedToA'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ElGamal'!

!ElGamalPublicKey commentStamp: '<historical>' prior: 0!
See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	alpha^a = generatorRaisedToA

Encryption:
* Obtain A's public key (p, alpha, alpha^a).
* Represent the message as an integer m between 0 and p-1.
* Select a random integer k between 1 and p-2.
* Compute:
		gamma = alpha^k mod p
		delta = m * (alpha^a)^k mod p.
* Send the ciphertext c = (gamma, delta).

Signature verification:
* Obtain A's public key (p, alpha, alpha^a).
* Verify that r is between 1 and p-1, if not then reject the signature.
* Compute v1 = (alpha^a)^r * r^s mod p.
* Compute h(m) where h is a hash function
* Compute v2 = alpha^h(m) mod p.
* Accept the signature if and only if v1=v2.

!

Object subclass: #EuclidAlgorithm
	instanceVariableNames: 'a b u v gcd'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RSA'!
RandomGenerator subclass: #Fortuna
	instanceVariableNames: 'key ctr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!Fortuna commentStamp: 'cmm 5/4/2006 15:28' prior: 0!
Fortuna is a cryptographically secure pseudorandom number generator specified by Niels Ferguson and Bruce Schneier in chapter 10 of "Practical Cryptography."  This generator utilizes a Rijndael (AES) cipher in CTR mode and is patent-free.!

Object subclass: #HMAC
	instanceVariableNames: 'hash key ipad epad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!HMAC commentStamp: '<historical>' prior: 0!
HMAC is a mechanism for message authentication using cryptographic hash functions. HMAC can be used with any iterative cryptographic hash function, e.g., MD5, SHA-1, in combination with a secret shared key.  The cryptographic strength of HMAC depends on the properties of the underlying hash function.

See RFC 2114.!

Object subclass: #HashFunction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
ScratchMedia subclass: #ImageMedia
	instanceVariableNames: 'form rotationCenter textBox jpegBytes compositeForm savedForm svgForm '
	classVariableNames: 'JPEGPlaceholderForm '
	poolDictionaries: ''
	category: 'Scratch-Objects'!
Object subclass: #Json
	instanceVariableNames: 'stream ctorMap'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!Json commentStamp: '<historical>' prior: 0!
This class reads and writes JSON format data - strings, numbers, boolean, nil, arrays and dictionaries. See http://www.crockford.com/JSON/index.html. It has been extended with syntax for invoking a prearranged list of constructors on read objects.!

Json class
	instanceVariableNames: 'escapeArray'!
Object subclass: #JsonDummyTestObject
	instanceVariableNames: 'a b c'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
JsonSyntaxError subclass: #JsonIncompleteError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonIncompleteError commentStamp: 'tonyg 4/29/2016 11:37' prior: 0!
I signal that reading a JSON value failed because more input is required, but that the input seen so far was not incorrect. Compare to JsonInvalidError.

Be warned that reading numbers directly out of a stream can be ambiguous!!

Consider reading from '1234'. Is the result intended to be 1234, or is there missing input, and the next character will be '5', making the result (possibly) 12345?!

JsonSyntaxError subclass: #JsonInvalidError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonInvalidError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
I signal that reading a JSON value failed because the input didn't match the (extended)JSON grammar implemented by class Json.!

Dictionary subclass: #JsonObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
Error subclass: #JsonSyntaxError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonSyntaxError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
Class Json signals (possibly-indirect) instances of me when reading a JSON value from an input stream fails.!

TestCase subclass: #JsonTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonTests commentStamp: '<historical>' prior: 0!
I provide a number of test cases for class Json.!

Object subclass: #KeyHolder
	instanceVariableNames: 'data random randomChangeProcess'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!KeyHolder commentStamp: 'RJT 2/9/2007 11:10' prior: 0!
A KeyHolder is a construct that holds key information safely in memory.  The key is never stored in plain text in memory.  The system encrypts the key using two different objects and therefore two different memory locations.  A random key is generated and used to encrypt the key.  That random key is changed every 100ms.  To retrieve the key send the message #key.  You must send in a byteArray.  If you are storing a key that is a string then do:

KeyHolder holdKey: 'aPassword' asByteArray.  

when asking for key you will get back aByteArray so if you are looking for a string use

aByteArray := aKeyHolder key. 
pKey := aByteArray asString.
aByteArray destroy.

When you are done with the byteArray send the message destroy to it, to keep your secret key from being written to disk.  Never leave your key in memory for very log.  Get it, use it and destroy it as quickly as possible in the same message chain.

If you no longer need this keyHolder you must send the message destroy to it to stop the process and wipe the memory clean.

Instance Variables
	data:		KeyHolderData
	random:		aByteArray
	randomChangeProcess:		aProcess 

data
	- holds onto an instance of KeyHolderData which holds your encrypted key.

random
	- the key used to encrypt your key

randomChangeProcess
	- the process that changes random
!

Object subclass: #KeyHolderData
	instanceVariableNames: 'key'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!KeyHolderData commentStamp: 'RJT 2/9/2007 11:17' prior: 0!
A KeyHolderData is used by KeyHolder see comments there.

Instance Variables
	key:		<ByteArray>

key
	- key that was encrypted by KeyHolder.  This value is changed frequently by KeyHolder.
!

HashFunction subclass: #MD2
	instanceVariableNames: ''
	classVariableNames: 'PITable'
	poolDictionaries: ''
	category: 'Cryptography-MD4'!
HashFunction subclass: #MD4
	instanceVariableNames: 'a b c d input output'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-MD4'!
HashFunction subclass: #MD5
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-MD5'!

!MD5 commentStamp: 'ul 3/7/2008 19:02' prior: 0!
This class implements the MD5 128-bit one-way hash function. It uses the MD5Plugin for better performance.!

MD5 subclass: #MD5NonPrimitive
	instanceVariableNames: ''
	classVariableNames: 'ABCDTable IndexTable ShiftTable SinTable'
	poolDictionaries: ''
	category: 'Cryptography-MD5'!

!MD5NonPrimitive commentStamp: '<historical>' prior: 0!
This class implements the MD5 128-bit one-way hash function.  It relies on
the ThirtyTwoBitRegister class supplied as part of the "Digital Signatures"
functionality included in Squeak 2.7.  As of this date (1/20/2000), the
U.S. Government has lifted many of the previous restrictions on the export
of encryption software, but you should check before exporting anything
including this code.  MD5 is commonly used for some secure Internet
protocols, including authentication in HTTP, which is why I wrote it.

Submitted by Duane Maxwell

!

MD5 subclass: #MD5WithPrimitive
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-MD5'!
Object subclass: #MillerRabin
	instanceVariableNames: 'target iterations satisfied samples minusOne k n0'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!MillerRabin commentStamp: '<historical>' prior: 0!
My instances are Miller-Rabin algorithms. Miller-Rabin is a probabilistic algorithm for primality testing.!

BlockCipherMode subclass: #OFB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
Object subclass: #OpenSSLKeyDerivationFunction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Readers'!
OrderedCollection subclass: #OrderedSet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-ASN1-Objects'!
Object subclass: #PBEEncryptor
	instanceVariableNames: 'password key pbeTemplate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PBE'!

!PBEEncryptor commentStamp: 'rww 10/27/2016 17:18' prior: 0!
| encryptor encryptedBytes decryptedBytes |
encryptor := PBEEncryptor newPassword: 'password'.
encryptedBytes := encryptor encrypt: #[1 2 3 4 5 6 7 8 1 2 3 4 5].
decryptedBytes := encryptor decrypt: encryptedBytes.
self assert: #[1 2 3 4 5 6 7 8 1 2 3 4 5] = decryptedBytes.!

Object subclass: #PBEStorage
	instanceVariableNames: 'salt iterations keyBitSize iv encryptedBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PBE'!

!PBEStorage commentStamp: 'rww 12/2/2016 02:00' prior: 0!
| encryptedBytes decryptedBytes |
encryptedBytes := PBEStorage encryptWithPassword: 'password' rawBytes: #[1 2 3 4 5 6 7 8 1 2 3 4 5].
decryptedBytes := PBEStorage decryptWithPassword: 'password' encodedBytes: encryptedBytes.
self assert: #[1 2 3 4 5 6 7 8 1 2 3 4 5] = decryptedBytes.

	| key password byteArray iv downCipher upCipher pbe |
	password := 'password' asByteArray.
	byteArray := 'hello world' asByteArray.
	key := PBKDF2WithHmacSHA1 new deriveKeyFromPassword: password.
	iv := (SHA1 new hmac key: password;
				 digestMessage: password) copyFrom: 1 to: Rijndael blockSize.
	downCipher := (Rijndael key: key) cbc initialVector: iv clone.
	upCipher := (Rijndael key: key) cbc initialVector: iv clone.
	pbe := PBEStorage new iv: iv;
				 encryptedBytes: (downCipher initialVector: iv clone;
					 encrypt: byteArray);
				 yourself.
	pbe asByteArray.
	pbe := PBEStorage fromByteArray: byteArray.
	^ upCipher initialVector: pbe iv;
		 decrypt: pbe encryptedBytes!

Object subclass: #PBKDF2WithHmacSHA1
	instanceVariableNames: 'iterations keyBitSize salt hmac'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PBE'!

!PBKDF2WithHmacSHA1 commentStamp: 'rww 10/13/2016 07:28' prior: 0!
A PBKDF2WithHmacSHA1 is way to increase the entropy of bad passwords.  The idea is to increase the amount of work needed for an attacker to try random passwords.  The class returns two values a hash and a salt value.  The salt value is random data used to calculate the hash.  If the hash is used as a key then store the salt value along with the encrypted data.  Then to calculate the key or verify a password use hashForPassword: password salt: theSalt.

So 

| kdf1 kdf2 result1 result2 |
kdf1 := PBKDF2WithHmacSHA1 new.
result1 := kdf1 deriveKeyFromPassword: 'password'. 
kdf2 := PBKDF2WithHmacSHA1 newForSalt: kdf1 salt iterations: kdf1 iterations keyBitSize: kdf1 keyBitSize.
result2 := kdf2 deriveKeyFromPassword: 'password'.
result1 = result2!

BlockCipherMode subclass: #PKCS5Or7PaddingMode
	instanceVariableNames: 'cipherMode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
Object subclass: #PasswordSaltAndStretch
	instanceVariableNames: 'r s'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PasswordSaltAndStretch commentStamp: 'RJT 2/9/2007 16:00' prior: 0!
A PasswordSaltAndStretch is way to increase the entropy of bad passwords.  The idea is to increase the amount of work needed for an attacker to try random passwords.  The class returns two values a hash and a salt value.  The salt value is random data used to calculate the hash.  If the hash is used as a key then store the salt value along with the encrypted data.  Then to calculate the key or verify a password use hashForPassword: aPassword s: theSalt.

So 

| result |
(result := PasswordSaltAndStretch hashForPassword: 'password') = (PasswordSaltAndStretch hashForPassword: 'password' s: result value)  

should be true.

Instance Variables
	r:		<integer>
	s:		<integer>

r
	- the number of rounds used to stretch the password

s
	- salt which is random data used to make the hash unique.  The salt should be stored with encrypted data, or with the hash because it is needed to verify the hash later.
!

Object subclass: #Pkcs12CRLBag
	instanceVariableNames: 'crlId crlValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12CertBag
	instanceVariableNames: 'certId certValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12KeyDerivationFunction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12MacData
	instanceVariableNames: 'mac macSalt iterations'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12PFX
	instanceVariableNames: 'version authSafe macData'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12PrivateKeyFileReader
	instanceVariableNames: 'pfx privateKeys certs password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12SafeBag
	instanceVariableNames: 'bagId bagValue bagAttributes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs12SecretBag
	instanceVariableNames: 'secretId secretValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs8EncryptedPrivateKeyInfo
	instanceVariableNames: 'encryptionAlgorithm encryptedData'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #Pkcs8PrivateKeyInfo
	instanceVariableNames: 'version privateKeyAlgorithm privateKey attributes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #PkcsContentInfo
	instanceVariableNames: 'contentType content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #PkcsDigestInfo
	instanceVariableNames: 'digestAlgorithm digest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #PkcsEncryptedContentInfo
	instanceVariableNames: 'contentType contentEncryptionAlgorithm encryptedContent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #PkcsEncryptedData
	instanceVariableNames: 'version encryptedContentInfo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-PKCS12'!
Object subclass: #PrimesFinder
	instanceVariableNames: 'wheel candidate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PrimesFinder commentStamp: '<historical>' prior: 0!
My instances search for primes of a given size. They implement a probabilistic method. For speed, they first test for divisibility by the primest up to 2000 (in a deterministic way). Next, they employ a probabilistic test (such as MillerRabin).!

Object subclass: #PrimesWheel
	instanceVariableNames: 'primes residues satisfied'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PrimesWheel commentStamp: '<historical>' prior: 0!
My instances are wheels of primes. See the class comment in PrimesFinder.!

CommandBlockMorph subclass: #ProcCallBlockMorph
	instanceVariableNames: 'script'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
HatBlockMorph subclass: #ProcedureHatBlockMorph
	instanceVariableNames: 'spec parameterNames isAtomic block vars runningMouse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
Object subclass: #RSAEncryptionScheme
	instanceVariableNames: 'hash hashLen rand publicKey privateKey encodingParameter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RSA'!

!RSAEncryptionScheme commentStamp: 'rww 4/11/2004 14:55' prior: 0!
Example:

| rsa pub priv rsaes c |
rsa := RSAKeyPairGenerator new.
rsa bits: 1024.
pub := rsa publicKey.
priv := rsa privateKey. 

rsaes := RSAEncryptionScheme new.
rsaes setPublicKey: pub privateKey: priv parameter: 'p'.

c := rsaes encrypt: 'hola'.
(rsaes decrypt: c) asString.

!

Object subclass: #RSAKeyPairGenerator
	instanceVariableNames: 'bits p q d dP dQ qInv'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RSA'!

!RSAKeyPairGenerator commentStamp: '<historical>' prior: 0!
My instances generate public/private RSA pairs.!

Object subclass: #RSAPrivateKey
	instanceVariableNames: 'p q dP dQ qInv'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RSA'!
Object subclass: #RSAPrivateKeyFileReader
	instanceVariableNames: 'bytes decryptedBytes iv password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Readers'!
Object subclass: #RSAPublicKey
	instanceVariableNames: 'exponent modulo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RSA'!

!RSAPublicKey commentStamp: '<historical>' prior: 0!
My instances are RSA algorithms.!

Object subclass: #RSAPublicKeyFileReader
	instanceVariableNames: 'bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Readers'!
Object subclass: #RandomGenerator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
RandomGenerator class
	instanceVariableNames: 'picker'!
Stream subclass: #RandomPool
	instanceVariableNames: 'key pool outputStream inputIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
RandomPool class
	instanceVariableNames: 'default'!
BlockCipher subclass: #Rijndael
	instanceVariableNames: 'nB nK nR shiftOffset1 shiftOffset2 shiftOffset3 expandedKey eqExpandedKey state'
	classVariableNames: 'InvT0 InvT1 InvT2 InvT3 LogInverseTable LogTable RoundConstant SubByte SubByteInverse T0 T1 T2 T3'
	poolDictionaries: ''
	category: 'Cryptography-Rijndael'!
HashFunction subclass: #SHA1
	instanceVariableNames: 'totalA totalB totalC totalD totalE totals'
	classVariableNames: 'K1 K2 K3 K4'
	poolDictionaries: ''
	category: 'Cryptography-SHA1'!

!SHA1 commentStamp: '<historical>' prior: 0!
This class implements the Secure Hash Algorithm (SHA) described in the U.S. government's Secure Hash Standard (SHS). This standard is described in FIPS PUB 180-1, "SECURE HASH STANDARD", April 17, 1995.

The Secure Hash Algorithm is also described on p. 442 of 'Applied Cryptography: Protocols, Algorithms, and Source Code in C' by Bruce Scheier, Wiley, 1996.

See the comment in class DigitalSignatureAlgorithm for details on its use.

Implementation notes:
The secure hash standard was created with 32-bit hardware in mind. All arithmetic in the hash computation must be done modulo 2^32. This implementation uses ThirtyTwoBitRegister objects to simulate hardware registers; this implementation is about six times faster than using LargePositiveIntegers (measured on a Macintosh G3 Powerbook). Implementing a primitive to process each 64-byte buffer would probably speed up the computation by a factor of 20 or more.
!

HashFunction subclass: #SHA256
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!

!SHA256 commentStamp: '<historical>' prior: 0!
http://csrc.nist.gov/publications/fips/fips180-2/fips180-2withchangenotice.pdf This class represnets the implementation of SHA256 as describied above.  

Please direct questions or comments about this implementation to Ron Teitelbaum: Ron@USMedRec.com

This code was extensively coppied from SHA1 by Luciano Notarfrancesco lnotarfrancesco@yahoo.com

!

SHA256 subclass: #SHA256NonPrimitive
	instanceVariableNames: 'totalA totalB totalC totalD totalE totalF totalG totalH'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!
SHA256 subclass: #SHA256WithPrimitive
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!
SVGRenderer subclass: #SVGBalloonRenderer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGBezierSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGEllipseMorph subclass: #SVGCircleMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGClosingLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
MatrixTransformMorph subclass: #SVGComponentMorph
	instanceVariableNames: 'id style cachedComposedStyle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGCompositeMorph
	instanceVariableNames: 'fills'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGEllipseMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGFixupLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGLineSegmentRun subclass: #SVGFixupLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
GradientFillStyle subclass: #SVGGradientFillStyle
	instanceVariableNames: 'units spread'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGGroupMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGLineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPathMorph
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolygonMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPolygonalMorph
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolylineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Dictionary subclass: #SVGPropertyDictionary
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGRectMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGRectangularMorph
	instanceVariableNames: 'rectangle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGMorph subclass: #SVGRenderMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!

!SVGRenderMorph commentStamp: 'EMP 7/16/2017 11:11' prior: 0!
Used for Scratch, renders an SVG without any borders or background for use as a costume!

Object subclass: #SVGRenderer
	instanceVariableNames: ''
	classVariableNames: 'DefaultRenderer'
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Object subclass: #SVGSegmentRun
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGTextMorph subclass: #SVGTSpanMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGTextMorph
	instanceVariableNames: 'text location'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
ScratchEvent subclass: #ScratchBackdropChangeEvent
	instanceVariableNames: 'backdropName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!

!ScratchBackdropChangeEvent commentStamp: '<historical>' prior: 0!
I represent a scratch event where a key has been pressed and needs to be broadcast across the system. I do *not* get sent across the scratch network to other connected systems!

Morph subclass: #ScratchCategorySelector
	instanceVariableNames: 'label translatedLabel categoryColor isSelected textColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ScratchEvent subclass: #ScratchClonedEvent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchFrameMorph
	instanceVariableNames: 'topPane viewerPane scriptsPane stageFrame workPane titlePane libraryPane menuPanel stageButtonsPanel readoutPane logoMorph projectTitleMorph flagButton fillScreenFlag paintingInProgress projectDirectory projectName projectInfo author loginName loginPassword watcherPositions shuffledCostumeNames justSaved viewModeButtons viewMode lastViewMode viewModeButtonsPanel toolbarPanel lastWeDoPoll workPaneWrapper stopButton '
	classVariableNames: 'AllowRemoteConnectionDialog AllowSharing DefaultNotes DefaultSprite FontDefaults Fonts FontsXO IsXO ScratchClipboard ScratchServers ScratchSkin ScratchSkinXO ShareServer ShareServerPath StartupPresentationMode SupportServer SupportServerPath TakeOverScreen UseErrorCatcher UserFontScale Version VersionDate VisibleDrives WorkpaneExtent '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchLibraryMorph
	instanceVariableNames: 'scrollPane stagePane thumbWidth itemExtent spritePane buttonPane spriteLabel topSectionHeight '
	classVariableNames: 'TitleStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchPresenterMorph
	instanceVariableNames: 'frame stage stageWrapper buttons flagButton offscreenWorld mouseFocus mouseDownPoint dragOffset clickWasHandled mouseMoved lastStepTime '
	classVariableNames: 'TopStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Object subclass: #ScratchProcess
	instanceVariableNames: 'stackFrame topBlock readyToYield errorFlag readyToTerminate answer atomicityList ci scriptList blockVarList '
	classVariableNames: 'BlockHighlightMSecs Times '
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchScriptEditorMorph
	instanceVariableNames: 'thumbnailMorph nameMorph pageViewerMorph rotationButtons lockButton readoutMorphs penReadout currentCategory tabPaneMorph deleteButton target topSectionHeight viewerPane '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Object subclass: #ScratchStackFrameToPerform
	instanceVariableNames: 'parentFrame selector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchTabMorph
	instanceVariableNames: 'id label translatedLabel selected mouseOver'
	classVariableNames: 'NormalStyle SelectedStyle'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
PasteUpMorph subclass: #ScratchTabPaneMorph
	instanceVariableNames: 'targetPane currentTab lastTabAdded barForm '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ImageMorph subclass: #ScratchThumbnailMorph
	instanceVariableNames: 'target showDirection lastUpdateMSecs lastRotationDegrees draggingDirection xreadout yreadout '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchTitlePaneMorph
	instanceVariableNames: ''
	classVariableNames: 'Style'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchViewerMorph
	instanceVariableNames: 'target pageViewer currentCategory catButtonsExtent categoryButtons topSectionHeight '
	classVariableNames: 'CatList '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchViewerMorph commentStamp: 'EMP 7/13/2017 15:27' prior: 0!
I am a Scratch blocks palette viewer. I have a set of ScratchCategorySelectors that allow selection of a blocks category to view and a scrollable area showing the blocks in the currently selected category.
The actual palette of blocks is a ScratchBlockPaletteMorph inside me, just to cause confusion. So to test if a morph is the tile palette we actually have to do nasty things like 
((self ownerThatIsA: ScratchViewerMorph) notNil) ifTrue: [
so watch out for that.
!

Morph subclass: #ScratchWorkpaneMorph
	instanceVariableNames: 'workPane titlePane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchWorkpaneMorph commentStamp: 'EMP 7/14/2017 10:10' prior: 0!
I hold the workPane and titlePane for the ScratchFrameMorph, to prevent it from having to draw everything, or having to compute bounds multiple times while drawing.!

RandomGenerator subclass: #SecureRandom
	instanceVariableNames: 'seed key'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
Object subclass: #SmalltalkImageInstanceID
	instanceVariableNames: ''
	classVariableNames: 'InstanceID'
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
ArgMorph subclass: #SpriteArgMorph
	instanceVariableNames: 'menuIconMorph morph type '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockCipher subclass: #TripleDES
	instanceVariableNames: 'des1 des2 des3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-DES'!
EventHatMorph subclass: #WhenClonedEventHatMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!

!WhenClonedEventHatMorph commentStamp: '<historical>' prior: 0!
I am a hat block for stacks triggered by clicking on an object with the mouse.
!

HatBlockMorph subclass: #WhenGreaterThanHatBlockMorph
	instanceVariableNames: 'argMorph argMorph2 lastState lastArg secondArgMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
Object subclass: #X509AccessDescription
	instanceVariableNames: 'accessMethod accessLocation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509AlgorithmIdentifier
	instanceVariableNames: 'oid parameters hasParameters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X509AnotherName
	instanceVariableNames: 'typeId value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509AuthorityKeyIdentifier
	instanceVariableNames: 'keyIdentifier certIssuer certSerialNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509BasicConstraints
	instanceVariableNames: 'ca pathLengthConstraint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509Certificate
	instanceVariableNames: 'tbsCertificate signatureAlgorithm signature'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X509CertificateDerReader
	instanceVariableNames: 'derBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Readers'!
Object subclass: #X509CertificateExtension
	instanceVariableNames: 'extnId extnCritical extnValue decodedExtension'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509DistributionPoint
	instanceVariableNames: 'distributionPoint reasons cRLIssuer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509EDIPartyName
	instanceVariableNames: 'nameAssigner partyName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509GeneralSubtree
	instanceVariableNames: 'base minimum maximum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509IssuingDistributionPoint
	instanceVariableNames: 'distributionPoint onlyContainsUserCerts onlyContainsCACerts onlySomeReasons indirectCRL onlyContainsAttributeCerts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509NameConstraints
	instanceVariableNames: 'permittedSubtrees excludedSubtrees'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509PolicyConstraints
	instanceVariableNames: 'requireExplicitPolicy inhibitPolicyMapping'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509PolicyInformation
	instanceVariableNames: 'id qualifiers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509PolicyMapping
	instanceVariableNames: 'issuerDomainPolicy subjectDomainPolicy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509PolicyQualifierInfo
	instanceVariableNames: 'id qualifier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509-Extensions'!
Object subclass: #X509SubjectPublicKeyInfo
	instanceVariableNames: 'algorithm subjectPublicKey'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X509TBSCertificate
	instanceVariableNames: 'version serialNumber signature issuer validity subject subjectPublicKeyInfo extensions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X509Validity
	instanceVariableNames: 'notBefore notAfter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X520AbstractName
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
Object subclass: #X520Attribute
	instanceVariableNames: 'attrOid attrValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520CommonName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520CountryName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520LocalityName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520Name
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520OrganizationName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520OrganizationalUnitName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520Pkcs9EmailAddress
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
X520AbstractName subclass: #X520StateOrProvinceName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-X509'!
