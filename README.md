# PWBTestsDataGenerator
 [![Build Status](https://ci.inria.fr/pharo-contribution/job/PWBTestsDataGenerator/badge/icon)](https://ci.inria.fr/pharo-contribution/job/PWBTestsDataGenerator/) 
 [![Build Status](https://travis-ci.com/mahugnon/PWBTestsDataGenerator.svg?branch=master)](https://travis-ci.com/mahugnon/PWBTestsDataGenerator)
 [![Build status](https://ci.appveyor.com/api/projects/status/vfyimbkxqms82p31?svg=true)](https://ci.appveyor.com/project/mahugnon/pwbtestsdatagenerator) 
 ![PWBTestsDataGenerator health](https://github.com/mahugnon/PWBTestsDataGenerator/workflows/PWBTestsDataGenerator%20health/badge.svg)
 [![Coverage Status](https://coveralls.io/repos/github/mahugnon/PWBTestsDataGenerator/badge.svg)](https://coveralls.io/github/mahugnon/PWBTestsDataGenerator)

Load 

```Smalltalk

 Metacello new
    	githubUser: 'mahugnon' project: 'PWBTestsDataGenerator' commitish: 'master' path: 'src';
    	baseline: 'PWBTestsDataGenerator';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        load
```

