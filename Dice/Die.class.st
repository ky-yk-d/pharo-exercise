"
I'm simple die

To create a die use

	Die faces: 20
"
Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'instance creation' }
Die class >> faces: anInteger [

	| d |
	d := self new.
	d faces: anInteger.
	^ d 
]

{ #category : #accessing }
Die >> faces: anInteger [ 
	faces := anInteger
]

{ #category : #initialization }
Die >> initialize [ 

	super initialize .
	faces := 6.
]

{ #category : #operations }
Die >> roll [

	^ faces atRandom .
]
