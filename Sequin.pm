# Sequin v0.2
# A Pretty Fundamental Rewrite in that it intelligently guesses the search engine


package URI::Sequin;
$VERSION = 0.2;
require 5.000;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(parse_url);
use strict;
use URI::Escape;

#######################################################################
sub parse_url {
my %hlh;			# Hash loading hash
my $hln;			# Hash loading name
my $hlv;			# Hash loading value
my $igk;			# Int Guessed Keys
my $igl;			# Int Guessed Loc
my $kvb;			# Keys variable bar
my %rhv;			# Return Hash Values
my $rur = $_[0];		# Input URL
my @tsa;			# Temporary Splitting Array
my $tsv;			# Temporary Splitting Variable
($igl, $igk) = split(/\?/, $rur);
if ($igk =~ m/(?<!submit)=([^&]*\+[^&]*)/i) {
	$igk = $1;
	$igk =~ tr/+/ /; $igk =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
	$igl =~ s/http:\/\///;
	($igl) = split(/\//, $igl);
	$rhv{'engine'} = $igl;
	$rhv{'terms'} = $igk;
	return \%rhv;
}
else  {
	@tsa = split(/&/, $igk);
	foreach $tsv (@tsa)
	{
		($hln, $hlv) = split(/=/, $tsv);
		$hlv =~ tr/+/ /;
		$hlv =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
		$hlh{$hln} = $hlv;
		$kvb .= "|$hln";
	}
	if ($kvb =~ m/\|(q|search|mt|qt|query|search|p|searchText|terms|ask|.*key.*|.*search.*)[\||\z]/i) {
		$igk = $hlh{$1};
		$igl =~ s/http:\/\///;
		($igl) = split(/\//, $igl);
		$rhv{'engine'} = $igl;
		$rhv{'terms'} = $igk;
		return \%rhv;
	}
	else {return undef;}
}
}
1;

__END__

=head1 NAME

URI::Sequin - Extracts useful information from Search Engine URLs

=head1 SYNOPSIS

   use URI::Sequin;
   
   $engine = "http://www.google.com/search?q=cats+and+dogs";
   
   print %{&parse_url($engine)}->{'engine'} . " - ";
   print %{&parse_url($engine)}->{'terms'} . "\n";


=head1 DESCRIPTION

So, what's new? The whole module has been fundamentally rewritten.
Gone is the obsolete and limited database that the last program took
its information from and in is an intelligent guessing device, that
takes a guess at the search terms and the search engine. It has been
tested on, and works on:

	* Altavista		(www.av.com)
	* Ask Jeeves		(www.aj.com)
	* Excite		(www.excite.com)
	* Google		(www.google.com)
	* Hotbot		(www.hotbot.com)
	* Infoseek		(www.infoseek.com)
	* Lycos			(www.lycos.com)
	* Magellan		(magellan.excite.com)
	* Mamma			(www.mamma.com)
	* Webcrawler		(www.webcrawler.com)
	* Yahoo			(www.yahoo.com)
	
If anyone finds a search engine it doesn't work on, please email me
ASAP so that I can make necessary changes in the next release...

How does it work? When it's passed an URL, it takes the QUERY_STRING
used, if one is used in the URL, and attempts to find out the search
terms from it. If it can, it returns the search terms and the base
url of the search engine in a reference to an hash containing the
information.

=head1 AUTHOR

Written by Peter Sergeant (sargie@hotmail.com)
http://badassscripts.hypermart.net/sequin/

=head1 SEE ALSO

See the readme.txt file for important copyright information,
information on using this module in scripts you plan to sell or
distribute and future plans. In short, make sure you read readne.txt.

=head1 VERSION

Version 0.2	  15 Feb 2000

=cut