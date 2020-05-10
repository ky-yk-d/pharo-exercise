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
	html tbsContainer: [ 
		html tbsRow showGrid ;
			with: [ 
				html tbsColumn 
					extraSmallSize: 12;
					smallSize: 2;
					mediumSize: 4;
					with: [ 
						html render: (TBCategoriesComponent categories: (self blog allCategories) postsList: self)
					].
				html tbsColumn 
					extraSmallSize: 12;
					smallSize: 10;
					mediumSize: 8;
					with: [ 
						self readSelectedPosts do: [ :p | html render: (TBPostComponent new post: p) ]
					]
				]
			]
	
]
