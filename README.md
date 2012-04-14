README
======

The Ruby script convert.rb takes data from a certain format which will go hitherto unmentioned and converts it into a more familiar X-Y coordinate dump for doing spectral particulate analysis or something along those lines which I won't pretend to understand. This script is so simple that it begs the question why a README is even necessary. The answer to that question is as simple as the script: I wanted an excuse to try out Textmate's Markdown bundle. So shut your god damn mouth.

Unconverted Data
----------------

The unconverted data format looks like this:

	<channel-name><whitespace>+<integer><whitespace>+<integer><whitespace>+<integer><whitespace>+<integer><whitespace>+<integer>
	
A sample:

	1 0 9 38238 666 42
	6 333 444 555 666 2

Converted Data
--------------

The above unconverted example would then look like this:

	1 0
	2 9
	3 38238
	4 666
	5 42
	6 333
	7 444
	8 555
	9 666
	10 2

with a typical dataset containing a total of 8000 channels. A full sample dataset is provided as *sample.dat* as well as the node.js script (*samplegen.js*) for generating it.