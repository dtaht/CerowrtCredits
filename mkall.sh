#!/bin/sh

# sort on last name
sort -k +2 -b -f -u bufferbloat.list > bloat.list
sort -k +2 -b -f -u donors.list subs.list > subscribers.list

(
echo '<!DOCTYPE HTML>
<head>
  <title>CeroWrt Credits</title>
  <link rel="stylesheet" type="text/css" href="static/cerowrtstyle.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>'
echo '<div class="center"><h1>CeroWrt Credits</h1>'
echo '<p><i>This release of CeroWrt is dedicated to the memory of <a href="http://www.spcecdt.com/">John H Dubois</a>, who spread email and netnews through Santa Cruz, Ca, <a href="http://armory.com">housed many a geek</a>, and brought <a href="http://www.armory.com/~spcecdt/cooking/recipes/chocolateIceCream.html">liquid nitrogen ice cream</a> to Burning Man... And to <a href="http://digital-rag.com">Richard Pitt</a>, who helped bring the Internet to western Canada, wrote <a href="http://digital-rag.com/article.php/Buffer-Bloat-Packet-Loss">the Digital Rag</a>, and put <a href="http://www.hancockwildlife.org/article.php/RichardPittFund">webcams in eagles nests</a>. And to <a href="http://ronsravings.blogspot.com">Ronald Täht</a>, who taught me more than he ever understood.</i></p>'

# Do openwrt up right
echo '</div>'
echo '<div class="center"><b>We are deeply grateful to the following members of the OpenWrt project for their help on <abbr title="Internet Relay Chat">IRC</abbr> and email and for helping create OpenWrt itself.</b>'
echo '<h2><a href="http://www.openwrt.org">OpenWrt</a></h2>'
echo '<table><tr><td>'
C=`cat openwrt.list | wc -l`
J=0
cat openwrt.list | while read x
do
echo $x
J=$(($J + 1))
[ $J -lt $C ] && echo '</td><td>'
done
echo '</td></tr></table>'
echo '</div>'
echo '<div class="center"><br /><b>The CeroWrt effort would <a href="http://www.teklibre.com/cerowrt/subscribe.html">die without financial support</a>. We are indebted to the following</b>'
echo '<h2><a href="http://www.teklibre.com/cerowrt/subscribe.html">CeroWrt Donors and Subscribers</a></h2>'
echo '<table><tr><td class="narrow">'
C=`cat subscribers.list | wc -l`
J=0
K=0
cat subscribers.list | while read x
do
echo $x
J=$(($J + 1))
K=$(($K + 1))
if [ $K -gt 3 ] 
then
	echo '</td></tr><tr><td>'
	K=0
else
	echo '</td><td>'
fi
done
echo '</td></tr></table>'
echo '</div>'

echo '<div class="center"><br /><b>CeroWrt is a sub-project of the overall de-bloating efforts of the members of</b><h2><a href="http://www.bufferbloat.net/projects/bloat">The Bufferbloat Project</a></h2>
<p><a href="http://gettys.wordpress.com/">Jim&nbsp;Gettys</a>
<a href="http://www.taht.net">Dave&nbsp;Täht</a></p></center>'

./mkcredits bloat.list
echo '</div>'
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

echo '<div class="center"><h2>Corporate and Academic Support</h2></div>'
echo '<p>We thank the
<a href="http://isc.org">Internet Systems Consortium</a>,
<a href="http://www.alcatel-lucent.com">Alcatel-Lucent Bell Labs</a>,
<a href="http://www.candelatech.com">Candela</a>,
<a href="http://www.cisco.com">Cisco</a>,
<a href="http://www.comcast.com">Comcast</a>,
<a href="http://www.gatech.edu">Georgia Institute of Technology</a>,
<a href="http://www.google.com">Google</a>,
<a href="http://www.intermapper.com">InterMapper</a>,
<a href="http://www.ipfire.com">IPFire</a>,
<a href="http://www.lincs.fr">Lincs Lab</a>,
<a href="http://www.mit.edu">Massachusetts Institute of Technology</a>,
<a href="http://www.redhat.com">RedHat</a>,
<a href="http://www.stanford.edu">Stanford University</a>,
<a href="http://www.teklibre.com">Teklibre</a>,
<a href="http://www.ubuntu.com">Ubuntu</a>,
<a href="http://www.vyatta.com">Vyatta</a>
<a href="http://www.wushnet.net">Wushnet</a>, and
<a href="http://www.yandex.ru">Yandex</a>
for their support of and interest in the bufferbloat work.</p>'

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
