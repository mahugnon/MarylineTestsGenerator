# MarylineTestsGenerator
Metacello new
   githubUser: 'mahugnon' project: 'MarylineTestsGenerator' commitish: 'master' path: 'src';
   baseline: 'Maryline';
   onConflict: [ :e | e useIncoming ];
   onUpgrade: [ :e | e useIncoming ];       
   load
