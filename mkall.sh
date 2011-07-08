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
echo '<h1>CeroWrt Credits</h1>
<h2><a href="http://www.bufferbloat.net/projects/bloat">Bufferbloat Project</a></h2>
<p align="center"><a href="http://en.wikipedia.org/wiki/Jim_Gettys">Jim&nbsp;Gettys</a>
<a href="http://www.taht.net">Dave&nbsp;Täht</a></p>'

./mkcredits bloat.list 

# Do openwrt up right
echo '<div>'
echo 'We are deeply indebted to the following members of the Openwrt project for their help on irc and email and for helping create OpenWrt itself:'
echo '<h2><a href="http://www.openwrt.org">Openwrt</a></h2>'
# FIXME: Make columnar
cat openwrt.list | sed ':a;N;$!ba;s#\n#<br />#g'
echo '</div>'

echo '<div>'
# Advisors?
# FIXME: Make columnar
echo '<h2>Special Thanks</h2>'
cat special.list | sed ':a;N;$!ba;s#\n#<br />#g'
echo '</div>'

# Assemble the projects
for i in bismark iscwrt wisp6
do
echo '<div>'
cat $i.list | sed ':a;N;$!ba;s#\n#<br />#g'
echo '</div>'
done
echo '<h2>Support</h2>'
echo '<p>We thank the 
<a href="http://isc.org">Internet Systems Consortium</a>, 
<a href="http://www.alcatel-lucent.com">Alcatel-Lucent Bell Labs</a>, 
<a href="http://www.teklibre.com">Teklibre</a>, 
<a href="http://www.mit.edu">MIT</a>, 
<a href="http://www.stanford.edu">Stanford University</a> and 
<a href="http://www.gatech.edu">Georgia Technical Institute</a> 
for their support and interest in this work</a>. </p>'

echo '<p> There are no doubt thousands of other contributors uncredited, (notably everyone that developed Unix and Linux!) But if you have been involved in fixing bufferbloat, and we missed you on this list, let us know. </p>'
echo '<p> This release of CeroWrt is dedicated to the memory of <a href="http://tools.ietf.org/html/rfc2468">Jonathon B. Postel</a>, who with his persistence, passion, and equanimity, helped get the Internet this far. '
echo '</div>'
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
