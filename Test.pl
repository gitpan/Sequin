
BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use URI::Sequin;
$loaded = 1;
print "ok 1\n";

$engine = "http://www.google.com/search?q=ok+2";
$blah = %{&parse_url($engine)}->{'terms'};
if ($blah) { print "$blah\n"; } else { print "not ok 2\n"; }

print "\n*If what you've just seen has been: 1..1, ok 1, ok 2 - then you are fine.\nAny not okay messages or error messages mean you have problems...\n";
