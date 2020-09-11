---
confluence-id: '309993213'
orig-title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
slug: '309993213'
tags: kb kblog kbtcp kbmtu kbcore kbmss
title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
version: 6
---

<ac:layout><ac:layout-section ac:type="two_equal"><ac:layout-cell><ac:structured-macro ac:name="excerpt" ac:schema-version="1" ac:macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8"><ac:parameter ac:name="atlassian-macro-output-type">INLINE</ac:parameter><ac:rich-text-body><p>For a long time, TCP MSS (Maximum Segment Size) above 1460 was abnormal. However, with the advent of jumboframe-capable hosts, we now see TCP MSS announcements of 8960. The setting can safely be raised to 9000.</p></ac:rich-text-body></ac:structured-macro><p><br /></p><p><ac:placeholder>Labels to use: </ac:placeholder></p><p><ac:placeholder>kb - use on all </ac:placeholder></p><p><ac:placeholder>kbhowto - How-To:s</ac:placeholder></p><p><ac:placeholder>kbtroubleshoot - Finding and diagnosing problems </ac:placeholder></p><p><ac:placeholder>kbknownproblem - Describe a known problem, possibly with fixes/workarounds </ac:placeholder></p><p><br /></p><p><ac:placeholder>kbcore / kbstream / kbincontrol / kbincenter / kboneconnect / ... - our products </ac:placeholder></p><p><ac:placeholder>kbdhcp / kbipsec / kbospf / kbl2tp - protocol names </ac:placeholder></p><p><ac:placeholder>kbcrypto / ... - broad topics, mentions of other products, etcetc, you get the idea! </ac:placeholder></p><p><ac:structured-macro ac:name="toc" ac:schema-version="1" ac:macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" /></p></ac:layout-cell><ac:layout-cell><ac:structured-macro ac:name="details" ac:schema-version="1" ac:macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22"><ac:rich-text-body><table class="wrapped"><colgroup> <col /> <col /> </colgroup><tbody><tr><td><p>Up to date for</p></td><td><p>Core 12.00.20</p><p><br /></p></td></tr><tr><td colspan="1">Status</td><td colspan="1"><div class="content-wrapper"><p>&nbsp;<ac:structured-macro ac:name="status" ac:schema-version="1" ac:macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27"><ac:parameter ac:name="colour">Green</ac:parameter><ac:parameter ac:name="title">OK</ac:parameter></ac:structured-macro>&nbsp;</p><p><ac:placeholder>DRAFT: still working on this </ac:placeholder></p><p><ac:placeholder>OK: usable (doesn't have to mean final!) </ac:placeholder></p><p><ac:placeholder>OLD: information is out of date </ac:placeholder></p><p><ac:placeholder>NEVERPUBLIC: never consider it for publication.</ac:placeholder></p></div></td></tr></tbody></table></ac:rich-text-body></ac:structured-macro></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><p><ac:image ac:height="170"><ri:attachment ri:filename="image2019-9-6_23-26-26.png" /></ac:image></p><p>Log events like the above are becoming a common occurence as more and more servers become connected to jumbogram networks - even though the Internet at large does not support larger frames than standard Ethernet.</p><h1>Changing the TCPMSSLogLevel</h1><p>To suppress the log events, simply set the &quot;TCPMSSLogLevel&quot; setting to e.g. 9000. Or 8960 if you like.</p><p>The default value for this setting will be changed in a future release of cOS Core.</p><p><br /></p></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><h1>Related articles</h1><p><ac:structured-macro ac:name="contentbylabel" ac:schema-version="3" ac:macro-id="6b395cb9-1817-4d91-b7c7-34c56a3550f7"><ac:parameter ac:name="sort">modified</ac:parameter><ac:parameter ac:name="excerptType">rich content</ac:parameter><ac:parameter ac:name="cql">label in (&quot;kbtcp&quot;,&quot;kbmss&quot;,&quot;kbmtu&quot;) and type = &quot;page&quot;</ac:parameter></ac:structured-macro></p><p><ac:placeholder> Change labels here to match suitably narrow labels, e.g. &quot;kbdhcp, kbrouting&quot; but not &quot;kbcore&quot;/&quot;kbhowto&quot;/&quot;kb&quot;. The listing will show pages with ANY of the labels listed - it's _not_ a &quot;must match all&quot; filter. </ac:placeholder></p><p><br /></p><p><br /></p></ac:layout-cell></ac:layout-section></ac:layout>