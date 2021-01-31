#!/usr/bin/perl
use warnings;
use strict;

print (123, 456, 789);
print "\n";

my $test = 30;
print
    "Here is a list containing strings, (this one) ",
    "numbers (",
    3.6,
    ") and variables: ",
    $test,
    "\n"
;

# With interpolation
print ("Here is a list containing strings, (this one) numbers (3.6) and variables: $test\n");

# qw// operator can be used for list with only words
# The following representations are all equivalent
# ('one', 'two', 'three', 'four')
# qw/one two three four/
# qw(one two three four)
# qw<one two three four>
# qw{one two three four}
# qw[one two three four]
# qw|one two three four|

# Perl automatically flattens list
# That is, if you try putting a list inside
# another list, the internal list loses its identity. 
# In effect, perl removes all the brackets apart from the
# outermost pair. There's no difference at all between any of these 
# three list

# We should not separate words with commas inside qw
print qw (
    one
    two
    three
    four
);

print qw (one two three);
print "\n";

# Accessing values
print (('salt', 'vinegar', 'mustard')[2]);

print "\n";

my $month = 3;
print qw(
    Januaury    February    March
    April       May         June
    July        August      September
    October     November    December
)[$month], "\n";

# -1 accesses last element
print qw(
    Januaury    February    March
    April       May         June
    July        August      September
    October     November    December
)[-1], "\n";

# You can also access using a list
my $mone; my $mtwo;
($mone, $mtwo) = (1, 3); # Lists are legal lvalues

print (("heads ", "shoulders ", "knees ", "toes ")[$mone, $mtwo]);
print "\n";

# Swapping elements
($mtwo, $mone) = ($mone, $mtwo);
print "Mone $mone \nMtwo $mtwo \n";

# Ranges
print ((1 .. 6), "\n");
print ((-6 .. 6), "\n");
print (('a' .. 'k'), "\n");
# Reversing a range
print "Counting down (properly this time) : ", reverse(1 .. 6), "\n";

# z is automatically converted to 0
print "Going from 3 to z: ", (3 .. 'z'), "\n";
print "Going from z to 3: ", ('z' .. 3), "\n";

# Combining aaccessing with ranges and literals
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[0,3,7..11]);
