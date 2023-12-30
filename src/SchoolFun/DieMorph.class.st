"
Das Würfelbeispiel aus SBE!
"
Class {
	#name : #DieMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'faces',
		'dieValue',
		'isStopped'
	],
	#category : #SchoolFun
}

{ #category : #'parts bin' }
DieMorph class >> descriptionForPartsBin [
	^self partName: 'Die'
	 categories:	#('Useful' 'Graphics' 'Quinto')
      documentation:'SQE-Beispiel von df1te' 
]

{ #category : #'as yet unclassified' }
DieMorph class >> faces: aNumber [
^self new faces: aNumber
]

{ #category : #'as yet unclassified' }
DieMorph >> dieValue: aNumber [
	((aNumber isInteger 
		and: [aNumber > 0])
		and: [aNumber <= faces])
		ifTrue: 
		[dieValue := aNumber.
		self changed]
]

{ #category : #'as yet unclassified' }
DieMorph >> drawDotOn: aCanvas at: aPoint [
	aCanvas 
		fillOval: (Rectangle 
			center: self  position + (self  extent * aPoint )
			 extent: self  extent  /6)
			 color: Color black

]

{ #category : #drawing }
DieMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	(self  perform: ('face', dieValue asString ) asSymbol )
	do: [:aPoint | self  drawDotOn: aCanvas at: aPoint ]
]

{ #category : #'as yet unclassified' }
DieMorph >> face1 [
^{0.5@0.5}
]

{ #category : #'as yet unclassified' }
DieMorph >> face2 [
	^{0.25@0.25 . 0.75@0.75}

]

{ #category : #'as yet unclassified' }
DieMorph >> face3 [
	^{0.25@0.25 . 0.75@0.75 .0.5@0.5}

]

{ #category : #'as yet unclassified' }
DieMorph >> face4 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75}

]

{ #category : #'as yet unclassified' }
DieMorph >> face5 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.5@0.5}

]

{ #category : #'as yet unclassified' }
DieMorph >> face6 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5}

]

{ #category : #'as yet unclassified' }
DieMorph >> face7 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5}

]

{ #category : #'as yet unclassified' }
DieMorph >> face8 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25}

]

{ #category : #'as yet unclassified' }
DieMorph >> face9 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25 . 0.5@0.75 }

]

{ #category : #'as yet unclassified' }
DieMorph >> faces: aNumber [
"Set the number of faces"
((aNumber  isInteger 
	and: [aNumber >0])
	and: [aNumber  <=9])
	ifTrue:[faces := aNumber ]
]

{ #category : #'event handling' }
DieMorph >> handlesMouseDown: evt [
^true
]

{ #category : #initialization }
DieMorph >> initialize [
	super initialize.
	self extent: 100@100.
	self useGradientFill; borderWidth: 2; useRoundedCorners .
	self  setBorderStyle:  #complexRaised.
	self fillStyle direction: self  extent  .
		self color: Color red .
	dieValue :=1.
	faces := 6.
	isStopped := false
]

{ #category : #'event handling' }
DieMorph >> mouseDown: evt [
	evt redButtonPressed 
	ifTrue: [isStopped := isStopped not]
]

{ #category : #'stepping and presenter' }
DieMorph >> step [
	isStopped ifFalse: [self dieValue: (1 to: faces )atRandom ]
]

{ #category : #testing }
DieMorph >> stepTime [
	^100
]
