Class {
	#name : #MyBooleansTest,
	#superclass : #TestCase,
	#category : #Sandbox
}

{ #category : #tests }
MyBooleansTest >> testNot [
	| myTrue myFalse |
	myTrue := MyTrue getInstance.
	myFalse := MyFalse getInstance.
	self assert: myTrue not equals: myFalse.
	self assert: myFalse not equals: myTrue.
]

{ #category : #tests }
MyBooleansTest >> testOr [
	| myTrue myFalse |
	myTrue := MyTrue getInstance.
	myFalse := MyFalse getInstance.
	self assert: (myTrue | myTrue) equals: myTrue.
	self assert: (myTrue | myFalse) equals: myTrue.
	self assert: (myFalse | myTrue) equals: myTrue.
	self assert: (myFalse | myFalse) equals: myFalse.
]
