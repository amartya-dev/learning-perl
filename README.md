# learning-perl

Programs to begin coding with perl, covers mostly the basics

## Basics

- You can print stuff by separating through commas.
- You can irectly print binary values by

```perl
print 01101;
```

- It is a good practice to use warnings and strict when executing a perl program like so:
  - The first line of the program just represents the path to perl executable

```perl
#!/usr/bin/perl
use warnings;
use strict;

print 01101;
```

- Numbers in perl can be represented by using `_` where you would normally use `,` when writing large numbers in plain english

```perl
my $longnumber = 25_000;
print "The number actually is ", $longnumber, "\n"; # prints 25000
```

## Strings

- refer `strings.pl`
- Escape sequences are just like any other language, you only need to escape `\` when using double quotes, you would not need to escape it in single quotes

```perl
#!/usr/bin/perl
use warnings;
use strict;

print "C:\\WINNT\\Profiles\\\n";
print 'C:\WINNT\Profiles\ ', "\n"; # the space after \ here is necessary
```

- The space after the last `\` in the above program is necessary as otherwise it would be trated like an escape for `'` and the `'` would never be closed.
- There is an option to use custom delimeters with `qq` or `q` for specifying double / single quotes. (Real cool stuff XD)

```perl
#!/usr/bin/perl
use warnings;
use strict;

print qq|'"Hi," said Jack. "Have you read /. today?"'\n|;
```

- Another way to declare paragraphical strings is using `<<` operator with a delimeter, example (basically unix shell functionality)

```perl
#!/usr/bin/perl
use warnings;
use strict;

print <<EOF
This is a paragraph like text or here-document. It starts on the line after the two arrows,
and it ends when the text following the arrows is found at the beginning
of a line, like this:
EOF
```

## Variables

- refer `variables.pl`
- Global variables are referred to as `our` variables and local can be referred to as `my`, although, most of the times, `my` is the word used.
- `{}` can be used to create a block in perl and the variables declared inside are scoped to the block only also called _lexical variables_.
- Variable names need to start with `$` followed by a letter, or underscore (_). `$_` is a special variable used by perl in case it has no other option, more on this later.

```perl
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
```

- Variables are interpolated in string

```perl
my $name = "Amartya";
print "My name is $name\n"; # $name prints the value here
```

- To add some substring to the variable while interpolating it, you could do something like this:

```perl
# Interpolate and add extra strings
my $times = 8;
print "This is the ${times}th time.\n";
```

## Lists

- refer `list.pl`
- `()` represents an empty list
- Lists can be directly provided to a print statement like so:

```perl
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
```

- The `qw` operator can be used while declaring a list of words, it can make declaring them easier, although the `,` separator is not used in that case

```perl
print qw (
    one
    two
    three
    four
);
```

- List values are indexed from 0 and can be easily accessed like in any other language like so:

```perl
my $month = 3;
print qw(
    Januaury    February    March
    April       May         June
    July        August      September
    October     November    December
)[$month], "\n";
```

- The above is just another example on how `qw` can be helpful as it lets you declare a list with arbitrary number of tab spaces in between which allows us to write stuff in the above format.
- `-1` can be used to access the last element
- Lists can be used to assign values to multiple variables or even swapping them:

```perl
my $mone; my $mtwo;
($mone, $mtwo) = (1, 3); # Lists are legal lvalues

