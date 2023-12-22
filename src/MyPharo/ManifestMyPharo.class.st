"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMyPharo,
	#superclass : #PackageManifest,
	#category : #'MyPharo-Manifest'
}

{ #category : #'code-critics' }
ManifestMyPharo class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#MyClass #hallo #false)) #'2023-12-22T16:01:46.000285+01:00') )
]
