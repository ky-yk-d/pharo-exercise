"
I'm simple counter which supports incrementing and decrementing of a value.

My API is
- increment decrement
- count

| c |
c := Counter new.
c increment; increment.
c count = 2
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #accessing }
Counter >> count [ 
	^ count
]

{ #category : #accessing }
Counter >> count: aNumber [
	count := aNumber
]

{ #category : #operations }
Counter >> decrement [ 

	self count: self count - 1
]

{ #category : #operations }
Counter >> increment [ 

	self count: self count + 1
]

{ #category : #initialization }
Counter >> initialize [ 
	
	super initialize.
	count := 0
]

{ #category : #printing }
Counter >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' with value: ', self count printString.
	aStream cr
]
