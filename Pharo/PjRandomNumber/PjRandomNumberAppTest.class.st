Class {
	#name : #PjRandomNumberAppTest,
	#superclass : #PjWebAppTestCase,
	#category : #PjRandomNumber
}

{ #category : #'suite parameters' }
PjRandomNumberAppTest class >> appClass [
	^PjRandomNumberApp 
]

{ #category : #tests }
PjRandomNumberAppTest >> testInitialState [

	self assert: app maxNumber equals: 6.
	self assertValueOfElement: app maxNumberInput equals: 6 asString.
	self assert: app randomNumberText textContent asNumber >= 0
]

{ #category : #tests }
PjRandomNumberAppTest >> testMaxNumberChange [

	| generatedNumbers |
	generatedNumbers := Set new.
	3 timesRepeat: [#( 1 150 10000 ) do: [ :each | 
		self changeElement: app maxNumberInput value: each.
		self assert: app maxNumber equals: each.
		generatedNumbers add: app randomNumberText textContent ]].
	self assert: generatedNumbers size > 1
]

{ #category : #tests }
PjRandomNumberAppTest >> testRandomNumberGeneration [

	| generatedNumber |
	#( 2 4 ) do: [ :maxValue | 
		self changeElement: app maxNumberInput value: maxValue.
		(0 to: maxValue) do: [ :each | 
			self waitUntil: [ 
				self clickElement: app generateNumberButton.
				generatedNumber := app randomNumberText textContent asNumber.
				self deny: generatedNumber > maxValue.
				self deny: generatedNumber < 0.
				generatedNumber = each ] ] ]
]
