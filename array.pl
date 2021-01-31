#!/usr/bin/perl
use warnings;
use strict;

my @days;
my $days;
@days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
$days = 31;
print @days, "\n";
print $days, "\n";

# Trying to assign array to scalar
my @array1;
my $scalar1;
@array1 = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
$scalar1 = @array1;
print "Array 1 is @array1\nScalar 1 is $scalar1\n";
my @array2;
my $scalar2;
@array2 = qw(Winter Spring Summer Autumn);
$scalar2 = @array2;
print "Array 2 is @array2\nScalar 2 is $scalar2\n";

print scalar @array2, "\n"; # Accessing array in scalar context

# Adding values to arrays
@array1 = (1, 2, 3);
# Flattening technique
@array2 = (23, @array1, 12); # Not a good way
print "@array2\n";

# push, pop , shift should be used
# push and pop perform push and pop like stack
my $element = pop @array2;
print "$element is popped from array2 now the array2 is \n@array2 \n";
push @array2, $element;
print "$element is pushed to array2 now the array2 is \n@array2 \n";
# shift and unshift perform these actions on other end (like queue)
unshift (@array2, "first");
print "Array is @array2 \n";
shift @array2;
print "Array is @array2 \n";

# Accessing values from array
my $firstElement = $array1[0]; # If you want to get it directly or
print "$firstElement \n";
$firstElement = (@array1)[0];
print "$firstElement \n";

# Reason for the above way of accessing
# The prime rule is this: the prefix represents what you want to 
# get, not what you've got.
# So @ represents a list of values, and $ represents a single 
# scalar. Hence, when we're
# getting a single scalar from an array, we never prefix 
# the variable with @ – that would
# mean a list. A single scalar is always prefixed with a $.

# Assigning values is somewhat similar
$array1[-1] = "hello";
print "@array1\n";
@array1[0, 1] = ("hi", 99);
print "@array1\n";

# Slicing arrays
@array1 = qw(Jan Feb Mar May Apr Jun Jul Aug Sep Oct Nov Dec);
print "@array1[3,5,7..9]\n";

# Swapping elements in perl
@array1[0, 1] = @array1[1, 0];
print "@array1\n";

# Loop through array
# General syntax for for ... in types
# for <ITERATOR> (<LIST OR ARRAY>) <BLOCK>
for $element (@array1) {
    print $element, "\n";
}

# If we do not supply an iterator value, perl uses $_
for (@array2) {
    print $_, "\n";
}

# $# gives the index of highest element in the array
print $#array2, "\n";

# Looping array with numbers
for (0..$#array2) {
    print "Looping in array 2 : $array2[$_] is the ${_}th value\n";
}

# To sort arrays we would need to specify if we need to 
# Sort it in a numeric fashion
my @unsorted = (1, 2, 11, 24, 3, 36, 40, 4);
my @string = sort { $a cmp $b } @unsorted;
print "String sort: @string\n";
my @number = sort { $a <=> $b } @unsorted;
print "Numeric sort: @number\n";
