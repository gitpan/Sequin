#!/usr/bin/perl
use URI::Sequin;

print "Short Demonstration of the powers of Sequin\n";
print "----- ------------- -- ---------- -- ------\n\n";


print "Example 1: A URL that contains multiple keywords:\n";
print "http://search.excite.com/search.gw?search=cats+and+dogs\n";
$engine = "http://search.excite.com/search.gw?search=cats+and+dogs";
print %{&parse_url($engine)}->{'engine'} . " - ";
print %{&parse_url($engine)}->{'terms'} . "\n\n";


print "Example 2: Using the Real-Name Function:\n";
print "http://www.aj.com/main/askjeeves.asp?ask=cat&origin=&site_name=Jeeves&x=14&y=11\n";
$engine = "http://www.aj.com/main/askjeeves.asp?ask=cat&origin=&site_name=Jeeves&metasearch=yes&x=14&y=11\n";
print %{&parse_url($engine)}->{'rname'} . " - ";
print %{&parse_url($engine)}->{'url'} . "\n\n";


print "Example 3: Approximate Position Guessing:\n";
print "http://search.excite.com/search.gw?c=web&s=Perl&start=20&perPage=10\n";
$engine = "http://search.excite.com/search.gw?c=web&s=Perl&start=20&perPage=10\n";
print %{&parse_url($engine)}->{'terms'} . " - ";
print %{&parse_url($engine)}->{'apos'} . "\n\n";





