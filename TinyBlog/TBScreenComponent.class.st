Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #TinyBlog
}

{ #category : #accessing }
TBScreenComponent >> blog [
	"Return the current blog int the future we wll ask the session to return the blog of the currently logged user."
	^ TBBlog current 
]

{ #category : #accessing }
TBScreenComponent >> children [ 
	^ OrderedCollection with: header 
]

{ #category : #accessing }
TBScreenComponent >> initialize [ 
	super initialize .
	header := TBHeaderComponent new.
]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [ 
	html render: header
]
