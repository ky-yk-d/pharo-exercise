Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #rendering }
TBPostsListComponent >> currentCategory: anObject [ 
	currentCategory := anObject 
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ 
		self blog allVisibleBlogPosts do: [ :p |
			html render: (TBPostComponent new post: p) ]
	 ]
	
]
