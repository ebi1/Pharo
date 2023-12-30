"
THIS  belongs to the examples!
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
	#category : #SchoolFun
}

{ #category : #'as yet unclassified' }
CrossMorph >> containsPoint: aPoint [ 
	"Answer whether aPoint is within the receiver.

	^origin <= aPoint and: [aPoint < corner]"
	
| aBounds1 aBounds2  crossHeight crossWidth |
	crossHeight := (self height/3) asFloat .
	crossWidth := (self  width /3) asFloat .
	aBounds1 := self  bounds top: self top + crossHeight .
	aBounds1  := aBounds1  bottom: self  bottom - crossHeight .
	
	aBounds2 := self bounds left: self  left + crossWidth .
	aBounds2 := aBounds2 right: self right -crossWidth .
	    ^(aBounds1 containsPoint:  aPoint )
		| (aBounds2 containsPoint:  aPoint )
	
]

{ #category : #'as yet unclassified' }
CrossMorph >> drawOn: aCanvas [
	"this is my crossshaped Morph"

	| aBounds crossHeight crossWidth |
	crossHeight := (self height/3) asFloat .
	crossWidth := (self  width /3) asFloat .
	aBounds := self  bounds top: self top + crossHeight .
	aBounds  := aBounds  bottom: self  bottom - crossHeight .
	aCanvas fillRectangle: aBounds  color: self color.
	aBounds := self bounds left: self  left + crossWidth .
	aBounds := aBounds right: self right -crossWidth .
	aCanvas  fillRectangle: aBounds  color: self color
	
]

{ #category : #'as yet unclassified' }
CrossMorph >> handleKeystroke: anEvent [
	| keyValue |
	keyValue := anEvent keyValue .
	keyValue =30
		ifTrue: [self position: self  position  -(0@1)].
	keyValue  =31
		ifTrue: [self position: self  position  +(0@1)].				
	keyValue  =29
		ifTrue: [self position: self  position  +(1@0)].
	keyValue =28
		ifTrue: [self position: self  position  - (1@0)].

]

{ #category : #'as yet unclassified' }
CrossMorph >> handlesMouseDown: anEvent [
^true
]

{ #category : #'as yet unclassified' }
CrossMorph >> handlesMouseOver: anEvent [
	^true
	
]

{ #category : #'as yet unclassified' }
CrossMorph >> mouseDown: anEvent [
	anEvent yellowButtonPressed
	ifTrue: [self  color: Color yellow].
	anEvent redButtonPressed 
	ifTrue: [self color: Color red].
	self changed
]

{ #category : #'as yet unclassified' }
CrossMorph >> mouseEnter: anEvent [
anEvent hand newKeyboardFocus: self 
]

{ #category : #'as yet unclassified' }
CrossMorph >> mouseLeave: anEvent [
anEvent hand newKeyboardFocus: nil
]

{ #category : #'as yet unclassified' }
CrossMorph >> step [
 (self  color diff:  Color black ) <0.1
	ifTrue: [self color:  Color red]
	ifFalse:[self color: color  darker]	
]

{ #category : #'as yet unclassified' }
CrossMorph >> stepTime [
	^5000
]
