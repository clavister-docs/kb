---
confluence-id: '309997970'
date: '2020-09-08T01:19:19.000+02:00'
last_modified_at: '2020-09-08T01:19:19.000+02:00'
layout: article
orig-title: What packets are counted in "Forwarded bps" and "Forwarded pps" statistics
  (and SNMP) counters?
orig-title-slugified: what-packets-are-counted-in-forwarded-bps-and-forwarded-pps-statistics-and-snmp-counters-
permalink: /309997970/
published: 'true'
slug: '309997970'
tags: kb kbcore kbstatistics kbsnmp
title: What packets are counted in "Forwarded bps" and "Forwarded pps" statistics
  (and SNMP) counters?
version: 5
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>In short: forwarded, layer 3+ bytes that are SENT are counted.</p></td></tr></table>
<p><br></p>
<p><br></p>
<p><br></p>
</div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable">
<colgroup> <col> <col> </colgroup>
<tbody>
<tr>
<td class="confluenceTd"><p>Up to date for</p></td>
<td class="confluenceTd"><p>Core 12.00.20</p></td>
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
<h1>The base principle</h1>
<ul>
<li>
<strong>We count bytes SENT at IP level</strong> = bytes given to the layer 2 drivers. <br><ul><li>Note that past this point, ARP resolution, tunnel negotiation, interface drivers can still fail to deliver the packet. This does not affect the "Forwarded" statistic.</li></ul>
</li>
<li>Only bytes Layer 3 and up are counted = IP headers and the data beneath them. Not Ethernet headers, outer ESP where the firewall is a VPN endpoint, etc.</li>
<li>Packets originated by the firewall itself (log data, management traffic, etc) are (mostly) not counted.</li>
</ul>
<h2>But VPN tunnels?</h2>
<p>We measure <strong>data forwarded into / out of a tunnel</strong>, not the outer encapsulation, as that part of the packet is considered "originated by the firewall itself".</p>
<h2>But some legacy exceptions</h2>
<p>ICMP Echo responses are counted for legacy reasons.</p>
<p>ICMP errors and TCP RSTs are similarly counted for legacy reasons.</p>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtic3RhdGlzdGljcyIsImtic25tcCIpIGFuZCB0eXBlID0gInBhZ2UifQ&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="09f84fb0-0e4a-4e28-bf7e-73c9368f4574" data-macro-parameters='cql=label in ("kbstatistics","kbsnmp") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>