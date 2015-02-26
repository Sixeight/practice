use strict;
use warnings;

use Plack::Builder;
use Plack::Request;

my $app = sub {
  my $env = shift;
  my $req = Plack::Request->new($env);
  my $res = $req->new_response(200);
  if ($req->path_info eq "/") {
    $res->redirect("index.html");
  } else {
    $res->body("ok");
  }
  $res->finalize;
};


builder {
  enable "Plack::Middleware::Static",
    path => qr{\.(html|js)$}, root => ".";
  $app;
};
