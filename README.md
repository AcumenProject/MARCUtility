# MARCUtility
This program was originally written by [Tonio Lowald](https://github.com/tonioloewald) for the University of Alabama Libraries in 2011.
MACR Utility is no longer maintained and may be used on an "AS IS" basis in accordance with the ECL-2.0 License.

### The following is from the [legacy Acumen project page](http://acumen.lib.ua.edu/project/):

------------

To Do
=====

[ ] Fix problems with Oracle connectivity
[x] Encrypt Oracle credentials
[x] Encryption module written

MARC Utility v0.5.x
===================

Downloads
---------

* <a href="downloads/marc_utility.win.zip">MARC Utility for Windows</a> (zip archive)

Note that the Mac and Linux versions are not always up-to-date simply because I am lazy. If you need the latest version of any of them, ping me.

* <a href="downloads/marc_utility.osx.zip">MARC Utility for Mac OS X</a> (zip archive, universal binary)
* <a href="downloads/marc_utility.linux.zip">MARC Utility for Linux</a> (zip archive, GTK)

Finally, here are the Voyager Macros required for performing Voyager Automation tasks using MARC Utility.

* <a href="downloads/voyager_macros.zip">Voyager Macros</a> (zip archive)

New
---

Vastly improved error handling and robustness of scriptable menu items.

Added "Cancel" button to progress dialog.

Fixed "crashes" where the program hangs leaving progress dialog visible and menus hidden. Menus should never get hidden now.

Added support for storing Voyager DB credentials (host, database, username, password) for automatic login when needed, including a nice dialog for entering them. (Note that you will need a _read only_ user account for Voyager's Oracle database for this to work.)

Note that if you save the credentials they will be reloaded automatically by MARC Utility as needed (note: they will be stored in clear text inside the Application Data directory). I would strongly recommend against using any credentials for a non-read-only account for this reason.

Added new "View Voyager Record" command which lets you pull a MARC record from Voyager based on OCLC or BIB_ID.

Added new {voyager ...} function to macro system -- {voyager ...} works just like {marc ...} but queries the voyager back end for its version of the current MARC record using 035a (OCcLC number) to find the Voyager BIB_ID, and then loading the MARC record based on that.

Added new __report__ and __savereport__ macro commands; report adds a new line to a stored report, and savereport saves the report to disk as a text file and opens it (so you can put it at the end of a macro in a once block and it will dump everything that was __report__ed and display the result.

__Default Encoding is now set to UTF-8__ and -- more importantly -- this encoding is now honored when loading MARC files.

__Verify &gt; Each Record Has Fields...__ option implemented (within file view only). For some reason __Linux builds are (I hope temporarily) broken__ so only the Windows and Mac OS X versions have this new feature for the time being.

__Automation__ implemented.

Macro scripts have been tested, somewhat debugged, and new ones added.

__MARC Utility__ is a desktop application for viewing and batch-processing [MARC](http://www.loc.gov/marc/) files. It runs on Windows, Mac OS X, and Linux GTK desktop computers. 

> This software should be used with *caution* as it has not been extensively tested. It should, however, not cause any damage to existing files (unless you deliberately save over them, of course).

> MARC Utility is provided for free, "as is", with no guarantee of any kind. Please do let me know of any bugs.

You may find it useful as a companion to [MarcEdit](http://oregonstate.edu/~reeset/marcedit/html/index.php).

Autohotkey
----------
Autohotkey is a free macro utility for Windows. I've added automation functionality to Voyager (via the Voyager Macros folder
installed alongside MARC Utility). It has a simple (but expandable) scripting language. I've included some macros that use
Autohotkey scripts.
It's available [here](http://www.autohotkey.com/), but here's a link to a recent version:
* <a href="../marc_utility/AutoHotkey104805_Install.exe">Autohotkey Installer</a> (Windows Only)

Macro Scripts
-------------

Examples:

<pre>
each
run 01_search.ahk {marc "035" "a" "([\d]+)\Z"} 
run 02_holdings.ahk {marc "050" "a"} {marc "050" "b"}
run 03_createitem.ahk {marc "949" "a"} 
</pre>

This script defines a block of three lines of code performed once for each record in the current file. The first line runs an autohotkey macro named "01_search.ahk" passing it one paramater -- the content of field "035" subfield "a" filtered using the supplied regular expression (which finds the string of digits at the end of the subfield). The second line calls a different macro which is passed the contents of 050a and 050b. And so on.

> __Note__: at the moment, scripts communicate with MARC Utility by setting the clipboard to a return value. Anything other than "success" will halt the script's execution. I plan to add a less primeval communication mechanism.

A macro script is a text (*.txt) file placed in the __Voyager Macros__ directory inside the __MARC Utility__ directory.

Currently, macros are very simple. The following command syntax supported:

__comments__: anything on a line after a "--" is ignored

__alert__ concatenates its arguments and then shows a dialog box

__info__ concatenates its arguments and puts the result into the progress dialog text

__report__ concatenates its arguments and then adds them to an internally saved report

__savereport__ saves the internally saved report to a text file and opens it

__run__ <command_name> <param1> <param2> ...: runs the shell script or executable _command_name_ with the parameters provided.

__parameters__ may be:

 *  __variable names__ (alphanumeric tokens, such as __foo17__; asterisk at the end of a token name indicates it's a password field so it's never displayed) 
 *	string literals (such as __"foo17"__)
 *	or function calls (such as {foo abc "17"})

 > __Annoying Limitations__: functions cannot currently call other functions, nor can their results be assigned to variables. This is obviously something that needs to be addressed.

__functions__: the following functions are supported:

 *  {__marc__ [field [subfield [regexp_filter]]} -- returns the content of the field or subfield of a given marc record (which one depends on context) filtered by the regular expression if one is provided. \1 will be returned from the regular expression.
 
 * {__voyager__ [field [subfield [regexp_filter]]} -- just like marc except it pulls a MARC record from Voyager based on the 035a (OCcLC) number and gets its information from there.
 
__ask__ <prompt> <var1> <var2> ...: requests up to four variables from the user, variables whose names end in "*" are treated as password fields

__block definitions__ define blocks of code that are executed based on rules. The block comprises all code until the next block definition:

 *  __once__: defines a block of code that will be executed once for the currently selected MARC record. By default, a "once" is considered to live at the top of every script file.

 *  __each__: defines a block of code that will be executed once for each MARC record in the current file.
 
To Do
-----

[x] Add support for __indicators__ in getField calls, and the {marc } function.
[ ] Add conditions and assertions to macro syntax
[ ] Add assignment to macro syntax
[ ] Add {filter <value> <regular_expression> [<match>]}
[x] regex filters added as parameter to {marc } and {voyager } as a hack workaround for not having above.
[x] Add alert to macro syntax
[x] Improve progress feedback
[x] Create, save, and display (if requested) transcript of what a macro did
[ ] Debug Mode for macro calls
[x] Indicate current marc record during macro execution
[ ] Support return values using a mechanism other than the clipboard (e.g. stdout) and allowing information other than success/failure to be returned

General Features
----------------

* Attempts to "sniff" files assuming correct header structure
* Easy to use batch-processing interface (supports drag-and-drop, etc.)
* Simple but easily extensible architecture
* Unicode support added
* Side-by-side comparison viewing implemented (for input and output files)
* Progress dialogs added for longer operations
* Improved display of fields
* Added "main title" support to MARC_Record class (improves UI and useful later)
* Redesigned MARC Viewer to be able to handle really large MARC files ("thousands of records")
* MARC files can now have their records sorted by arbitrary callout field (and subfield) values, ascending or descending order (default is "245" -- main title).
* The batch tool now allows sorting of records within each MARC file by arbitrary callout field values, ascending or descending order.

MARC Viewer
-----------

* The Viewer window provides a tabbed view of a MARC File, with one tab per record found in the file
* The Viewer window shows the subfield markers in bold red

Batch Processing Features
-------------------------

To perform a batch process, simply follow these steps:

1. Select (or drag in) the files you wish to process. (MARC Utility will attempt to filter the contents of any folders you pass to it.) You can remove any files you do not wish to process by selecting them and clicking "Remove File(s)".
2. Select (or drag in) your destination folder.
3. Pick and/or customize the batch operation(s) you wish to perform.
4. Click the process button to perform the operation.

* The batch window provides extensive drag-and-drop support -- you can drag files and folders to the list and you can drag folders to the destination display
* If you double-click a MARC document _before_ it has been processed, a MARC viewer will be opened for that document
* If you double-click a MARC document _after_ it has been processed, two MARC viewers will be opened side-by-side (for the original and processed documents)
* Currently only one batch operation is supported -- tag stripping
