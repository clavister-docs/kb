---
confluence-id: '314126141'
date: '2020-09-08T00:29:17.000+02:00'
last_modified_at: '2020-09-08T00:29:17.000+02:00'
layout: article
orig-title: Behavior of multiple traffic selectors in IKE negotiations - differences
  in Fortigate vs Clavister,Juniper,Cisco
orig-title-slugified: behavior-of-multiple-traffic-selectors-in-ike-negotiations---differences-in-fortigate-vs-clavister-juniper-cisco
permalink: /314126141/
published: 'true'
slug: '314126141'
tags: kb kbcore kbipsec kbikev2 kbike kbfortigate
title: Behavior of multiple traffic selectors in IKE negotiations - differences in
  Fortigate vs Clavister,Juniper,Cisco
version: 4
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>IKE specifications are fuzzy in places. Some vendors sometimes choose to do things a little differently, and frankly we can't blame them - there's no way to say for sure who's right and wrong. All we can do is document the differences.<br><br>Fortigate, when an IKE SA is configured with multiple networks, seems to treat them like "this SA negotiation should cover all networks in a single negotiation". Most others treat it like everything else in a proposal - pick the option that we prefer.</p></td></tr></table>
<p><br></p>
<p><br></p>
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
<td class="confluenceTd">
<p>Core 13.00.00</p>
<p>Fortigate N.NN</p>
</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Supported since</td>
<td colspan="1" class="confluenceTd"></td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Not valid for</td>
<td colspan="1" class="confluenceTd"></td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Status</td>
<td colspan="1" class="confluenceTd"><div class="content-wrapper"><p><img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="c93968a5-93d1-4dbf-a493-c70a1f8a284a" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"><br> </p></div></td>
</tr>
</tbody>
</table></td></tr></table>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Example negotiation from a Fortigate</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2ppcmE6a2V5PVRJQy0yOTc3MX0=&amp;locale=en_GB" data-macro-name="jira" data-macro-id="d8717671-3aa6-4368-8806-8556b282b593" data-macro-parameters="columns=key,summary,type,created,updated,due,assignee,reporter,priority,status,resolution|key=TIC-29771|server=Clavister JIRA|serverId=3aa38841-2d2f-3a6e-862d-31e643fb0cf1" data-macro-schema-version="1"></p>
<p>Example: Fortigate is configured with 6 networks as its local traffic selector.</p>
<p>User (perhaps reasonably) expects this to result in a VPN tunnel allowing 6 networks.</p>
<p>The Clavister IPsec implementation, as initiator, would handle this by negotiating 6 SAs.</p>
<p>Fortigate however attempts to negotiate all 6 selectors in one SA.</p>
<table class="wrapped confluenceTable">
<colgroup> <col> <col> </colgroup>
<tbody>
<tr>
<th class="confluenceTh">Fortigate (initiator)</th>
<th class="confluenceTh">Clavister (responder)</th>
</tr>
<tr>
<td class="confluenceTd"><pre>    TSi (Traffic Selector - Initiator)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.84.0-192.168.84.255
    TSr (Traffic Selector - Responder)
      Traffic selector 1/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.0.0-10.0.0.255
      Traffic selector 2/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.150.0-192.168.150.255
      Traffic selector 3/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.1.0.0-10.1.1.255
      Traffic selector 4/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.73.0-10.0.73.255
      Traffic selector 5/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.2.0-10.0.2.255
      Traffic selector 6/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.22.2.0-10.22.2.255
              </pre></td>
<td class="confluenceTd"><pre>    TSi (Traffic Selector - Initiator)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.84.0-192.168.84.255
    TSr (Traffic Selector - Responder)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.2.0-10.0.2.255
            </pre></td>
</tr>
</tbody>
</table>
<h1>Problem: the behavior is undefined according to RFC</h1>
<p><a href="https://tools.ietf.org/html/rfc5996">https://tools.ietf.org/html/rfc5996</a> talks about multiple traffic selectors using 2 examples:</p>
<p>As a way of handling units being reconfigured / moved:</p>
<blockquote><p>"This could happen when the configurations of the two endpoints are being updated but only one end has received the new information."</p></blockquote>
<p>When the initiator does not know the granularity of the responder, i.e. per port/proto or net:</p>
<blockquote><p>"In the example, the initiator would include in TSi two Traffic Selectors: the first containing the address range (198.51.100.43 - 198.51.100.43) and the source port and IP protocol from the packet and the second containing (198.51.100.0 - 198.51.100.255) with all ports and IP protocols.</p></blockquote>
<p>So, the Clavister IPsec implementation picks the selector that it "prefers" from the provided list. In the example above, all networks are equally wide = there is no real preference.</p>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtiaXBzZWMiLCJrYmlrZSIsImtiaWtldjIiKSBhbmQgdHlwZSA9ICJwYWdlIn0&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="f9c1fe75-79b4-4099-bb85-e7e166e0b7bd" data-macro-parameters='cql=label in ("kbipsec","kbike","kbikev2") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>