---
confluence-id: '309987444'
date: '2020-09-07T00:29:20.000+02:00'
last_modified_at: '2020-09-07T00:29:20.000+02:00'
layout: article
orig-title: How to adjust RX and TX ring sizes (queue lengths) of Ethernet interfaces
orig-title-slugified: how-to-adjust-rx-and-tx-ring-sizes-queue-lengths-of-ethernet-interfaces
permalink: /309987444/
published: 'true'
slug: '309987444'
tags: kb kbcore kbhowto kbethernet kbpacketloss kbcpu
title: How to adjust RX and TX ring sizes (queue lengths) of Ethernet interfaces
version: 8
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>In high-load scenarios, you may need to increase to the size of RX and TX rings beyond the default settings (e.g. Ringsize_e1000_rx), and possibly also increase the total number of packet buffers in the system (Highbuffers).</p></td></tr></table>
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
<td class="confluenceTd"><p>Core 12.00.19</p></td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Status</td>
<td colspan="1" class="confluenceTd"><div class="content-wrapper"><p><img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=DRAFT&amp;colour=Yellow" data-macro-name="status" data-macro-id="471998ff-74aa-4084-a92e-47beddac7d93" data-macro-parameters="colour=Yellow|title=DRAFT" data-macro-schema-version="1"> <img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=OK&amp;colour=Green" data-macro-name="status" data-macro-id="47035ee4-0614-4a59-bce0-4a15bfd8dead" data-macro-parameters="colour=Green|title=OK" data-macro-schema-version="1"></p></div></td>
</tr>
</tbody>
</table></td></tr></table>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Suitable ring sizes for gigabit Ethernet interfaces</h1>
<p><img src="changing-core-ringsize-settings.svg"></p>
<p>Adjust the right setting for your interface type, e.g. the "Ringsize_e1000_..." settings for e1000 interfaces.</p>
<p>An RX ring size of 1000 packets means that the system will tolerate up to 1 ms of delay between servicing the queues in a 1 MPPS scenario before losing packets.</p>
<h1>Increase number of system packet buffers if necessary</h1>
<p>In a 6-interface system, 1024 buffers on RX queues, and up to 1024 on TX queues when full, will consume (1024+1024)  x 6 = 12288 packet buffers total.</p>
<p>The currently-allocated number is shown in the "stats" console command:</p>
<p><img src="stats-command-with-buffers.png"></p>
<p>On this example E80, 24666 buffers are allocated by default, so 12288 is only about half of that, and the setting probably does not need to be increased - there's still 50% buffers available for other queues. Though if there is enough RAM available, it would certainly be advisable to increase the <strong>HighBuffers</strong> setting (first make it NOT dynamic!) to get the peak usage down to 25%, in order to leave room for packet queueing in other subsystems!</p>
<p>Use the <strong>mem</strong> console command to see how much free RAM there is. If there is not enough, the first thing to tune down is typically the maximum number of statefully-tracked connections - the <strong>MaxConnections</strong> setting.</p>
<p>After changing HighBuffers or MaxConnections, a core restart is needed (e.g "shutdown 1" on the console).</p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtiZXRoZXJuZXQiLCJrYnBhY2tldGxvc3MiKSBhbmQgdHlwZSA9ICJwYWdlIn0&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="53a143b7-a3a9-4d49-b87e-330413001b82" data-macro-parameters='cql=label in ("kbethernet","kbpacketloss") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"> </p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>