#!/bin/sh

# sort on last name
sort -k +2 -b -f -u bufferbloat.list > bloat.list

(
echo '<!DOCTYPE HTML> 
<head> 
  <title>Cerowrt Credits</title> 
  <link rel="stylesheet" type="text/css" href="/uberwrt/static/cerowrtstyle.css" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head> 
 
<div>'
echo '<center><h1>CeroWrt Credits</h1></center>'
echo '<p align="center"><i>This release of CeroWrt is dedicated to the memory of <a href="http://tools.ietf.org/html/rfc2468">Jonathon B. Postel</a>, who with his persistence, passion, and equanimity, helped get the Internet this far.</i></p>'

echo '<center><h2><a href="http://www.bufferbloat.net/projects/bloat">Bufferbloat Project</a></h2></center>
<p align="center"><a href="http://en.wikipedia.org/wiki/Jim_Gettys">Jim&nbsp;Gettys</a>
<a href="http://www.taht.net">Dave&nbsp;Täht</a></p>'

./mkcredits bloat.list 

# Do openwrt up right
echo '<div></div><div><p>&nbsp;</p>'
echo '<center><i>We are deeply indebted to the following members of the OpenWrt project for their help on irc and email and for helping create OpenWrt itself.</i></center>'
echo '<center><h2><a href="http://www.openwrt.org">OpenWrt</a></h2></center>'
echo '<center><table><tr width="98%"><td width="25%">'
C=`cat openwrt.list | wc -l`
J=0
cat openwrt.list | while read x
do
echo $x
J=$(($J + 1))
[ $J -lt $C ] && echo '</td><td width="25%">'
done
echo '</td></tr></table></center>'
echo '</div>'

echo '<div><center><h2>Special Thanks</h2></center>'
echo '<center><table><tr><td width="25%">'
C=`cat special.list | wc -l`
J=0
cat special.list | while read x
do
echo $x
J=$(($J + 1))
[ $J -lt $C ] && echo '</td><td width="25%">'
done
echo '</td></tr></table></center>'
echo '</div>'

# Assemble the projects
echo '<div><center><h2>Related Projects</h2><table><tr>'
for i in bismark iscwrt wisp6
do
echo '<td width="33%">'
cat $i.list | sed ':a;N;$!ba;s#\n#<br />#g'
echo '</td>'
done
echo '</tr></table></center></div>'
echo '<center><h2>Support</h2></center>'
echo '<p>We thank the 
<a href="http://isc.org">Internet Systems Consortium</a>, 
<a href="http://www.alcatel-lucent.com">Alcatel-Lucent Bell Labs</a>, 
<a href="http://www.teklibre.com">Teklibre</a>, 
<a href="http://www.mit.edu">MIT</a>, 
<a href="http://www.stanford.edu">Stanford University</a> and 
<a href="http://www.gatech.edu">Georgia Technical Institute</a> 
for their support and interest in this work</a>. </p>'

echo '<p> There are no doubt thousands of other contributors uncredited, (notably nearly everyone that developed the Internet, Unix and Linux!) But if you have been involved in fixing bufferbloat, and we missed you on this list, let us know. </p>'
echo '</div>'
echo '<!-- The author of the scripts that generated this file freely confesses to be terrible at html and html5 -->'
echo '<div class="menu">
<nav>
<ul role="navigation">
<li><a href="/uberwrt/index.html">Home</a>
<li><a href="/bgi-bin/redir.sh">Administer</a>    
<li><a href="http://www.bufferbloat.net/">About Bufferbloat</a>
<li><a href="about.html">About UberWrt</a>
<li><a href="credits.html">Credits</a>
<li><a href="support.html">Help</a>
</ul>
</nav> 
</div>
</body>
</html>'
) > credits.html
