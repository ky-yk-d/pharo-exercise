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
TBPostsListComponent >> readSelectedPosts [
	^ self currentCategory 
		ifNil: [ self blog allVisibleBlogPosts  ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory  ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html render: (TBCategoriesComponent 
		categories: (self blog allCategories) postsList: self ).
	html tbsContainer: [ 
		self readSelectedPosts do: [ :p |
			html render: (TBPostComponent new post: p) ]
	 ]
	
]
