#!/bin/sh

# sort on last name
sort -k +2 -b -f -u bufferbloat.list > bloat.list

(
echo '<!DOCTYPE HTML>
<head>
  <title>CeroWrt Credits</title>
  <link rel="stylesheet" type="text/css" href="static/cerowrtstyle.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>'
echo '<div class="center"><h1>CeroWrt Credits</h1>'
echo '<p><i>This release of CeroWrt is dedicated to the memory of <a href="http://www.spcecdt.com/">John H Dubois</a>, who spread email and netnews through Santa Cruz, Ca, <a href="http://armory.com">housed many a geek</a>, and brought <a href="http://www.armory.com/~spcecdt/cooking/recipes/chocolateIceCream.html">liquid nitrogen ice cream</a> to Burning Man...</i></p><p><i> And to <a href="http://digital-rag.com">Richard Pitt</a>, who helped bring the Internet to western Canada, wrote <a href="http://digital-rag.com/article.php/Buffer-Bloat-Packet-Loss">the Digital Rag</a>, and put <a href="http://www.hancockwildlife.org/article.php/RichardPittFund">webcams in eagles nests</a>. </i></p>'

# Do openwrt up right
echo '</div><p>&nbsp;</p>'
echo '<div class="center"><i>We are deeply indebted to the following members of the OpenWrt project for their help on <abbr title="Internet Relay Chat">IRC</abbr> and email and for helping create OpenWrt itself.</i>'
echo '<h2><a href="http://www.openwrt.org">OpenWrt</a></h2>'
echo '<table><tr><td class="narrow">'
C=`cat openwrt.list | wc -l`
J=0
cat openwrt.list | while read x
do
echo $x
J=$(($J + 1))
[ $J -lt $C ] && echo '</td><td class="narrow">'
done
echo '</td></tr></table>'
echo '</div>'

echo '<center><h2><a href="http://www.bufferbloat.net/projects/bloat">Bufferbloat Project</a></h2>
<p><a href="http://en.wikipedia.org/wiki/Jim_Gettys">Jim&nbsp;Gettys</a>
<a href="http://www.taht.net">Dave&nbsp;Täht</a></p></center>'

./mkcredits bloat.list
echo '<div class="center"><h2>Special Thanks</h2>'

echo '<table><tr><td class="narrow">'
C=`cat special.list | wc -l`
J=0
cat special.list | while read x
do
echo $x
J=$(($J + 1))
[ $J -lt $C ] && echo '</td><td class="narrow">'
done
echo '</td></tr></table>'
echo '</div>'

echo '<div class="center"><h2>Support</h2></div>'
echo '<p>We thank the
<a href="http://isc.org">Internet Systems Consortium</a>,
<a href="http://www.alcatel-lucent.com">Alcatel-Lucent Bell Labs</a>,
<a href="http://www.teklibre.com">Teklibre</a>,
<a href="http://www.intermapper.com">Intermapper</a>,
<a href="http://www.candelatech.com">Candela</a>,
<a href="http://www.comcast.com">Comcast</a>,
<a href="http://www.mit.edu">Massachusetts Institute of Technology</a>,
<a href="http://www.stanford.edu">Stanford University</a>,
<a href="http://www.gatech.edu">Georgia Tech</a>, and
<a href="http://www.lincs.fr">the Lincs lab</a>
for their support and interest in this work.</p>'

echo '<p> There are no doubt thousands of other contributors uncredited, (notably nearly everyone that developed the Internet, Unix and Linux!) But if you have been involved in fixing bufferbloat, and we missed you on this list, let us know. </p>'
echo '<!-- The author of the scripts that generated this file freely confesses to be terrible at html and html5 -->'
echo '<div class="menu">
<nav>
<ul role="navigation">
<li><a href="index.html">Home</a>
<li><a href="/bgi-bin/redir.sh">Administer</a>
<li><a href="http://www.bufferbloat.net/">About Bufferbloat</a>
<li><a href="about.html">About CeroWrt</a>
<li><a href="credits.html">Credits</a>
<li><a href="support.html">Help</a>
</ul>
</nav>
</div>
</body>
</html>'
) > credits.html
