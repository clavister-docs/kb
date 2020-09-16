---
confluence-id: '317180249'
date: '2020-09-08T01:22:26.000+02:00'
last_modified_at: '2020-09-08T01:22:26.000+02:00'
layout: article
orig-title: Explicit Congestion Notification - ECN, ECE, CWE, NS, ECT, CE
orig-title-slugified: explicit-congestion-notification---ecn-ece-cwe-ns-ect-ce
permalink: /317180249/
published: 'true'
slug: '317180249'
tags: kb kbtcp kbecn
title: Explicit Congestion Notification - ECN, ECE, CWE, NS, ECT, CE
version: 8
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>ECN is a mechanism in TCP/IP where routers can signal that they are <em>almost</em> overloaded. This lets endpoints slow down before packet-loss actually occurs.<br><br>As of v12.00.24 and v13.00.06, the TCPECN setting in Clavister cOS Core defaults to "Ignore", meaning that it passes the ECN-related bits through, unmodified.</p></td></tr></table>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e3RvY30&amp;locale=en_GB&amp;version=2" data-macro-name="toc" data-macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" data-macro-schema-version="1"></p>
</div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable">
<colgroup> <col> <col> </colgroup>
<tbody>
<tr>
<td class="confluenceTd"><p>Up to date for</p></td>
<td class="confluenceTd"><p>Core 12.00.24, 13.00.06</p></td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Status</td>
<td colspan="1" class="confluenceTd"><div class="content-wrapper"><p><img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"> </p></div></td>
</tr>
</tbody>
</table></td></tr></table>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Signalling Congestion - forward direction - IP header</h1>
<p><img src="ip-header-ecn-bits-history.svg"></p>
<p><img src="image2020-5-23_17-34-34.png"></p>
<ul>
<li>
<code>00</code> – Non ECN-Capable Transport, Non-ECT</li>
<li>
<code>10</code> – ECN Capable Transport, ECT(0)</li>
<li>
<code>01</code> – ECN Capable Transport, ECT(1)</li>
<li>
<code>11</code> – Congestion Encountered, CE.</li>
</ul>
<p>So, if the sender sets the bits to "00", no router will mark the packet as congested, as they then assume ECN is not supported.</p>
<p><br></p>
<h1>Notifying the sender - return direction - TCP header</h1>
<p>When a host receives "Congestion Encountered, CE" in the IP header of a packet, it has to somehow notify the sender of this for it to be useful.</p>
<p>For a TCP connection, this happens in the TCP ACK packet returned.</p>
<p><img src="image2020-5-23_17-48-51.png"></p>
<ul>
<li><p>ECE - Echo of Congestion Encountered - starts being set in TCP packets when "CE" is seen</p></li>
<li>CWR - Congestion Window Reduced = "OK, I saw your ECE, you can turn it off now"</li>
<li>NS = Nonce Sum <a href="https://tools.ietf.org/html/rfc3540">RFC3540</a> was meant to improve robustness of the protocol but was never standardized. The bit assignment still remains in the specification, however, and should be treated the same way as ECE and CWD - either passed-on, or stripped.</li>
</ul>
<h1>Problems with firewalls</h1>
<p>ECE and CWR were not defined in the original TCP specification, and were often referred to as "christmas-tree lamp test" bits- XMAS and, naturally, YMAS.</p>
<p>Firewalls long took them as an indication of "something fishy" going on and defaulted to blocking packets that had them set, leading to ECN-enabled TCP connections breaking.</p>
<p>See <a href="https://tools.ietf.org/html/bcp60">BCP60 - Inappropriate TCP Resets Considered Harmful</a> by ECN wizard Sally Floyd for a write-up on this subject. (And yes the Mikael Olsson in the Acknowledgements sections is ours)</p>
<h2>ECN in cOS Core</h2>
<p>Clavister cOS Core has long defaulted to <em>stripping</em> the ECN bits which does not break TCP, but does disable ECN. This due to the fact that there have been bugs in endpoints (and, notably, other firewalls, e.g. <a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0183">CVE-2001-0183 - FreeBSD ipfw allowing ruleset bypass with ECE bit set</a>) related to this bit, and the simple fact that ECN functionality was only recently widely-enabled by default.</p>
<p>cOS Core's behavior is controlled by the "TCPECN" setting.</p>
<p>As of mid 2020, v12.00.24 and v13.00.06, the TCPECN setting defaults to <strong>"Ignore</strong>", meaning that it passes the ECN-related bits through, <strong>unmodified</strong>.</p>
<p><br></p>
<h1>Further reading</h1>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Explicit_Congestion_Notification">https://en.wikipedia.org/wiki/Explicit_Congestion_Notification</a></li>
<li><a href="https://tools.ietf.org/html/rfc8087">RFC8087 - The Benefits of Using Explicit Congestion Notification (ECN)</a></li>
</ul>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtidGNwIiwia2JlY24iKSBhbmQgdHlwZSA9ICJwYWdlIn0&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="cc15d669-a127-47d6-b309-0399a017f1db" data-macro-parameters='cql=label in ("kbtcp","kbecn") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>