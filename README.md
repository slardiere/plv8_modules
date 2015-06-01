# Extension plv8_modules

This extension permet the use of some existing javascript function in
some plv8 function in the instance.

The extension implie a table containing the javascript code, and a
loader function which read the code from the table and make it
available for others plv8 function.

This extension come from this article :
[Loading Useful Modules in PLV8 ](http://adpgtech.blogspot.de/2013/03/loading-useful-modules-in-plv8.html)

The insert of the code could done, since the extension is created, by the following command :

~~~
psql -U postgres -v modulecode="`cat javascript_extension_file.js`" -1 $DBNAME <<EOF

insert into plv8_modules values ('module_name',true,:'modulecode');

-- add func in postgresql.conf 
select plv8_startup();

EOF
~~~
