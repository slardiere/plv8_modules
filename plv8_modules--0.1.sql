
create table plv8_modules(modname text primary key, load_on_start boolean, code text);

create or replace function plv8_startup()
returns void
language plv8
as
$$
load_module = function(modname)
{
    var rows = plv8.execute("SELECT code from plv8_modules " +
                            " where modname = $1", [modname]);
    for (var r = 0; r < rows.length; r++)
    {
        var code = rows[r].code;
        eval("(function() { " + code + "})")();
    }
        
};

// now load all the modules marked for loading on start
var rows = plv8.execute("SELECT modname, code from plv8_modules where load_on_start");
for (var r = 0; r < rows.length; r++)
{
   var code = rows[r].code;
   eval("(function() { " + code + "})")();
}      
$$;

