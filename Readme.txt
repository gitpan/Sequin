 SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSS    SSS
 SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSS    SSS
 SSSSSSSSSS SSSSSSSSSS SSSSSSSSSS SSS    SSS SSSSSSSSSS SSSS   SSS
 SSSSS      SSSS       SSS    SSS SSS    SSS    SSSS    SSSSS  SSS
 SSSSS      SSSS       SSS    SSS SSS    SSS    SSSS    SSSSSS SSS
 SSSSSSSSSS SSSSSSS    SSS    SSS SSS    SSS    SSSS    SSSSSSSSSS
 SSSSSSSSSS SSSSSSS    SSS     SS SSS    SSS    SSSS    SSSSSSSSSS
      SSSSS SSSS       SSS SSSS S SSS    SSS    SSSS    SSS SSSSSS
      SSSSS SSSS       SSS  SSSS  SSS    SSS    SSSS    SSS  SSSSS
 SSSSSSSSSS SSSSSSSSSS SSSSS SSSS SSSSSSSSSS SSSSSSSSSS SSS   SSSS
 SSSSSSSSSS SSSSSSSSSS SSSSSS SSS SSSSSSSSSS SSSSSSSSSS SSS    SSS
 SSSSSSSSSS SSSSSSSSSS SSSSSSS SS SSSSSSSSSS SSSSSSSSSS SSS    SSS

  [S]earch   [E]ngine   [Q]uery   [U]rl   [I]nformation   [N]oter
              Version 0.2 by Peter Sergeant (15-2-00)

Legal# Copyright (C) 2000 Peter Sergeant (sargie@hotmail.com)
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
-> License.txt			GNU General Public License
-> Example.pl			A very simple example file

Email: sargie@hotmail.com
 HTTP: http://badassscripts.hypermart.net/sequin

So, we're on Version 0.2 already. A day after the first version was
released. I'm happy to say that this version is a *HUGE* improvement
on the last...

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

Installation is pretty easy. Simply copy 'sequin.pm' to the URI
folder in your library. On the Win32 machine that I'm being forced to
write this on, this is in /lib/site/URI. It may be different on
other platforms. On a linux machine I suggest you try 'locate URI/'.

How do you use it? As anyone on EFNET #Perl can tell you, I'm a true
KLB (Known Lazy Bastard), so I'll let you work it out, but give you
the clue that example.pl should contain sufficient information to
show you how to get it working, and should allow you to check that
it's installed properly.

If you want to use Sequin in a CGI script, that you're either going
to distribute or sell, you are able to simply lift the main
subroutine from the module, and put it at the bottom of your script.
However, there are three conditions for doing this. Firstly, you ask
my permission. I will almost without exception say yes, so email me
at 'sargie@hotmail.com'. I should reply within about 24 hours.
Secondly, a sentence giving me credit for the subroutine *IS*
not only required under the license, but is common courtesy. Finally,
I'd like a copy of the script it's used in. I understand this may not
be possible in all cases, but I'd like to know why not if not.

If, you're going to use the module purely for personal use, I'd be
fascinated to see where you're using it and how you're using it, but,
you're not forced to tell me or show me.

So what's going to change in the near future with this module? Here's
a list of what to expect in future versions, which I will probably
release every week to a fortnight, depending on how much longer I'm
ill and stuck at home, and the volume of school work when I return to
school...

(0.2) - That which you have now...
(0.3) - Gives approximate ranking of URL on the search engine
(0.4) - Will contain a database of search engine information
(0.5) - Will determine ranking on some search engines


Stay happy,
Peter Sergeant