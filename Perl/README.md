Specifications
==============

Let input.txt be a file containing a sequence of strings. Each string is in a separate line. Write a Perl program match.pl which reads a file text.txt and prints 

(1) strings that contain the text “or”, 
(2) strings that contain at least two vowel characters (i.e. a, e, i, o, u), (3) strings that do not start with “h”, 
(4) strings that have “e” as the second symbol, and end with the letter “y”,
(5) strings that contain both letters and digits. 

Assume that text.txt contains only letters a-z and digits 0-9.

Input example
-------------

	today
	lord
	tomorrow
	helloy
	helloa
	abc34

Output
------

	today contains at least two vowel letters
	today does not start with h
	lord contains or
	lord does not start with h
	tomorrow contains or
	tomorrow contains at least two vowel letters
	tomorrow does not start with h
	helloy contains at least two vowel letters
	helloy has e as the second symbol and ends with y
	helloa contains at least two vowel letters
	abc34 does not start with h
	abc34 contains both letters and digits