---
confluence-id: '314126141'
orig-title: Behavior of multiple traffic selectors in IKE negotiations - differences
  in Fortigate vs Clavister,Juniper,Cisco
slug: '314126141'
tags: kb kbcore kbipsec kbikev2 kbike kbfortigate
title: Behavior of multiple traffic selectors in IKE negotiations - differences in
  Fortigate vs Clavister,Juniper,Cisco
version: 4
---

<ac:layout><ac:layout-section ac:type="two_equal"><ac:layout-cell><ac:structured-macro ac:name="excerpt" ac:schema-version="1" ac:macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8"><ac:parameter ac:name="atlassian-macro-output-type">INLINE</ac:parameter><ac:rich-text-body><p>IKE specifications are fuzzy in places. Some vendors sometimes choose to do things a little differently, and frankly we can't blame them - there's no way to say for sure who's right and wrong. All we can do is document the differences.<br /><br />Fortigate, when an IKE SA is configured with multiple networks, seems to treat them like &quot;this SA negotiation should cover all networks in a single negotiation&quot;. Most others treat it like everything else in a proposal - pick the option that we prefer.</p></ac:rich-text-body></ac:structured-macro><p><br /></p><p><br /></p><p><ac:structured-macro ac:name="toc" ac:schema-version="1" ac:macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" /></p></ac:layout-cell><ac:layout-cell><ac:structured-macro ac:name="details" ac:schema-version="1" ac:macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22"><ac:rich-text-body><table class="wrapped"><colgroup> <col /> <col /> </colgroup><tbody><tr><td><p>Up to date for</p></td><td><p>Core 13.00.00</p><p>Fortigate N.NN</p><p><ac:placeholder>OtherProduct 2000 </ac:placeholder></p></td></tr><tr><td colspan="1">Supported since</td><td colspan="1"><ac:placeholder>Core 12.00.01, Remove line if unnecessary </ac:placeholder></td></tr><tr><td colspan="1">Not valid for</td><td colspan="1"><ac:placeholder>Remove line if unnecessary </ac:placeholder></td></tr><tr><td colspan="1">Status</td><td colspan="1"><div class="content-wrapper"><p><ac:structured-macro ac:name="status" ac:schema-version="1" ac:macro-id="c93968a5-93d1-4dbf-a493-c70a1f8a284a"><ac:parameter ac:name="colour">Green</ac:parameter><ac:parameter ac:name="title">OK</ac:parameter></ac:structured-macro><br />&nbsp;</p><p><ac:placeholder>DRAFT: still working on this </ac:placeholder></p><p><ac:placeholder>OK: usable (doesn't have to mean final!) </ac:placeholder></p><p><ac:placeholder>OLD: information is out of date </ac:placeholder></p><p><ac:placeholder>NEVERPUBLIC: never consider it for publication.</ac:placeholder></p></div></td></tr></tbody></table></ac:rich-text-body></ac:structured-macro></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><h1>Example negotiation from a Fortigate</h1><p><ac:structured-macro ac:name="jira" ac:schema-version="1" ac:macro-id="d8717671-3aa6-4368-8806-8556b282b593"><ac:parameter ac:name="server">Clavister JIRA</ac:parameter><ac:parameter ac:name="columns">key,summary,type,created,updated,due,assignee,reporter,priority,status,resolution</ac:parameter><ac:parameter ac:name="serverId">3aa38841-2d2f-3a6e-862d-31e643fb0cf1</ac:parameter><ac:parameter ac:name="key">TIC-29771</ac:parameter></ac:structured-macro></p><p>Example: Fortigate is configured with 6 networks as its local traffic selector.</p><p>User (perhaps reasonably) expects this to result in a VPN tunnel allowing 6 networks.</p><p>The Clavister IPsec implementation, as initiator, would handle this by negotiating 6 SAs.</p><p>Fortigate however attempts to negotiate all 6 selectors in one SA.</p><table class="wrapped"><colgroup> <col /> <col /> </colgroup><tbody><tr><th>Fortigate (initiator)</th><th>Clavister (responder)</th></tr><tr><td><pre>    TSi (Traffic Selector - Initiator)
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
              </pre></td><td><pre>    TSi (Traffic Selector - Initiator)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.84.0-192.168.84.255
    TSr (Traffic Selector - Responder)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.2.0-10.0.2.255
            </pre></td></tr></tbody></table><h1>Problem: the behavior is undefined according to RFC</h1><p><a href="https://tools.ietf.org/html/rfc5996">https://tools.ietf.org/html/rfc5996</a> talks about multiple traffic selectors using 2 examples:</p><p>As a way of handling units being reconfigured / moved:</p><blockquote><p>&quot;This could happen when the configurations of the two endpoints are being updated but only one end has received the new information.&quot;</p></blockquote><p>When the initiator does not know the granularity of the responder, i.e. per port/proto or net:</p><blockquote><p>&quot;In the example, the initiator would include in TSi two Traffic Selectors: the first containing the address range (198.51.100.43 - 198.51.100.43) and the source port and IP protocol from the packet and the second containing (198.51.100.0 - 198.51.100.255) with all ports and IP protocols.</p></blockquote><p>So, the Clavister IPsec implementation picks the selector that it &quot;prefers&quot; from the provided list. In the example above, all networks are equally wide = there is no real preference.</p><p><br /></p></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><h1>Related articles</h1><p><ac:structured-macro ac:name="contentbylabel" ac:schema-version="3" ac:macro-id="f9c1fe75-79b4-4099-bb85-e7e166e0b7bd"><ac:parameter ac:name="sort">modified</ac:parameter><ac:parameter ac:name="excerptType">rich content</ac:parameter><ac:parameter ac:name="cql">label in (&quot;kbipsec&quot;,&quot;kbike&quot;,&quot;kbikev2&quot;) and type = &quot;page&quot;</ac:parameter></ac:structured-macro></p><p><ac:placeholder> Change the labels in the macro to match suitably narrow labels, e.g. &quot;kbdhcp, kbrouting&quot; but not &quot;kbcore&quot;/&quot;kbhowto&quot;/&quot;kb&quot;/&quot;kbdictionary&quot;. Pages with ANY of the labels will be shown - it's _not_ a &quot;must match all&quot; filter. (You can of course use as much advanced filtering as you like!) </ac:placeholder></p><p><br /></p><p><br /></p></ac:layout-cell></ac:layout-section></ac:layout>