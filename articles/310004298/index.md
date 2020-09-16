---
confluence-id: '310004298'
date: '2020-09-08T01:19:08.000+02:00'
last_modified_at: '2020-09-08T01:19:08.000+02:00'
layout: article
orig-title: How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf
  discovery over multicast in transparent mode
orig-title-slugified: how-to-set-up-airprint-airplay-mopria-cups-etc-with-mdns-dns-sd-bonjour-avahi-zeroconf-discovery-over-multicast-in-transparent-mode
permalink: /310004298/
published: 'true'
slug: '310004298'
tags: kb kbcore kbhowto kbmdns kbmulticast kbtransparentmode kbairprint kbigmp
title: How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf
  discovery over multicast in transparent mode
version: 32
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>As with all mDNS-based discovery, transparent mode and multicast forwarding (multiplex SAT) rules are required. 224.0.0.251 multicasts to port 5353 have to be forwarded in both directions. And, of course, the printing itself: IPP, TCP port 631.</p></td></tr></table>
<table class="wysiwyg-macro" data-macro-name="note" data-macro-id="aea36fbe-63b9-4f4f-bbcd-64470260feae" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p><strong>This NOT YET TESTED with an actual iThing, only with a Linux client + Mopria!</strong></p></td></tr></table>
<p><br></p>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e3RvY30&amp;locale=en_GB&amp;version=2" data-macro-name="toc" data-macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" data-macro-schema-version="1"></p>
<br><p><br></p>
</div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable">
<colgroup> <col> <col> </colgroup>
<tbody>
<tr>
<td class="confluenceTd"><p>Up to date for</p></td>
<td class="confluenceTd">
<p>Core 12.00.21</p>
<p>Core 13.00.00</p>
<p>Mopria Print Service for Android 2.10.6</p>
<p>CUPS (2019)</p>
</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Supported since</td>
<td colspan="1" class="confluenceTd">Core 8.70.xx</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Not valid for</td>
<td colspan="1" class="confluenceTd"></td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Status</td>
<td colspan="1" class="confluenceTd"><div class="content-wrapper"><p> <img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"> </p></div></td>
</tr>
</tbody>
</table></td></tr></table>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>mDNS? Bonjour? AirSomething?</h1>
<table class="wysiwyg-macro" data-macro-name="panel" data-macro-id="aef4ae9c-dd23-42cf-b81f-9697529467eb" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3BhbmVsfQ&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p><img class="emoticon emoticon-information" data-emoticon-name="information" border="0" src="/s/en_GB/7901/15f076ba7e8091103946bd69f9c95aa63726bba9/_/images/icons/emoticons/information.svg" alt="(info)" title="(info)"> More specifically, <a href="http://www.dns-sd.org/">DNS-SD</a> <em>typically</em> runs on top of mDNS, but technically speaking it can query a regular DNS server, too, if the server is configured to hand out these records. But that's unusual.</p></td></tr></table>
<p>First, it's important to understand that these are all (mostly) about UDP multicasts to address 224.0.0.251, port 5353. Aka "multicast DNS", mDNS.</p>
<p>Example mDNS query from a Linux host running "mdns-scan":</p>
<p><img class="confluence-embedded-image" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/example-query.png?version=2&amp;modificationDate=1571668985000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/example-query.png?version=2&amp;modificationDate=1571668985000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004295" data-linked-resource-version="2" data-linked-resource-type="attachment" data-linked-resource-default-alias="example-query.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; example-query.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; example-query.png" data-image-height="182" data-image-width="554"></p>
<p>Example mDNS response from a multifunction printer/scanner:</p>
<p><img class="confluence-embedded-image" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/example-response.png?version=1&amp;modificationDate=1571668985000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/example-response.png?version=1&amp;modificationDate=1571668985000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004297" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="example-response.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; example-response.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; example-response.png" data-image-height="370" data-image-width="746"></p>
<p><br></p>
<h1>Strategy - IGMP or not?</h1>
<table class="wysiwyg-macro" data-macro-name="panel" data-macro-id="a296df52-0004-495e-832b-b01eb2fa27a4" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3BhbmVsfQ&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p><img class="emoticon emoticon-information" data-emoticon-name="information" border="0" src="/s/en_GB/7901/15f076ba7e8091103946bd69f9c95aa63726bba9/_/images/icons/emoticons/information.svg" alt="(info)" title="(info)"> IGMP makes more sense for large data streams, where you want to limit the amount of traffic flowing. Here, you always want to receive the mDNS packets.</p></td></tr></table>
<p>We can opt to work with IGMP Rules (under the Routing subsection), which also works, but <em>assumes</em> that all units speak IGMP correctly.</p>
<p>It would also mean delays in our testing - <em>nothing would work until the firewall receives the IGMP rebroadcasts</em>.</p>
<p>So, we opt to simply go for raw <strong>SAT Multiplex</strong> rules: <strong>Always forward the multicasts,</strong> regardless of hearing IGMP or not.</p>
<p><br></p>
<h1>How to configure</h1>
<h2>Enable transparent mode</h2>
<p>First, <strong>Transparent Mode</strong> most likely needs to be enabled on the involved interfaces.</p>
<p>-- Without it, TTL=1 multicasts will be dropped. (But if all systems use higher TTLs it will likely still work? Untested.)</p>
<p>Note that "Forward Broadcast Traffic" does <em>not</em> need to be enabled on the interfaces for this to work. mDNS uses multicast, not broadcast.</p>
<h2>But I don't want switched routes, L3C, CAM, and all of that?</h2>
<p>That's fine. Simply configure static routes. It's just that Transparent Mode on the sending interface is currently a requirement for leaving the IP TTL untouched in cOS Core.</p>
<p>With static routes + Transparent Mode, the only 2 differences will be:</p>
<ul>
<li>MAC addresses are not hidden</li>
<li>We can leave the IP TTL alone</li>
</ul>
<h2>Add Multiplex SAT rules for mDNS in both directions</h2>
<table class="wysiwyg-macro" data-macro-name="panel" data-macro-id="a21d8a07-3724-44d8-8428-64e22f0506b8" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3BhbmVsfQ&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body">
<p><img class="emoticon emoticon-question" data-emoticon-name="question" border="0" src="/s/en_GB/7901/15f076ba7e8091103946bd69f9c95aa63726bba9/_/images/icons/emoticons/help_16.svg" alt="(question)" title="(question)"> <em>Can you use interface groups to make it a single rule?</em></p>
<p>Yes, it'll work, but unfortunately the firewall <u>will also duplicate the packet back</u> out the interface it came from, which is <u>possibly dangerous</u> if there is another unit doing the same.</p>
</td></tr></table>
<p>As you see in the packet traces, mDNS responses do not arrive to the IP address that sent the query. They are sent out to the multicast address.</p>
<p>Therefore, mDNS multicasts have to be separately <strong>allowed in both directions</strong>.</p>
<p><img class="confluence-embedded-image" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/sat-multiplex-rule.png?version=2&amp;modificationDate=1571753164000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/sat-multiplex-rule.png?version=2&amp;modificationDate=1571753164000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004317" data-linked-resource-version="2" data-linked-resource-type="attachment" data-linked-resource-default-alias="sat-multiplex-rule.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; sat-multiplex-rule.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; sat-multiplex-rule.png" data-image-height="591" data-image-width="541"></p>
<p>... and of course <strong>one more in the opposite direction</strong>.</p>
<ul class="inline-task-list" data-inline-tasks-content-id="310004298"><li data-inline-task-id="1"><span>Make RFE about interface groups in sat multiplex - don't send back out where it came from!</span></li></ul>
<table class="wysiwyg-macro" data-macro-name="panel" data-macro-id="53c86b68-e0d9-417b-930b-af8b1405e93f" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3BhbmVsfQ&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p><span><img class="emoticon emoticon-information" data-emoticon-name="information" border="0" src="/s/en_GB/7901/15f076ba7e8091103946bd69f9c95aa63726bba9/_/images/icons/emoticons/information.svg" alt="(info)" title="(info)"> Technically, the firewall defaults to adding a route for 224.0.0.0/4 to "core" so you <em>could</em> also set the destination interface to "core". </span></p></td></tr></table>
<p><span>Note the "Destination: any" in the filter - it does not make sense to filter according to the routing table here.</span></p>
<p><span><br></span></p>
<h2>Add rule for Internet Printing Protocol</h2>
<p>This is entirely straightforward.</p>
<p>Allow traffic to the printer's IP address, TCP port 631.</p>
<p><br></p>
<h2>Double check TTL setting</h2>
<p>In case a unit sends mDNS packets with IP TTL=1, we may want to make sure we don't decrement it to 0 and drop it.</p>
<p>There may also be mDNS clients that check for TTL still being 255 on receipt, i.e. that the packet didn't traverse a network boundary.</p>
<p>Either way, it's a good idea to make sure that TTL is left untouched:</p>
<p><img class="confluence-embedded-image" height="250" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/decrement-ttl-off.png?version=1&amp;modificationDate=1571752553000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/decrement-ttl-off.png?version=1&amp;modificationDate=1571752553000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004327" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="decrement-ttl-off.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; decrement-ttl-off.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; decrement-ttl-off.png" data-image-height="303" data-image-width="395"></p>
<h3>That's a lot of talk about TTL?</h3>
<p>Well, <a href="https://tools.ietf.org/html/rfc6762">https://tools.ietf.org/html/rfc6762</a> says this:</p>
<pre>11. Source Address Check</pre>
<pre>   All Multicast DNS responses (including responses sent via unicast)
   SHOULD be sent with IP TTL set to 255.  This is recommended to
   provide backwards-compatibility with older Multicast DNS queriers
   (implementing a draft version of this document, posted in February
   2004) that check the IP TTL on reception to determine whether the
   packet originated on the local link.  These older queriers discard
   all packets with TTLs other than 255.
