use strict;
use warnings;

use Text::Markdown::Discount;

sub convert {
  my $file_name = shift;
  local $/ = undef;
  open IN, "<", $file_name;
  my $text = <IN>;
  my $converted = Text::Markdown::Discount::markdown($text);
  close IN;
  $converted;
}

my $file_name = $ARGV[0];
my $converted = convert($file_name);

print <<EOS
<!DOCTYPE html>
<html lang="ja">
<meta charaset="utf-8" />
<head>
<link rel="stylesheet" href="github-markdown.css" />
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/github.min.css">
<style>
.markdown-body {
  min-width: 200px;
  max-width: 790px;
  margin: 0 auto;
  padding: 30px;
}
</style>
</head>
<body>
<div class="markdown-body">
$converted
</div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
</body>
</html>
EOS

