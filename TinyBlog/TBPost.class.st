"
I'm a tiny blog post.
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #initialization }
TBPost class >> title: aTitle text: aText [
	^ self new 
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #initialization }
TBPost class >> title: aTitle text: aText category: aCategory [ 
	^ (self title: aTitle text: aText) 
		category: aCategory;
		yourself
]

{ #category : #initialization }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #operations }
TBPost >> beVisible [
	self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject 
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: anObject [ 
	date := anObject 
]

{ #category : #initialization }
TBPost >> initialize [ 
	self category: TBPost unclassifiedTag .
	self date: Date today.
	self notVisible 
]

{ #category : #operations }
TBPost >> isVisible [
	^  visible
]

{ #category : #operations }
TBPost >> notVisible [
	self visible: false
]

{ #category : #accessing }
TBPost >> text [ 
	^ text 
]

{ #category : #accessing }
TBPost >> text: anObject [ 
	text := anObject 
]

{ #category : #accessing }
TBPost >> title [ 
	^ title
]

{ #category : #accessing }
TBPost >> title: anObject [ 
	title := anObject 
]

{ #category : #accessing }
TBPost >> visible [
	^ visible 
]

{ #category : #accessing }
TBPost >> visible: anObject [
	visible := anObject 
]
