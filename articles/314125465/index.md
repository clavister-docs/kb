---
confluence-id: '314125465'
date: '2020-09-08T01:19:35.000+02:00'
last_modified_at: '2020-09-08T01:19:35.000+02:00'
layout: article
orig-title: Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"?
orig-title-slugified: why-does-wireshark-say-that-snmpv3-traps-sent-from-cos-core-are-snmpv2-trap-
permalink: /314125465/
published: 'true'
slug: '314125465'
tags: kb kbsnmp kbcore kbwireshark
title: Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"?
version: 3
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>The data portion of SNMPv3 and SNMPv2 traps are identical. Only the wrapping headers differ. Wireshark shows the data portion in the summary line.</p></td></tr></table>
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
<p>Core 12.00.22</p>
<p>Core 13.00.01</p>
<p>WireShark 2.6.10</p>
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
<h1>Manually testing SNMP trap behavior using ucs-snmp</h1>
<p>This can be tested on e.g. a Linux host:</p>
<table class="wysiwyg-macro" data-macro-name="code" data-macro-id="011b77c8-f65c-43fb-b986-620cc4483b60" data-macro-parameters="language=bash" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGU6bGFuZ3VhZ2U9YmFzaH0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="PLAIN_TEXT"><tr><td class="wysiwyg-macro-body"><pre>$ snmptrap -v 2c -c public 192.168.0.101 '' 1.3.6.1.4.1.8072.2.3.0.1 1.3.6.1.4.1.8072.2.3.2.1 i 123456

$ snmptrap -v 3 -u ExampleSecurityName -l noAuthNoPriv 192.168.0.101 '' 1.3.6.1.4.1.8072.2.3.0.1 1.3.6.1.4.1.8072.2.3.2.1 i 123456</pre></td></tr></table>
<p>If you walk inside the packet data, you'll see that the trap data itself is identical in both v2 and v3, but they're wrapped in different headers (v2 vs v3).</p>
<h2>SNMPv2 trap:</h2>
<p><img class="confluence-embedded-image" width="600" confluence-query-params="effects=border-simple,shadow-kn" src="/download/attachments/314125465/image2020-1-3_16-32-38.png?version=1&amp;modificationDate=1578067836000&amp;api=v2&amp;effects=border-simple,shadow-kn" data-image-src="/download/attachments/314125465/image2020-1-3_16-32-38.png?version=1&amp;modificationDate=1578067836000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="314125463" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="image2020-1-3_16-32-38.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="314125465" data-linked-resource-container-version="3" title='Knowledge Base &gt; Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"? &gt; image2020-1-3_16-32-38.png' data-location='Knowledge Base &gt; Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"? &gt; image2020-1-3_16-32-38.png' data-image-height="417" data-image-width="964"></p>
<h2>SNMPv3 trap</h2>
<p><img class="confluence-embedded-image" width="600" confluence-query-params="effects=border-simple,shadow-kn" src="/download/attachments/314125465/image2020-1-3_17-7-27.png?version=1&amp;modificationDate=1578067836000&amp;api=v2&amp;effects=border-simple,shadow-kn" data-image-src="/download/attachments/314125465/image2020-1-3_17-7-27.png?version=1&amp;modificationDate=1578067836000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="314125464" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="image2020-1-3_17-7-27.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="314125465" data-linked-resource-container-version="3" title='Knowledge Base &gt; Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"? &gt; image2020-1-3_17-7-27.png' data-location='Knowledge Base &gt; Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"? &gt; image2020-1-3_17-7-27.png' data-image-height="606" data-image-width="966"></p>
<p>Note that the contained data is still identified as a "v2 trap", it is unchanged.</p>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCA9ICJrYnNubXAiIGFuZCB0eXBlID0gInBhZ2UifQ&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="df3e5f18-917e-45cf-9e24-7d6c2722839c" data-macro-parameters='cql=label \= "kbsnmp" and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>