#!/usr/bin/perl

# Sequin Example Script

# Load Sequin
use URI::Sequin qw/se_extract key_extract log_extract %log_types/;
use strict;

# Define Log-Type
$log_types{'New'} = '^(.+) ->';


open(URLS, "<./referer_log2.txt")||die;

while(<URLS>) {

	# Get the referring URL
	my $url = &log_extract($_, 'New');

	# Get keywords
	my $key_phrase = &key_extract($url);

	# If there were keywords, get the search engine name and URL
	# and print out a copy.

	if ($key_phrase) {

		my ($se_name, $se_url) = @{&se_extract($url)};
		print "$se_name\n$se_url\n" . &key_extract($url) . "\n$url\n\n";

	}

}

close URLS;
