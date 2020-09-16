---
confluence-id: '309993643'
date: '2020-09-08T01:20:16.000+02:00'
last_modified_at: '2020-09-08T01:20:16.000+02:00'
layout: article
orig-title: 'HA: disallowed_on_sync_iface log events with rule=HA_RestrictSyncIf for
  Reverse ARP, RARP, and IGMP'
orig-title-slugified: ha-disallowed-on-sync-iface-log-events-with-rule-ha-restrictsyncif-for-reverse-arp-rarp-and-igmp
permalink: /309993643/
published: 'true'
slug: '309993643'
tags: kb kbvmware kblog kbha kbrarp kbarp kbcore
title: 'HA: disallowed_on_sync_iface log events with rule=HA_RestrictSyncIf for Reverse
  ARP, RARP, and IGMP'
version: 3
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body">
<p>cOS Core will log about unexpected packets on its sync interface in order to alert you about the sync interface possibly becoming connected to a general LAN - something which likely would be harmful to your security level.</p>
<p>However, if all you see if Reverse ARP (RARP) and IGMP broadcasts, chances are that you are seeing a <strong>VMWare ESX</strong> host with the vswitch "Notify Switches" setting enabled.</p>
</td></tr></table>
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
<p>If it is established that the source of the packets is ESXi and there are no other packet types, there is no need for further action.</p>
<p>It is however completely safe to disable "Notify Switches" on vhost interfaces used for HA sync - they will do broadcasts of their own very often and do not need help with notifying switches.</p>
<h1>Further reading</h1>
<p><a href="https://www.google.com/search?q=esxi+%22notify+switches%22+setting+%22nic+teaming%22+rarp">Google: esxi "notify switches" setting "nic teaming" rarp</a></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtidm13YXJlIiwia2JoYSIpIGFuZCB0eXBlID0gInBhZ2UifQ&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="c400d98a-8eed-4358-b9a6-c099f65bc7f7" data-macro-parameters='cql=label in ("kbvmware","kbha") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>