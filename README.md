# PWBTestsDataGenerator

Load 

```Smalltalk

 Metacello new
    	githubUser: 'mahugnon' project: 'PWBTestsDataGenerator' commitish: 'master' path: 'src';
    	baseline: 'PWBTestsDataGenerator';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        load
```
