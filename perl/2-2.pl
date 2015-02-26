use strict;
use warnings;

use Data::Dumper;
use Module::CoreList;
use List::Util qw(max);

my @modules = sort keys $Module::CoreList::version{5.014002};

# my $max_length = 0;
# foreach my $module (@modules) {
#   $max_length = length $module if length $module > $max_length;
# }

my $max_length = max map { length } @modules;

foreach my $module (@modules) {
  printf "%*s %s\n" ,
    - $max_length,
    $module,
    Module::CoreList->first_release($module);
}

__END__
my @modules = Module::CoreList->find_modules(qr//, 5.014002);

foreach my $module (@modules) {
  my $first_release = Module::CoreList->first_release($module);
  print "$module is first released at $first_release\n";
}
