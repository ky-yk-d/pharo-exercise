Class {
	#name : #MyFalse,
	#superclass : #MyBoolean,
	#classVars : [
		'UniqueInstance'
	],
	#category : #Sandbox
}

{ #category : #instantiation }
MyFalse class >> getInstance [ 
	UniqueInstance ifNil: [ UniqueInstance := self basicNew  ].
	^ UniqueInstance
]

{ #category : #abstract }
MyFalse >> not [ 
	^ MyTrue getInstance
]

{ #category : #operations }
MyFalse >> or: aBoolean [ 
	^ aBoolean
]