</pre>
<p>And additionally, there are recommendations for dropping mDNS packets if the source IP address does not belong on the local network.</p>
<p><img class="emoticon emoticon-warning" data-emoticon-name="warning" border="0" src="/s/en_GB/7901/15f076ba7e8091103946bd69f9c95aa63726bba9/_/images/icons/emoticons/warning.svg" alt="(warning)" title="(warning)"> If you find an mDNS that implementation refuses to cross the firewall boundary, you may have to renumber your IP ranges to match.</p>
<p>Microsoft's mDNS implementation for instance, <em>may</em> give you problems via Windows Defender Firewall. But here you can simply re-configure the rules.</p>
<p><img class="confluence-embedded-image" width="800" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/image2019-10-23_12-9-27.png?version=1&amp;modificationDate=1571825366000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/image2019-10-23_12-9-27.png?version=1&amp;modificationDate=1571825366000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004892" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="image2019-10-23_12-9-27.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; image2019-10-23_12-9-27.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; image2019-10-23_12-9-27.png" data-image-height="199" data-image-width="1093"></p>
<h2>Test it!</h2>
<p><img class="confluence-embedded-image" confluence-query-params="effects=border-simple,blur-border" src="/download/attachments/310004298/mdns-scan-console-screenshot.png?version=1&amp;modificationDate=1571752569000&amp;api=v2&amp;effects=border-simple,blur-border" data-image-src="/download/attachments/310004298/mdns-scan-console-screenshot.png?version=1&amp;modificationDate=1571752569000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="310004320" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="mdns-scan-console-screenshot.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="310004298" data-linked-resource-container-version="32" title="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; mdns-scan-console-screenshot.png" data-location="Knowledge Base &gt; How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf discovery over multicast in transparent mode &gt; mdns-scan-console-screenshot.png" data-image-height="328" data-image-width="427"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtibXVsdGljYXN0Iiwia2JhaXJwcmludCIsImtibWRucyIsImtidHJhbnNwYXJlbnRtb2RlIiwia2JpZ21wIiwia2JwcmludCIpIGFuZCB0eXBlID0gInBhZ2UifQ&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="4b7092f5-2a8e-4add-a850-4932891af740" data-macro-parameters='cql=label in ("kbmulticast","kbairprint","kbmdns","kbtransparentmode","kbigmp","kbprint") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>