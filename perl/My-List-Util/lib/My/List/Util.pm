package My::List::Util;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

sub sum {
  my $sum;
  $sum += $_ for grep { /\A-?\d+\.?\d*\z/ } @_;
  return $sum;
}

sub shuffle {
  my @list = @_;
  return unless @list;

  my $i = @list;
  while ($i--) {
    my $j = int rand $i + 1;
    @list[$i, $j] = @list[$j, $i];
  }
  return @list;
}

1;
__END__

=encoding utf-8

=head1 NAME

My::List::Util - practice module

=head1 SYNOPSIS

    use My::List::Util;

    my @array = 1..10;

    My::List::Util::sum(@array);
    My::List::Util::shuffle(@array);

=head1 DESCRIPTION

My::List::Util is the module that created for practice.

=head1 LICENSE

Copyright (C) Tomohiro Nishimura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Tomohiro Nishimura E<lt>tomohiro68@gmail.comE<gt>

=cut