# Swapping
($mtwo, $mone) = ($mone, $mtwo);
```

- A range of values can be put together as a list using `..` operator, this can be used for both numeric and alphabetical ranges

```perl
# Ranges
print ((1 .. 6), "\n");
print ((-6 .. 6), "\n");
print (('a' .. 'k'), "\n");
```

- Lists can be accessed using a combination of ranges and literals like so:

```perl
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[0,3,7..11]);
```

## Arrays

- Yes these are two different things
- refer `array.pl`
- The variable for an array must start with `@`, that is how you represent arrays in perl
- To access the length of the array, you can simply assign it to a scalar, perl automatically tries to make sense of assignments in case it is not very specific from the usage, thus, when you try to convert the array into a scalar, the length of the array will be assigned to it

```perl
my @array1;
my $scalar1;
@array1 = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
$scalar1 = @array1;
print "Array 1 is @array1\nScalar 1 is $scalar1\n";
```

- When you print an array with the variable inside `""`, they get interpolated to give you a better representation with a space separator, this is called `stringyfying` the array.
- You can alsso do the same by using the keyword `scalar` like so:

```perl
print scalar @array2, "\n"; # Accessing array in scalar context
```

- When you put in a list within a list, perl automatically flattens it, thus this technique could be used to add elements to an array like so:

```perl
@array2 = (23, @array1, 12); # Not a good way
print "@array2\n";
```

### Array data manipulation

- Another way to add / delete data to / from array is to use `push`, `pop`, `shift`, `unshift`, `pop`, `push` are used like in a stack whereas `shift`, `unshift` are used like in a queue:

```perl
my $element = pop @array2;
print "$element is popped from array2 now the array2 is \n@array2 \n";
push @array2, $element;
print "$element is pushed to array2 now the array2 is \n@array2 \n";
unshift (@array2, "first");
print "Array is @array2 \n";
shift @array2;
print "Array is @array2 \n";
```

- Values from arrays can be accessed as from list although, when trying to get a valye from an array through an array variable one thing should be kept in mind. The general rule for a prefix for a variable name is to represent what you want to get rather than what you have got `$` represents you are getting a scalar whereas `@` represents an array, so following can be the ways to access the first element from an array:

```perl
my $firstElement = $array1[0]; # If you want to get it directly or
print "$firstElement \n";
$firstElement = (@array1)[0];
print "$firstElement \n";
```

- Multiple values can be assigned to arrays in the following manner:

```perl
@array1[0, 1] = @array1[1, 0];
print "@array1\n";
```

- You can also iterate through an array using a for loop, the general syntax being `for <ITERATOR> (<LIST OR ARRAY>) <BLOCK>`:

```perl
for $element (@array1) {
    print $element, "\n";
}
```

- If we do not supply an iterator, perl uses the special `$_`, like so:

```perl
for (@array2) {
    print $_, "\n";
}
```

- You can also loop through index using ranges like so:

```perl
for (0..$#array2) {
    print "Looping in array 2 : $array2[$_] is the ${_}th value\n";
}
```

- `$#` is used to get the position of highest element in the array, Simply assigning it to a scalar gets you the length whereas using `$#` gives you the position for last element.

### Sorting an array

- You can sort array using the `sort` word, which defaults to a string comparison unless specified otherwise, you could supply the sorting technique to be used in `{}` for it to sort either according to strings or numeric values like so:

```perl
my @unsorted = (1, 2, 11, 24, 3, 36, 40, 4);
my @string = sort { $a cmp $b } @unsorted;
print "String sort: @string\n";
my @number = sort { $a <=> $b } @unsorted;
print "Numeric sort: @number\n";
```

## Hashes

- A hash is declared using `%`, it can be done in the following two ways:

````perl
# Declaring a hash
my %where = (
    "a" , "placeA",
    "b", "placeB",
    "c", "placeC"
);
# OR
%where = (
    a => "placeA",
    b => "placeB",
    c => "placeC"
);```
- Hashes do not get interpolated when used inside a string
```perl
# This does not print the map
print "The hash is %where\n";
````

- The keys used should be unique
- You can change keys to values and vice-versa using `reverse`, like so:

```perl
my %name = reverse %where;
print "The name of placeA is $name{placeA}\n";
```

- Accessing and adding values is done by specifying key in curly braces, like so:

```perl
# Adding values to hash
$where{d} = "placeD"; # This adds a new key d if it does not exist
print "The place of d is $where{d}\n";

# Accessing hashes
print "The place of a is $where{a}\n";
```

- A pair could be deleted from a hash like so:

```perl
# Removing an entry from the hash
delete $where{d};
```

- Keys and valus of hashes can also be looped through

```perl
# Accessing keys
for (keys %where) {
    print "$_ lives in $where{$_}\n";
}

# Accessing values
for (values %where) {
    print "$name{$_} lives in $_\n";
}
```

## Conditionals

- if else are pretty much like every other language, refer `ifelseandloops.pl`
- What is false in perl?
  - An empty string
  - The number `0` and string `"0"` are both false
  - An empty list, `()`, is false
  - The undefined value is false
- `(())` is also false XD
- Comparing strings in perl
  - `$a gt $b` `$a` sorts alphabetically after `$b`
  - `$a le $b` `$a` sorts alphabetically before `$b`
  - `$a eq $b` `$a` is the same as `$b`
  - `$a ne $b` `$a` is not the same as `$b`
- We can determine if a variable is defined by using `defined`, like so:

```perl
my ($a, $b);
$b = 10;
if (defined $a) {
    print "\$a has a value.\n";
}
if (defined $b) {
    print "\$b has a value.\n";
}
```

- You could use `not`, `and`, `or` or `!`, `&&` and `||`, although the words have lower precedence than the symbols
- Another way to write `not` is to use `unless`, like so:

```perl
unless (exists $rates{$to}) {
    die "I don't know anything about {$to} as a currency\n";
}
```

- You could also write the above things like:

```perl
die "I don't know anything about $to as a currency\n"
    unless exists $rates{$to};
die "I don't know anything about $from as a currency\n"
    unless exists $rates{$from};
exists $rates{$to}
    or die "I don't know anything about {$to} as a currency\n";
```

- If else if else can be done like:

