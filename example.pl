#!/usr/bin/perl
use URI::Sequin;
@engines = qw(
	http://www.altavista.com/cgi-bin/query?pg=q&sc=on&q=cats+and+dogs+%2Bothers&kl=XX&stype=stext&search.x=29&search.y=11
	http://search.excite.com/search.gw?search=cats+and+dogs
	http://hotbot.lycos.com/?MT=cats+an+dogs&SM=MC&DV=0&LG=any&DC=10&DE=2&BT=H&x=40&y=8
	http://infoseek.go.com/Titles?col=WW&qt=cats+and+dogs&svx=home_searchbox&sv=IS&lk=noframes
	http://www.lycos.com/srch/?lpv=1&loc=searchhp&query=catss&x=43&y=10
	http://magellan.excite.com/search.gw?search=cats+and+dogs&look=magellan&x=46&y=16
	http://www.webcrawler.com/cgi-bin/WebQuery?searchText=cats+and+dogs
	http://search.yahoo.com/bin/search?p=cats+and+dogs
	http://www.google.com/search?q=cats+and+dogs
	http://www.mamma.com/Mamma?lang=1&timeout=4&qtype=0&query=cat&Submit=Find+It%21
	http://www.aj.com/main/askjeeves.asp?ask=cat&origin=&site_name=Jeeves&metasearch=yes&x=14&y=11
);

foreach $engine (@engines) {
	print %{&parse_url($engine)}->{'engine'} . " - ";
	print %{&parse_url($engine)}->{'terms'} . "\n";
}


# Correct Output should be:
# -------------------------
# www.altavista.com - cats and dogs +others
# search.excite.com - cats and dogs
# hotbot.lycos.com - cats an dogs
# infoseek.go.com - cats and dogs
# www.lycos.com - catss
# magellan.excite.com - cats and dogs
# www.webcrawler.com - cats and dogs
# search.yahoo.com - cats and dogs
# www.google.com - cats and dogs
# www.mamma.com - cat
# www.aj.com - cat
