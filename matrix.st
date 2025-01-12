"Define the HollowMatrix class for representing sparse matrices using a compressed format"
Object subclass: #HollowMatrix
    instanceVariableNames: 'rows columns rowIndices colIndices values'
    classVariableNames: ''
    package: 'MatrixRepresentation'.

"Class comment describing the purpose and functionality of HollowMatrix"
!HollowMatrix commentStamp: 'priyankasingh 1/10/2025 05:03' prior: 0!
I am a HollowMatrix class that represents a sparse matrix using a compressed format.

"Instance variables with descriptions"
    rows        <Integer>  Number of rows in the matrix
    columns     <Integer>  Number of columns in the matrix
    rowIndices  <Array>    Array storing row indices of non-zero elements
    colIndices  <Array>    Array storing column indices of non-zero elements
    values      <Array>    Array storing non-zero values

"Method to convert HollowMatrix to a traditional matrix format"
!HollowMatrix methodsFor: 'converting' stamp: 'priyankasingh 1/10/2025 05:25'!
toTraditionalMatrix
    | traditional |
    traditional := TraditionalMatrix new.
    traditional initializeWithRows: rows columns: columns.
    values keysAndValuesDo: [ :i :value |
        traditional at: (rowIndices at: i) at: (colIndices at: i) put: value ].
    ^ traditional

"Method to initialize HollowMatrix with specified dimensions and non-zero elements"
!HollowMatrix methodsFor: 'initialization' stamp: 'priyankasingh 1/10/2025 04:59'!
initializeWithRows: r columns: c rowIndices: rIndices colIndices: cIndices values: vals
    rows := r.
    columns := c.
    rowIndices := rIndices.
    colIndices := cIndices.
    values := vals.

"Method to output the description of HollowMatrix including its dimensions and non-zero elements"
!HollowMatrix methodsFor: 'printing' stamp: 'priyankasingh 1/10/2025 16:49'!
printOn: aStream
    aStream nextPutAll: 'Hollow Matrix:'; nextPut: Character cr.
    aStream nextPutAll: 'Dimensions: '; print: rows; nextPutAll: ' x '; print: columns; nextPut: Character cr.
    aStream nextPutAll: 'Non-zero elements:'; nextPut: Character cr.
    1 to: values size do: [ :i |
        aStream nextPutAll: 'Row: '; print: (rowIndices at: i);
        nextPutAll: ' Col: '; print: (colIndices at: i);
        nextPutAll: ' Value: '; print: (values at: i); nextPut: Character cr ].

"Define the TraditionalMatrix class for representing matrices in traditional dense format"
Object subclass: #TraditionalMatrix
    instanceVariableNames: 'data rows columns'
    classVariableNames: ''
    package: 'MatrixRepresentation'.

"Methods to access and modify elements of TraditionalMatrix"
!TraditionalMatrix methodsFor: 'accessing' stamp: 'priyankasingh 1/10/2025 04:56'!
at: i at: j
    ^ (data at: i) at: j.

at: i at: j put: value
    (data at: i) at: j put: value.

"Method to initialize TraditionalMatrix with specified dimensions"
!TraditionalMatrix methodsFor: 'initialization' stamp: 'priyankasingh 1/11/2025 06:56'!
initializeWithRows: r columns: c
    rows := r.
    columns := c.
    data := (1 to: rows) collect: [ :i | (Array new: columns) atAllPut: 0 ].

"Method to output the description of TraditionalMatrix including all elements"
!TraditionalMatrix methodsFor: 'printing' stamp: 'priyankasingh 1/11/2025 06:59'!
printOn: aStream
    aStream nextPutAll: 'Traditional Matrix:'; nextPut: Character cr.
    1 to: rows do: [ :i |
        1 to: columns do: [ :j |
            aStream print: (self at: i at: j); aStream space ].
        aStream nextPut: Character cr ].

"Method to convert TraditionalMatrix to HollowMatrix"
!TraditionalMatrix methodsFor: 'converting' stamp: 'priyankasingh 1/10/2025 05:17'!
toHollowMatrix
    | nonZeroCount rowIndices colIndices values |
    nonZeroCount := 0.
    rowIndices := OrderedCollection new.
    colIndices := OrderedCollection new.
    values := OrderedCollection new.
    1 to: rows do: [ :i |
        1 to: columns do: [ :j |
            | value |
            value := self at: i at: j.
            value ~= 0 ifTrue: [
                nonZeroCount := nonZeroCount + 1.
                rowIndices add: i.
                colIndices add: j.
                values add: value ]].
    ^ HollowMatrix new
        initializeWithRows: rows columns: columns rowIndices: rowIndices asArray colIndices: colIndices asArray values: values asArray.
