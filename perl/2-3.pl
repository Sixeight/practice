use strict;
use warnings;

use Business::ISBN;

my $isbn = Business::ISBN->new( $ARGV[0] || "9781449393090" );

print "ISBN is " . $isbn->as_string . "\n";
print "Group code: " . $isbn->group_code . "\n";
print "Publisher code: " . $isbn->publisher_code . "\n";
