#!/usr/bin/perl
use URI::Sequin;
@engines = qw(
http://search.excite.com/search.gw?search=cats+and+dogs
http://search.yahoo.com/bin/search?p=cats+and+dogs
http://www.google.com/search?q=cats+and+dogs
);

foreach $engine (@engines) {
print %{&parse_url($engine)}->{'engine'} . "\n";
print %{&parse_url($engine)}->{'terms'} . "\n";
}