# MarylineTestsGenerator
```smalltalk
Metacello new
   githubUser: 'mahugnon' project: 'MarylineTestsGenerator' commitish: 'master' path: 'src';
   baseline: 'Maryline';
   onConflict: [ :e | e useIncoming ];
   onUpgrade: [ :e | e useIncoming ];       
   load
```
[![Build Status](https://travis-ci.com/mahugnon/MarylineTestsGenerator.svg?branch=master)](https://travis-ci.com/mahugnon/MarylineTestsGenerator)   [![Build Status](https://ci.inria.fr/pharo-contribution/job/MarylineTestsGenerator/badge/icon)](https://ci.inria.fr/pharo-contribution/job/MarylineTestsGenerator/)
