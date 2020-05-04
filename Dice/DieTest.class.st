Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTest >> testBetterCreationInterface [
	self shouldnt: [ Die faces: 20 ] raise: Error 
]

{ #category : #tests }
DieTest >> testInitialization [ 

	self shouldnt: [ Die new ] raise: Error 
]

{ #category : #tests }
DieTest >> testRoling [

	| d |
	d := Die new.
	1000 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]
