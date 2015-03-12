use strict;
use warnings;

use Plack::Builder;
use Plack::Request;

use JSON::XS ();
use Data::Dumper;

my $json = JSON::XS->new;

open my $fh, "<", "index.html";
my $html = eval { local $/; <$fh> };

my $app = sub {
  my $env = shift;
  my $req = Plack::Request->new($env);
  my $res = $req->new_response(200);
  if ($req->method eq "POST") {
    my $fh = $req->body;
    my $body = eval { local $/; <$fh> };
    print STDERR "===========\n";
    print STDERR Data::Dumper->Dump([$req->parameters]);
    print STDERR "===========\n";
    print STDERR $body, "\n";
    print STDERR "===========\n";
    $res->content_type("application/json");
    $res->content($json->encode({a => 1}));
  } else {
    $res->content_type("text/html");
    $res->content($html);
  }
  $res->finalize;
};

builder {
  enable "Static", (
    root => ".",
    path => qr(^/dist/),
  );
  $app;
}
