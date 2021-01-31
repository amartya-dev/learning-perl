#!/usr/bin/perl
use warnings;
use strict;

print "Please enter your name \n";
my $name = <STDIN>;

print "The name entered is ", $name, "\n";

# Perl automatically converts stuff to numbers
print "Enter a number \n";
my $number = <STDIN>;
print "The number plus 3 is ", $number + 3, "\n";
