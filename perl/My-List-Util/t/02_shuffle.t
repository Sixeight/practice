use strict;
use Test::More 1.001014;

use My::List::Util;

ok( defined &My::List::Util::shuffle, "defined shuffle()" );

{
  my @shuffled = My::List::Util::shuffle();
  is( scalar @shuffled, 0, "No args returns an empty list" );
}

{
  my @array = 1..10;
  my @shuffled = My::List::Util::shuffle(@array);
  is( scalar @array, scalar @shuffled,
    "The output list is the same size" );

  my @sames = grep { @array[$_] == @shuffled[$_] } 0..$#shuffled;
  ok( scalar @sames != scalar @shuffled,
    "The output list isn't same order" );
}

done_testing;
