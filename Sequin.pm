# Sequin v0.3


package URI::Sequin;
$VERSION = 0.3;
require 5.000;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(&parse_url);
use strict;
use URI::Escape;

#######################################################################

sub parse_url {
	my $arp;			# Approximate Ranking Position
	my %hlh;			# Hash loading hash
	my $hln;			# Hash loading name
	my $hlv;			# Hash loading value
	my $igk;			# Int Guessed Keys
	my $igl;			# Int Guessed Loc
	my $kvb;			# Keys variable bar
	my $nvr = $_[1];		# Null Value Return
	my %rhv;			# Return Hash Values
	my $rur = $_[0];		# URL
	my $srn;			# Search Engine Real Name
	my $sru;			# Search Engine Real Name URL
	my @tsa;			# Temporary Splitting Array
	my $tsv;			# Temporary Splitting Variable
	
	# Splits the URL into Locational URL and the Query String
	($igl, $igk) = split(/\?/, $rur);
	
	# Takes a Guess at the approximate position in the search engine
	if ($igk =~ m/[^xy|C]=(\d?\d1)(\D|$)/i) { $arp = $1; }
	elsif ($igk =~ m/[^xy|C]=(\d?\d0)(\D|$)/i) { $arp = $1; }
	else { $arp = "1"; }
	
	# Sees if it can name the Search Engine
	$srn = $igl; $sru = $igl;
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.(altavista|av)/) { $srn = "Altavista"; $sru = "www.av.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+\.excite/) { $srn = "Excite"; $sru = "www.excite.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+\.google/) { $srn = "Google"; $sru = "www.google.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+\.webcrawler/) { $srn = "WebCrawler"; $sru = "www.webcrawler.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+\.yahoo/) { $srn = "Yahoo"; $sru = "www.yahoo.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+hotbot\.lycos/) { $srn = "HotBot"; $sru = "www.hotbot.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+infoseek\.go/) { $srn = "Infoseek"; $sru = "www.infoseek.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+magellan\.excite/) { $srn = "Magellan"; $sru = "magellan.excite.com"; }
	if ($igl =~ m/^[http:\/\/]?([^\.])+www\.lycos/) { $srn = "Lycos"; $sru = "www.lycos.com" }
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.mamma/) { $srn = "Mamma"; $sru = "www.mamma.com"; }
	if ($rur =~ m/^[http:\/\/]?([^\.])+\.(aj|askjeeves)/) { $srn = "Ask Jeeves"; $sru = "www.aj.com";}
	
	# Try to guess the keywords
	if ($igk =~ m/(?<!next)(?<!submit)=([^&]*\+[^&]*)/i) {
		$igk = $1;
		$igk =~ tr/+/ /; $igk =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
		$igl =~ s/http:\/\///;
		($igl) = split(/\//, $igl);
		$rhv{'engine'} = $igl;
		$rhv{'terms'} = $igk;
		$rhv{'apos'} = $arp;
		$rhv{'url'} = $sru;
		$rhv{'rname'} = $srn;
		return \%rhv;
	}
	else  {
		@tsa = split(/&/, $igk);
		foreach $tsv (@tsa)
		{
			($hln, $hlv) = split(/=/, $tsv, 2);
			$hlv =~ tr/+/ /;
			$hlv =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
			$hlh{$hln} = $hlv;
			$kvb .= "|$hln";
		}
		if ($kvb =~ m/\|(search|mt|qt|query|search|searchText|terms|ask|.*key.*|.*search.*)[\||\z]/i) {
			$igk = $hlh{$1};
			$igl =~ s/http:\/\///;
			($igl) = split(/\//, $igl);
			$rhv{'engine'} = $igl;
			$rhv{'terms'} = $igk;
			$rhv{'apos'} = $arp;
			$rhv{'url'} = $sru;
			$rhv{'rname'} = $srn;
			return \%rhv;
		}
		elsif ($kvb =~ m/\|(s|p|q)[\||\z]/i) {
				$igk = $hlh{$1};
				$igl =~ s/http:\/\///;
				($igl) = split(/\//, $igl);
				$rhv{'engine'} = $igl;
				$rhv{'terms'} = $igk;
				$rhv{'apos'} = $arp;
				$rhv{'url'} = $sru;
				$rhv{'rname'} = $srn;
				return \%rhv;
		}
		else {return $nvr;}
	}
}
1;

__END__

=head1 NAME

URI::Sequin - Extracts useful information from Search Engine URLs

=head1 SYNOPSIS

	use URI::Sequin;
   
	$engine = "http://www.google.com/search?q=Perl&start=10&sa=N";
   	$temp = parse_url($engine);
	print %$temp->{'engine'} . "\n";	# The base URL of the search engine
	print %$temp->{'apos'} . "\n";		# The Approximate Ranking
	print %$temp->{'terms'} . "\n";		# The search terms used
	print %$temp->{'rname'} . "\n";		# The Real Name of the search engine
						# if in database
	print %$temp->{'url'} . "\n";		# The Real URL of the search engine
						# if in database

=head1 DESCRIPTION

Sequin is designed to parse the refering URLs that show up in your log from visitors having come from search engines. It tries to determine: search terms, the approximate location of your site in the search engine listing, the proper name of the search engine, and the URL of the search engine.
With the following search engines it succeeds:

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
	
I'd hope and imagine that it'll work on most search engines, but if you find one that it doesn't work on, please email me (address below) and tell me as soon as possible.

=head1 LIMITATIONS

As it's trying to guess the relevant information, sometimes the script will fail. However, a few things should be said so that you don't think it's failing when in fact it's doing what it should be...
Firstly, The approximate positioner is a *very* approximate position. As a general rule, if it has worked properly, it will show you a number, either ending in 1 or 0. The position of your site should this number, or up to nine above it. For example, if it returns the number 20, your site is probably ranked between 20 and 29. If it shows 1, your site is likely to be ranked between 1 and 9.
Secondly, the Real Name function will not tell you about regional sites. Therefore, yahoo.co.uk will show up as Yahoo. This is why the 'engine' field is returned, because that will, in the above example, return 'search.yahoo.co.uk'.
Finally, in the case of HotBot's refereral URL's, and in any other like it, it subdivides a field, (eg: search=MT=perl.com). In this case, all the search term is returned (MT=Perl).

=head1 AUTHOR

Written by Peter Sergeant (sargie@hotmail.com)

=head1 SEE ALSO

The readme.txt provides information about using this module in your scripts, if you intend to sell them or distribute them. It's worth reading, IMHO.
If you're confused by referencing (i.e. what the hell does %$temp->{'engine'} mean?) then it's suggested that you look at perlref in the manual.

=head1 VERSION

Version 0.3	  17 Feb 19100

=cut