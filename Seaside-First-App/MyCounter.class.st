"
I'm a component for counter web application.

"
Class {
	#name : #MyCounter,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'Seaside-First-App'
}

{ #category : #operations }
MyCounter >> decrease [ 
	count := count - 1
]

{ #category : #operations }
MyCounter >> increase [ 
	count := count + 1
]

{ #category : #initialization }
MyCounter >> initialize [
	"オブジェクト生成時の処理"	
	super initialize.
	count := 0.
]

{ #category : #rendering }
MyCounter >> renderContentOn: html [ 
	html heading: count.
	html anchor callback: [ self increase ]; with: '[++]'.
	html anchor callback: [ self decrease ]; with: '[--]'.
	
	
]

{ #category : #accessing }
MyCounter >> states [
	"状態管理の指定は配列の形式で行う"
	^ Array with: self.
]
