  SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSS    SSS
  SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSS    SSS
  SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSSS   SSS
  SSSSS      SSSS       SSS    SSS SSS    SSS    SSSS    SSSSS  SSS
  SSSSS      SSSS       SSS    SSS SSS    SSS    SSSS    SSSSSS SSS
  SSSSSSSSSS SSSSSSS    SSS    SSS SSS    SSS    SSSS    SSSSSSSSSS
  SSSSSSSSSS SSSSSSS    SSS    SSS SSS    SSS    SSSS    SSSSSSSSSS
       SSSSS SSSS       SSS SSSS:S SSS    SSS    SSSS    SSS SSSSSS
       SSSSS SSSS       SSS  SSSS: SSS    SSS    SSSS    SSS  SSSSS
  SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS   SSSS
  SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS
  SSSSSSSSSS SSSSSSSSSS SSSSSSS:SS SSSSSSSSSS SSSSSSSSSS SSS    SSS

   [S]earch   [E]ngine   [Q]uery   [U]rl   [I]nformation   [N]oter
                 Version 0.1 by Peter Sergeant

Legal# Copyright (C) 2000 Peter Sergeant
Legal# This program is free software; you can redistribute it and/or
Legal# modify it under the terms of the GNU General Public License as
Legal# published by the Free Software Foundation; either version 2 of
Legal# the License, or (at your option) any later version.
Legal# This program is distributed in the hope that it will be
Legal# useful, but WITHOUT ANY WARRANTY; without even the implied
Legal# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
Legal# PURPOSE.  See the GNU General Public License for more details.
Legal# You should have received a copy of the GNU General Public
Legal# License along with this program; if not, write to the Free
Legal# Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
Legal# MA 02111-1307 USA

 Included with in this package:
 -> Sequin.pm			The module itself
 -> Readme.txt			This File
 -> License.txt		GNU General Public License
 -> Example.pl			A very simple example file

 To install:
 Simply place this file in Perl's lib/URI/ or lib/site/URI folder.

 This module is, as of this release,  in its *very* early stages. This
 release in  fact is  mainly just  so people  can have  a look  at the
 module,  point out  any bugs  that they  can see  already and prehaps
 offer help...

 The module  started its  life as a CGI script, that was full of bugs,
 and was one of my first Perl programs. I would like to think that the
 quality of the scripting has improved somewhat since then.

 In it's present state,  the main subroutine accepts an URL, which and
 tries to determine if this  URL is that of a Search-Engine query.  If
 it is,  it will decide which search terms were used,  and return both
 the name of the search engine, and the keywords used.

 Of course,  there are many plans for the future of it, and as, at the
 time  of  writing  (14-2-00)  I'm  ill,  this  version  may  never be
 released, and some of the features I hope to include will be included
 in the real first version.  Who knows?  Following is a list of future
 releases, and what I hope to include in them...

  (0.1) - That which you have now
  (0.2) - Inclusion of about 20 new search engines
  (0.3) - Gives approximate ranking of URL on the search engine
  (0.4) - Will give exact ranking of URL on the search engine
  (0.5) - Gives information about other sites listed near URL
  (+++) - Maybe Re-register the URL or process whole log file

 Presently, usage of the module is very easy. The example below should
 answer all questions... Failing that, or if you'd like help, I can be
 reached on sargie@hotmail.com,  and the script's home can be found at
 http://badassscripts.hypermart.net/sequin/

 Example Script:
 EXAMPLE# #!/usr/bin/perl
 EXAMPLE# use URI::Sequin;
 EXAMPLE# @engines = qw(
 EXAMPLE# 	http://search.excite.com/search.gw?search=cats+and+dogs
 EXAMPLE# 	http://search.yahoo.com/bin/search?p=cats+and+dogs
 EXAMPLE# 	http://www.google.com/search?q=cats+and+dogs
 EXAMPLE# );
 EXAMPLE#
 EXAMPLE# foreach $engine (@engines) {
 EXAMPLE# 	print %{&parse_url($engine)}->{'engine'} . "\n";
 EXAMPLE# 	print %{&parse_url($engine)}->{'terms'} . "\n";
 EXAMPLE# }