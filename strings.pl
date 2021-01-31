#!/usr/bin/perl
use warnings;
print "C:\\WINNT\\Profiles\\\n";
print 'C:\WINNT\Profiles\ ', "\n";
print 'ex\\ er\\' , ' ci\' se\'' , "\n";

# Using custom quotation and delimiter signs
print qq|'"Hi," said Jack. "Have you read /. today?"'\n|;
print qq#'"Hi," said Jack. "Have you read /. today?"'\n#;
print qq('"Hi," said Jack. "Have you read /. today?"'\n);
print qq<'"Hi," said Jack. "Have you read /. today?"'\n>;

print<<EOF;
This is a here-document. It starts on the line after the two arrows,
and it ends when the text following the arrows is found at the beginning
of a line, like this:
EOF
