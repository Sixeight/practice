use strict;
use warnings;

my %skipper_info = (
  name => "Skipper",
  hat  => "Black",
  shirt => "Blue",
  position => "Captain",
);

my %professor_info = (
  name => "Professor",
  hat  => "Black",
  shirt => "White",
  position => "Speciallist",
);

my %gilligan_info = (
  name => "Gilligan",
  hat  => "White",
  shirt => "Red",
  position => "First Mate",
);

my %mr_howell_info = (
  name => "Mr. Howell",
  hat  => undef,
  shirt => "Red",
  position => "Passenger",
);

my %mrs_howell_info = (
  name => "Mrs. Howell",
  hat  => "White",
  shirt => "Yellow",
  position => "Passenger",
);

my @all = (
  \%skipper_info,
  \%professor_info,
  \%gilligan_info,
  \%mr_howell_info,
  \%mrs_howell_info,
);

for my $info (@all) {
  $info->{location} = ($info->{name} =~ /Howell/) ?
    "The Island Country Club" : "The Island";

  print "$info->{name} at $info->{location}.\n";
}

__END__

my %skipper_info = (
  name => "Skipper",
  hat  => "Black",
  shirt => "Blue",
  position => "Captain",
  address => "The Island",
);

my %professor_info = (
  name => "Professor",
  hat  => "Black",
  shirt => "White",
  position => "Speciallist",
  address => "The Island",
);

my %gilligan_info = (
  name => "Gilligan",
  hat  => "White",
  shirt => "Red",
  position => "First Mate",
  address => "The Island",
);

my %mr_howell_info = (
  name => "Mr. Howell",
  hat  => "White",
  shirt => "Red",
  position => "First Mate",
  address => "The Island Country Club",
);

my %mrs_howell_info = (
  name => "Mrs. Howell",
  hat  => "White",
  shirt => "Red",
  position => "First Mate",
  address => "The Island Country Club",
);

my @all = (
  \%skipper_info,
  \%professor_info,
  \%gilligan_info,
  \%mr_howell_info,
  \%mrs_howell_info,
);

sub show_hash {
  my $infos = shift;

  my $format = "%-15s %-7s %-7s %-15s\n";
  printf $format, qw(Name Shirt Hat Position);

  for my $info (@$infos) {
    printf $format, @$info{qw(name shirt hat position)};
  }
}

sub show_addresses {
  my $infos = shift;

  for my $info (@$infos) {
    print "$info->{name} at $info->{address}.\n";
  }
}

show_hash(\@all);

print "\n";

show_addresses(\@all);
