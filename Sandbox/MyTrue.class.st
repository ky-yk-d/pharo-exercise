Class {
	#name : #MyTrue,
	#superclass : #MyBoolean,
	#classVars : [
		'UniqueInstance'
	],
	#category : #Sandbox
}

{ #category : #instantiation }
MyTrue class >> getInstance [ 
	UniqueInstance ifNil: [ UniqueInstance := self basicNew  ].
	^ UniqueInstance
]

{ #category : #abstract }
MyTrue >> not [ 
	^ MyFalse getInstance.
]

{ #category : #operators }
MyTrue >> or: aBoolean [
	 ^ self class getInstance
]
