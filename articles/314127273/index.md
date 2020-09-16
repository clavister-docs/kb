---
confluence-id: '314127273'
date: '2020-09-08T01:21:44.000+02:00'
last_modified_at: '2020-09-08T01:21:44.000+02:00'
layout: article
orig-title: Can blacklist timeouts (TTL,lifetime) for "Scanner Protection" or "Botnet
  Blocking" be changed or increased?
orig-title-slugified: can-blacklist-timeouts-ttl-lifetime-for-scanner-protection-or-botnet-blocking-be-changed-or-increased-
permalink: /314127273/
published: 'true'
slug: '314127273'
tags: kb kbcore kbipreputation kbblacklist kbthreatprevention
title: Can blacklist timeouts (TTL,lifetime) for "Scanner Protection" or "Botnet Blocking"
  be changed or increased?
version: 5
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>The lifetime for IP-reputation-based blacklistings is hard-coded to 300 seconds. However, when the blacklisting is lifted, the next packet from/to such a host will trigger a new IP reputation lookup and re-block it. <br /><br />The blacklist merely acts as a cache here - having longer blacklist lifetimes affords you no greater security.</p></td></tr></table><p><br /></p><p><br /></p></div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable"><colgroup> <col /> <col /> </colgroup><tbody><tr><td class="confluenceTd"><p>Up to date for</p></td><td class="confluenceTd"><p>Core 12.00.22, 13.00.01</p></td></tr><tr><td colspan="1" class="confluenceTd">Supported since</td><td colspan="1" class="confluenceTd">Core 12.00.00</td></tr><tr><td colspan="1" class="confluenceTd">Status</td><td colspan="1" class="confluenceTd"><div class="content-wrapper"><p><img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"></p><p><span class="text-placeholder">DRAFT: still working on this </span></p><p><span class="text-placeholder">OK: usable (doesn't have to mean final!) </span></p><p><span class="text-placeholder">OLD: information is out of date </span></p></div></td></tr></tbody></table></td></tr></table></div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>See also: Threshold Rules</h1><p>If you want to perform your own rate logic on hosts scanning your networks, please see &quot;Threshold Rules&quot;.</p><p>Threshold Rules are the only way to deal with rogue internal hosts attempting to scan your own networks - global IP reputation databases obviously know nothing about your private IP addresses.</p><p>And, yes, the blacklisting lifetimes <em>can</em> be configured for these.</p><p><br /></p></div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1><p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtidGhyZWF0cHJldmVudGlvbiIsImtiaXByZXB1dGF0aW9uIiwia2JibGFja2xpc3QiKSBhbmQgdHlwZSA9ICJwYWdlIn0&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="ab7b70a2-8e4b-4887-9015-8541a3e49f3c" data-macro-parameters="cql=label in (&quot;kbthreatprevention&quot;,&quot;kbipreputation&quot;,&quot;kbblacklist&quot;) and type \= &quot;page&quot;|excerptType=rich content|sort=modified" data-macro-schema-version="3"></p><p><span class="text-placeholder"> Change the labels in the macro to match suitably narrow labels, e.g. "kbdhcp, kbrouting" but not "kbcore"/"kbhowto"/"kb"/"kbdictionary". Pages with ANY of the labels will be shown - it's _not_ a "must match all" filter. (You can of course use as much advanced filtering as you like!) </span></p><p><br /></p><p><br /></p></div>
</div>
</div>
</div>