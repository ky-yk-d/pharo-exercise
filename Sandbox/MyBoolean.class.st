Class {
	#name : #MyBoolean,
	#superclass : #Object,
	#category : #Sandbox
}

{ #category : #accessing }
MyBoolean class >> getInstance [
	^ self subclassResponsibility
]

{ #category : #accessing }
MyBoolean >> not [
	^ self subclassResponsibility
]

{ #category : #accessing }
MyBoolean >> | aBoolean [ 
	^ self subclassResponsibility
]
