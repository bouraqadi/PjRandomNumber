Class {
	#name : #PjRandomNumberAppTest,
	#superclass : #PjWebAppTestCase,
	#traits : 'PjTAppRunsInJS',
	#classTraits : 'PjTAppRunsInJS classTrait',
	#category : #PjRandomNumber
}

{ #category : #'suite parameters' }
PjRandomNumberAppTest class >> appClass [
	^PjRandomNumberApp 
]

{ #category : #tests }
PjRandomNumberAppTest >> testMaxNumberSet [

	self assert: app maxNumber equals: 6.
	#( 1 150 10000 ) do: [ :each | 
		self changeElement: app maxNumberInput value: each.
		self assert: app maxNumber equals: each.
		self assert: app messageView textContent isEmpty ].

]

{ #category : #tests }
PjRandomNumberAppTest >> testRandomNumberGeneration [

	self deny: app randomNumber isNil.
	self changeElement: app maxNumberInput value: 2.
	(0 to: 2) do: [ :each | 
		self waitUntil: [ 
			self clickElement:
				app generateNumberButton app random number = each ] ].
	
]
