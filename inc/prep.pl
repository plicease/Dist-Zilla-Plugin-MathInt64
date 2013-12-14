use strict;
use warnings;
use Path::Class qw( file dir );

foreach my $key (sort keys %ENV)
{
  print "$key=$ENV{$key}\n";
}

my $src = file(__FILE__)->parent
                        ->parent
                        ->parent
                        ->subdir('Math-Int64')
                        ->subdir('c_api_client')
                        ->absolute;
my $dst = file(__FILE__)->parent
                        ->parent
                        ->subdir('share');

foreach my $file ($src->children)
{
  my $fn = $file->basename;
  print $fn, "\n";
  $dst->file($fn)->spew(scalar $file->slurp);
}
