"Class definition for generating documentation of packages"
Object subclass: #PackageDocGenerator
    instanceVariableNames: 'package'
    classVariableNames: ''
    package: 'Documentation'.

"Method to initialize the PackageDocGenerator instances"
PackageDocGenerator>>initialize
    super initialize.
    package := nil.

"Method to set the package for which documentation is to be generated"
PackageDocGenerator>>setPackage: aPackage
    package := aPackage.

"Method to generate documentation for a single class within the package"
PackageDocGenerator>>generateClassDoc: aClass on: aStream
    "Start class documentation with the class name"
    aStream nextPutAll: '=== Class: '; nextPutAll: aClass name asString; nextPutAll: ' ==='; cr; cr.
    
    "Document superclass information"
    aStream nextPutAll: 'Superclass: '; nextPutAll: aClass superclass name asString; cr; cr.
    
    "List subclasses, if any"
    aStream nextPutAll: 'Subclasses:'; cr.
    aClass subclasses 
        ifEmpty: [aStream nextPutAll: '(None)'; cr]
        ifNotEmpty: [
            aClass subclasses do: [:subclass |
                aStream nextPutAll: '- '; nextPutAll: subclass name asString; cr.
            ]
        ].
    aStream cr.
    
    "List instance variables"
    aStream nextPutAll: 'Instance Variables:'; cr.
    aClass instVarNames 
        ifEmpty: [aStream nextPutAll: '(None)'; cr]
        ifNotEmpty: [
            aClass instVarNames do: [:var |
                aStream nextPutAll: '- '; nextPutAll: var asString; cr.
            ]
        ].
    aStream cr.
    
    "Document methods with optional comments"
    aStream nextPutAll: 'Methods:'; cr.
    (aClass methodDict values sorted: [:a :b | a selector <= b selector]) do: [:method |
        aStream nextPutAll: '* '; nextPutAll: method selector asString; cr.
        method comment 
            ifNotNil: [
                aStream nextPutAll: '  Comment: '; 
                nextPutAll: method comment asString; cr.
            ].
        aStream cr.
    ].
    aStream cr.

"Method to generate documentation for all classes in the specified package"
PackageDocGenerator>>generateDocumentation
    "Set up a stream for documentation output"
    | stream |
    stream := WriteStream on: String new.
    
    "Ensure a package is set before generating documentation"
    package ifNil: [^ 'No package selected'].
    
    "Document header for the package"
    stream nextPutAll: '=== Package Documentation: ';
        nextPutAll: package name asString;
        nextPutAll: ' ===';
        cr; cr.
    
    "Generate documentation for each class in the package"
    (package definedClasses sorted: [:a :b | a name <= b name]) do: [:class |
        self generateClassDoc: class on: stream.
        stream nextPutAll: '------------------------------------------------'; cr; cr.
    ].
    
    ^ stream contents.
