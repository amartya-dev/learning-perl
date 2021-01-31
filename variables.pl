#!/usr/bin/perl
use warnings;
use strict;

our $record;
$record = 3;
print "3 + 5 = ", $record + 5, " \n";

# Lexical variables : Variables within a block

$record = 1; # The global variable
print "record value is ", $record, "\n";
{
    my $record;
    $record = 8;
    print "record is ", $record, "\n";
}

print "This was a demo of lexical variables record is still ", $record, "\n";

# The arrays' variables begin with a sign @ and hashes begin with %

# Double quotes interpolate variables
my $name = "Amartya";
print "My name is $name\n"; # $name prints the value here

# Single quotes do not interpolate variables
print 'My name is $name\n', "\n"; # $name doesn not print the value here

# We can also assign the interpolated strings to other variables
my $salutation = "Dear $name";
print $salutation, "\n";

# Interpolation can be mixed with concatenation
$salutation = "Dear ". $name . " ";
print $salutation, "\n";

# Interpolate and add extra strings
my $times = 8;
print "This is the ${times}th time.\n";

# Long numbers can be separated using _
my $longnumber = 25_000;
print "The number actually is ", $longnumber, "\n";
