use strict;
use warnings;
use utf8;

binmode STDOUT, ":utf8";

use Net::Twitter::Lite::WithAPIv1_1;
use Try::Tiny;
use Scalar::Util "blessed";

use constant HASH_TAG => "#今日の一句";

my $consumer_key        = "YOUR CONSUMER KEY";
my $consumer_secret     = "YOUR CONSUMER SECRET";
my $access_token        = "YOUR ACCESS TOKEN";
my $access_token_secret = "YOUR ACCESS TOKEN SECRET";

my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
  consumer_key        => $consumer_key,
  consumer_secret     => $consumer_secret,
  access_token        => $access_token,
  access_token_secret => $access_token_secret,
  ssl                 => 1,
);

try {
  my $response = $nt->search(HASH_TAG);
  my @statuses = @{$response->{statuses}};
  my $index = int rand(scalar(@statuses) + 1);
  my $status = $statuses[$index]->{text};
  $status =~ s/#.+//;
  $status =~ s/\s*(.*)\s*/$1/;
  print "$status\n";
} catch {
  my $err = $_;
  die $_ unless blessed $err && $err->isa("Net::Twitter::Error");

  warn "HTTP Response Code: ", $err->code, "\n",
       "HTTP Message......: ", $err->message, "\n",
       "Twitter error.....: ", $err->error, "\n";
}
