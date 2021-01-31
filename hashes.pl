#!/usr/bin/perl

# Declared with % so %hash @hash and $hash are
# all differnt

use warnings;
use strict;

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
);
# This does not print the map
print "The hash is %where\n";
# a, b and c here are hash keys
# These keys must be unique
# Accessing hashes
print "The place of a is $where{a}\n";

# You can reverse the keys and values by
my %name = reverse %where;
print "The name of placeA is $name{placeA}\n";

# Adding values to hash
$where{d} = "placeD";
print "The place of d is $where{d}\n";

# Removing an entry from the hash
delete $where{d};

# Accessing keys
for (keys %where) {
    print "$_ lives in $where{$_}\n";
}

# Accessing values
for (values %where) {
    print "$name{$_} lives in $_\n";
}
