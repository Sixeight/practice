use strict;
use Test::More 1.001014;

use My::List::Util;

ok( defined &My::List::Util::sum, "sum() is defined" );

is( My::List::Util::sum(1, 2, 3), 6,
  "1 + 2 + 4 = 6" );
is( My::List::Util::sum(1..10), 55,
  "sum(1..10) = 55" );
is( My::List::Util::sum, undef,
  "return undef with empty arguments" );
is( My::List::Util::sum(qw(a b c)), undef,
  "all invalid args" );
is( My::List::Util::sum(qw(a 2 c, 5)), 7,
  "some valid args" );
is( My::List::Util::sum(qw(1 2 3 4 5)), 15,
  "all string" );
is( My::List::Util::sum(1, 2, 3, 4, 5, -5), 10,
  "some minus number" );
is( My::List::Util::sum(1.1, 1.9), 3.0,
  "float number" );

done_testing;
