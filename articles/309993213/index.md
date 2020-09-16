---
confluence-id: '309993213'
date: '2020-09-08T01:20:03.000+02:00'
last_modified_at: '2020-09-08T01:20:03.000+02:00'
layout: article
orig-title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
orig-title-slugified: tcp-mss-above-log-level-log-events-for-mss-8960-being-higher-than-tcpmssloglevel-7000
permalink: /309993213/
published: 'true'
slug: '309993213'
tags: kb kblog kbtcp kbmtu kbcore kbmss
title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
version: 6
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>For a long time, TCP MSS (Maximum Segment Size) above 1460 was abnormal. However, with the advent of jumboframe-capable hosts, we now see TCP MSS announcements of 8960. The setting can safely be raised to 9000.</p></td></tr></table>
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
<p>Core 12.00.20</p>
<p><br></p>
</td>
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
<p><img src="image2019-9-6_23-26-26.png"></p>
<p>Log events like the above are becoming a common occurence as more and more servers become connected to jumbogram networks - even though the Internet at large does not support larger frames than standard Ethernet.</p>
<h1>Changing the TCPMSSLogLevel</h1>
<p>To suppress the log events, simply set the "TCPMSSLogLevel" setting to e.g. 9000. Or 8960 if you like.</p>
<p>The default value for this setting will be changed in a future release of cOS Core.</p>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtidGNwIiwia2Jtc3MiLCJrYm10dSIpIGFuZCB0eXBlID0gInBhZ2UifQ&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="6b395cb9-1817-4d91-b7c7-34c56a3550f7" data-macro-parameters='cql=label in ("kbtcp","kbmss","kbmtu") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>