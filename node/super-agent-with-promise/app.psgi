use strict;
use warnings;

use Plack::Builder;

open my $fh, "<", "index.html";
my $body = eval { local $/; <$fh> };

my $app = sub {
  my $env = shift;
  [
    200,
    ["Content-Type" => "text/html"],
    [$body],
  ]
};

builder {
  enable "Static", (
    root => ".",
    path => qr(^/dist/),
  );
  $app;
}
