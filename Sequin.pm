package URI::Sequin;
$VERSION = 0.1;
require 5.000;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(parse_url);
use strict;

#######################################################################
sub parse_url {
	my $fkw;			# Found Key Words
	my $fse;			# Found Search Engine
	my $rur = $_[0];		# Raw URL
	my %rhv;			# Return Hash
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.altavista/) { if ($rur =~ m/[\&\?]q=([^\&\b]+)/i) {  $fse = "Altavista";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.excite/) { if ($rur =~ m/[\&\?]search=([^\&\b]+)/i) {  $fse = "Excite";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.google/) {if ($rur =~ m/[\&\?]q=([^\&\b]+)/i) {  $fse = "Google";  $fkw = $1; } 	}
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.webcrawler/) {if ($rur =~ m/[\&\?]searchText=([^\&\b]+)/i) {  $fse = "WebCrawler";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.yahoo/) {if ($rur =~ m/[\&\?]p=([^\&\b]+)/i) {  $fse = "Yahoo";  $fkw = $1; } 	}
	if ($rur =~ m/^[http:\/\/]?([^\.])+hotbot\.lycos/) {if ($rur =~ m/[\&\?]MT=([^\&\b]+)/i) {  $fse = "HotBot";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+infoseek\.go/) {if ($rur =~ m/[\&\?]qt=([^\&\b]+)/i) {  $fse = "InfoSeek";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+magellan\.excite/) {if ($rur =~ m/[\&\?]search=([^\&\b]+)/i) {  $fse = "Magellan";  $fkw = $1; } }
	if ($rur =~ m/^[http:\/\/]?([^\.])+www\.lycos/) {if ($rur =~ m/[\&\?]query=([^\&\b]+)/i) {  $fse = "Lycos";  $fkw = $1; } }
	unless ($fse) { return 0; }
	$fkw =~ tr/+/ /; $fkw =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$fkw =~ s/^(\s+)//; $fkw =~ s/(\s+)$//;
	$fkw =~ tr/+/ /; $rhv{'engine'} = $fse;
	$rhv{'terms'} = $fkw;
	return \%rhv;
}
1;