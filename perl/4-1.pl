use strict;
use warnings;

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
  Gilligan => \@gilligan,
  Skipper => \@skipper,
  Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
  my ($item_map) = @_;

  foreach my $name (keys %$item_map) {
    my $items = $item_map->{$name};
    check_required_items($name, $items);
  }
}

sub check_required_items {
  my $name = shift;
  my $items = shift;

  my %whose_items = map { $_, 1 } @$items;

  my @required = qw(preserver sunscreen water_bottle jacket);

  my @missings = ();

  for my $item (@required) {
    unless ($whose_items{$item}) {
      print "$name is missing $item.\n";
      push @missings, $item;
    }
  }

  if (@missings) {
    print "Adding @missings to @$items for $name.\n";
    push @$items, @missings;
  }
}


__END__

sub check_required_items {
  my $name = shift;
  my $items = shift;

  my %whose_items = map { $_, 1 } @$items;

  my @required = qw(preserver sunscreen water_bottle jacket);

  my @missings = ();

  for my $item (@required) {
    unless ($whose_items{$item}) {
      print "$name is missing $item.\n";
      push @missings, $item;
    }
  }

  if (@missings) {
    print "Adding @missings to @$items for $name.\n";
    push @$items, @missings;
  }
}

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = (Skipper => \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = (Professor => \@professor);

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = (Gilligan => \@gilligan);

my @all_with_names = (
  \@skipper_with_name,
  \@professor_with_name,
  \@gilligan_with_name,
);

for my $item_with_name (@all_with_names) {
  check_required_items(@$item_with_name);
}
