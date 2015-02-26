use strict;
use warnings;

print map { "    $_\n" } grep { (-s) < 1000 } @ARGV;

__END__
use File::Spec::Functions;

my @files = grep { -f $_ } glob catfile($ARGV[0], "*");
my @small_files = grep { -s $_ < 1000 } @files;
print $_ for map { "    $_\n" } @small_files;
