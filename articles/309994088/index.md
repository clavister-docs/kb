---
confluence-id: '309994088'
date: '2020-09-08T01:21:01.000+02:00'
last_modified_at: '2020-09-08T01:21:01.000+02:00'
layout: article
orig-title: Does IPsecBeforeRules trigger before Access rules?
orig-title-slugified: does-ipsecbeforerules-trigger-before-access-rules-
permalink: /309994088/
published: 'true'
slug: '309994088'
tags: kb kbcore kbipsec kbrules kbaccess
title: Does IPsecBeforeRules trigger before Access rules?
version: 3
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>An Access rule - including the default reverse route lookup if reached - will drop the packet before it reaches the IPsec engine and/or is picked up by the IPsecBeforeRule.</p></td></tr></table><p><br /></p><p><span class="text-placeholder">Labels to use: </span></p><p><span class="text-placeholder">kb - use on all </span></p><p><span class="text-placeholder">kbhowto - How-To:s</span></p><p><span class="text-placeholder">kbtroubleshoot - Finding and diagnosing problems </span></p><p><span class="text-placeholder">kbknownproblem - Describe a known problem, possibly with fixes/workarounds </span></p><p><br /></p><p><span class="text-placeholder">kbcore / kbstream / kbincontrol / kbincenter / kboneconnect / ... - our products </span></p><p><span class="text-placeholder">kbdhcp / kbipsec / kbospf / kbl2tp - protocol names </span></p><p><span class="text-placeholder">kbcrypto / kbmtu / ... - broad topics, mentions of other products, etcetc, you get the idea! </span></p><p><br /></p></div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable"><colgroup> <col /> <col /> </colgroup><tbody><tr><td class="confluenceTd"><p>Up to date for</p></td><td class="confluenceTd"><p>Core 12.00.20</p><p><span class="text-placeholder">InControl 2.0.0 </span></p><p><span class="text-placeholder">OtherProduct 2000 </span></p></td></tr><tr><td colspan="1" class="confluenceTd">Status</td><td colspan="1" class="confluenceTd"><div class="content-wrapper"><p> <img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"></p><p><span class="text-placeholder">DRAFT: still working on this </span></p><p><span class="text-placeholder">OK: usable (doesn't have to mean final!) </span></p><p><span class="text-placeholder">OLD: information is out of date </span></p><p><span class="text-placeholder">NEVERPUBLIC: never consider it for publication.</span></p></div></td></tr></tbody></table></td></tr></table></div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<p><br /></p></div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1><p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImticnVsZXMiLCJrYmlwc2VjIiwia2JhY2Nlc3MiKSBhbmQgdHlwZSA9ICJwYWdlIn0&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="70126db8-cab4-4e66-8e8d-316ee9262f9f" data-macro-parameters="cql=label in (&quot;kbrules&quot;,&quot;kbipsec&quot;,&quot;kbaccess&quot;) and type \= &quot;page&quot;|excerptType=rich content|sort=modified" data-macro-schema-version="3"></p><p><span class="text-placeholder"> Change labels here to match suitably narrow labels, e.g. "kbdhcp, kbrouting" but not "kbcore"/"kbhowto"/"kb". The listing will show pages with ANY of the labels listed - it's _not_ a "must match all" filter. </span></p><p><br /></p><p><br /></p></div>
</div>
</div>
</div>