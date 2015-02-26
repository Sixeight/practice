use strict;
use warnings;

chdir;

while ( 1 ) {
  print "Please enter a regular expression> ";
  chomp( my $regex = <STDIN> );
  last unless defined $regex && length $regex;

  print
    map { "    $_\n" }
    grep { eval { /$regex/ } }
    glob ".* *";
}

__END__
use File::Spec;

my $PATH = "~/";
my @files = grep { -f $_ } glob File::Spec->catfile($PATH, ".* *");

while (<>) {
  last if $_ eq "\n";
  eval {
    my $pattern = qr!$_!;
    for my $file (grep { $_ =~ $pattern } @files) {
      print $file;
    }
  };
}