```perl
if ( <condition 1> ) {
    <action>
} else {
    if ( <condition 2> ) {
        <second action>
    } else {
        if ( <condition 3> ) {
            <third action>
        } else {
            <if all else fails>
        }
    }
}

# OR A BETTER WAY TO DO THIS IS:
if ( <condition 1> ) {
    <action>
} elsif ( <condition 2> ) {
    <second action>
} elsif ( <condition 3> ) {
...
} else {
    <if all else fails>
}
```

- Another way to if else

```perl
print "Please enter your selection (1 to 10): ";
my $choice = <STDIN>;
for ($choice) {
    $_ == 1 && print "You chose number one\n";
    $_ == 2 && print "You chose number two\n";
    $_ == 3 && print "You chose number three\n";
...
}
```
- Unless can be used like an opposite of if something like:
```perl
unless (exists $rates($to)) {
    die "I do not know anything about {$to} as a currency \n";
}
```
- `unless` can also be use in this other way:
```perl
die "statement" unless extsts $rates{$to}
```

- Another way to write an if else in a sort of short way is:
```perl
exists $rates{$to} or die "statement"
```

## For loops
- A `for` loop in perl is basically `foreach`, i.e., it only works with an iterator and a list / array to get stuff from:
```perl
#!/usr/bin/perl
use warnings;
use strict;

my @array = (1, 3, 5, 7, 9);

my $i;
for $i (@array) {
    print "The element encountered is $i\n";
}
```
 - Since `for` loop is basically `foreach`, perl allows you to use both words:
 ```perl
 foreach $i (@array) {
     print "The element encountered is $i";
 }
 ```

- Decalring the iterator with the for statement creates a new variable every time the loop runs and that will exist only during the duration of the loop:
```perl
my @array = (1, 3, 5, 7, 9);

for my $i (@array) {
    print "The element encountered is $i\n";
}
```

- When we change the iterator, the value in the original array gets updated, that is because for loop creates an alias rather than a value:
```perl
#!/usr/bin/perl
# forloop5.plx
use warnings;
use strict;
my @array = (1..10);
foreach (@array) {
    $_++;
}
print "Array is now: @array\n";
# The output is 2 3 4 5 6 7 8 9 10 11
```

- This does not work if we are dealing with a list supplied as the iterable:
```perl
foreach (1, 2, 3) {
    $_++; # Throws an error
}
```
- The short forms like using unless or if after the statement are called segment modifiers, there is a segment modifier for `for` too:
```perl
#!usr/bin/perl
use warnings;
use strict;

my $total = 0;
$total += $_ for @ARGV;
print "The sum for the supplied numbers in args is : $total\n";
```

- The `@ARGV` is an array of the command line arguments supplied while running the program, they are automatically parsed by perl and converted into the datatype that makes sense for them, you could also pass suff inside `""`, those will be parsed as strings.

## While loops 
- General synax is : `while {<condition>} {<action>}
```perl
#!/usr/bin/perl
use warnings;
use strict;

my $countdown = 5;

while ($countdown > 0) {
    print "Counting down: $countdown";
}
```

- Example while loop to stop when the user stops inputting values:
```perl
#!usr/bin/perl
use warnings;
use strict;

while (<STDIN>) {
    chomp; # Remove the \n from consideration
    die "end";
    my $entered = $_;
    print "Entered $_";
}
```

- `do while` can be used to run a condition at least once:
```perl
#!usr/bin/perl
use warnings;
use strict;

do {
    $_ = <STDIN>;
    chomp;
    my $entered = $_;
    print "Entered $entered";
} while ($_) {
    print "End all";
}
```

- Statement modifier for `while` is something like:
```perl
$my countdown = 5;
print "Counting down: $countdown" while $countdown-- > 0;
```

- The opposite of `while` is `until`, while `while` checks the condition and executes block if it is true, `until` checks condition and executes block if it evaluates to false:
```perl
#!usr/bin/perl
use warnings;
use strict;

my $countdown = 5;

until ($countdown-- == 0) {
    print "Counting down $countdown\n";
}
```

- `break` is `last` in perl whereas `continue` is `next`:
```perl
#!usr/bin/perl
use warnings;
use strict;

while (<STDIN>) {
    chomp;
    last unless $_;
    my $reversed = reverse $_;
    print "Reversed String is $_";
}

# using last in for loop
my @array = ("red", "green", "Stop", "blue");

for (@array) {
    last if $_ eq "Stop";
    print "Color : $_";
}

# using next

my @array = (8, 3, 0, 2, 12, 0);
for (@array) {
    if ($_ == 0) {
        print "Skipping";
        next;
    }
    print "Number : $_";
}
```

- We can name our loops and use them accordingly in perl something like:
```perl
#!/usr/bin/perl
use warnings;
use strict;

my @end = (quit leave stop finish);

OUTER: while (<STDIN>) {
    chomp;
    INNER: for my $check (@end) {
        last OUTER if $check eq $_;
    }
    print "Hey, you said $_\n";
}
```
