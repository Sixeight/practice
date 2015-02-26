use strict;
use warnings;

use File::Spec::Functions;
use Cwd qw( getcwd );

my $cwd = getcwd;

foreach my $file ( glob( ".* *" ) ) {
  print "    ", catfile( $cwd, $file ), "\n";
}
