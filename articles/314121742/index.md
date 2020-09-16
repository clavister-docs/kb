---
confluence-id: '314121742'
date: '2020-09-08T01:19:54.000+02:00'
last_modified_at: '2020-09-08T01:19:54.000+02:00'
layout: article
orig-title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer
  sent a main mode delete"'
orig-title-slugified: windows-10-ikev2-ipsec-error-main-mode-sa-lifetime-expired-or-peer-sent-a-main-mode-delete-
permalink: /314121742/
published: 'true'
slug: '314121742'
tags: kb kbcore kbvpn kbipsec kbikev2 kbwindows kbdh
title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer sent
  a main mode delete"'
version: 13
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>This error indicates a mismatch in the Phase 2 (IPsec / main mode) proposal lists, where only AES256/3DES with HMAC-SHA1 is proposed by default in Windows.</p></td></tr></table>
<p><br></p>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e3RvY30&amp;locale=en_GB&amp;version=2" data-macro-name="toc" data-macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" data-macro-schema-version="1"></p>
<p><img class="confluence-embedded-image" height="250" confluence-query-params="effects=border-simple,shadow-kn" src="/download/attachments/314121742/image2019-12-5_19-22-44.png?version=1&amp;modificationDate=1575570163000&amp;api=v2&amp;effects=border-simple,shadow-kn" data-image-src="/download/attachments/314121742/image2019-12-5_19-22-44.png?version=1&amp;modificationDate=1575570163000&amp;api=v2" data-unresolved-comment-count="0" data-linked-resource-id="314121751" data-linked-resource-version="1" data-linked-resource-type="attachment" data-linked-resource-default-alias="image2019-12-5_19-22-44.png" data-base-url="http://wiki.clavister.com" data-linked-resource-content-type="image/png" data-linked-resource-container-id="314121742" data-linked-resource-container-version="13" title='Knowledge Base &gt; Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer sent a main mode delete" &gt; image2019-12-5_19-22-44.png' data-location='Knowledge Base &gt; Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer sent a main mode delete" &gt; image2019-12-5_19-22-44.png' data-image-height="326" data-image-width="472"></p>
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
<p>Core 12.00.21</p>
<p>Windows 10.0.18362 (2019)</p>
<p><br></p>
</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Not valid for</td>
<td colspan="1" class="confluenceTd"></td>
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
<h1>Windows 10 (2019) IKEv2 Phase 1 proposals</h1>
<p>First, we negotiate the encryption parameters used for IKE (port 500/4500) itself.</p>
<p>With Windows IKEv2 "Require encryption" and "Maximum strength encryption" modes, these proposal lists are sent:</p>
<table class="wrapped confluenceTable">
<colgroup>
<col>
<col>
<col>
</colgroup>
<tbody>
<tr>
<th class="confluenceTh">Encrypt</th>
<th class="confluenceTh">HMAC</th>
<th colspan="1" class="confluenceTh">DH</th>
</tr>
<tr>
<td class="confluenceTd">3DES</td>
<td class="confluenceTd">SHA1-96</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
<tr>
<td class="confluenceTd">AES256</td>
<td class="confluenceTd">SHA1-96</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
<tr>
<td class="confluenceTd">3DES</td>
<td class="confluenceTd">SHA2-256-128</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">AES256</td>
<td colspan="1" class="confluenceTd">SHA2-256-128</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">3DES</td>
<td colspan="1" class="confluenceTd">SHA2-384-192</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">AES256</td>
<td colspan="1" class="confluenceTd">SHA2-384-192</td>
<td colspan="1" class="confluenceTd">2 (1024 bit)</td>
</tr>
</tbody>
</table>
<p>cOS Core will pick the first allowed proposal, from the top.</p>
<p>In other words, if your proposal list includes 3DES (reasonable), but SHA1 is removed (reasonable but slightly paranoid), the result will be <strong>3DES + SHA2-128</strong>.</p>
<h1>The problem: Phase 2 (IPsec / main mode) proposals</h1>
<p>Windows 10 (2019) has a very limited proposal list for Phase 2:</p>
<table class="wrapped confluenceTable">
<colgroup>
<col>
<col>
<col>
</colgroup>
<tbody>
<tr>
<th class="confluenceTh">Encrypt</th>
<th class="confluenceTh">HMAC</th>
<th colspan="1" class="confluenceTh">DH (PFS)</th>
</tr>
<tr>
<td class="confluenceTd">AES256</td>
<td class="confluenceTd">SHA1-96</td>
<td colspan="1" class="confluenceTd">None</td>
</tr>
<tr>
<td class="confluenceTd">3DES</td>
<td class="confluenceTd">SHA1-96</td>
<td colspan="1" class="confluenceTd">None</td>
</tr>
</tbody>
</table>
<p>In other words: Your perfectly reasonable proposal list in Phase 1 will no longer work in Phase 2.</p>
<p>You have two choices:</p>
<ul>
<li>Add SHA1 to your IPsec (Phase 2 / main mode) proposal list.</li>
<li>Registry-patch Windows to use stronger crypto See e.g. <a href="https://duckduckgo.com/?q=NegotiateDH2048_AES256">the "NegotiateDH2048_AES256" registry value<br></a>
</li>
</ul>
<h1>Footnotes</h1>
<ul>
<li>Diffie-Hellman group 2 (1024 bit) is no longer considered secure against state-level actors or equivalent. See <a class="confluence-link createlink" href="/pages/createpage.action?spaceKey=KB&amp;title=LogJam&amp;linkCreation=true&amp;fromPageId=314121742" data-content-title="LogJam">LogJam</a>.</li>
<li>SHA1 is known to be flawed, but is still fine for use as an HMAC, as the flaws are mitigated by the HMAC construct. Additionally, there is simply no time to mount an attack from one packet to the next</li>
<li>As an aside, Windows 10 does not speak IKEv2 correctly. The 6 proposals in Phase 1 should simply be expressed as a single proposal with all supported algorithms listed - see <a href="https://tools.ietf.org/html/rfc5996#section-3.3">RFC5996, page 76</a>.</li>
</ul>
<p><br></p>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h1>Related articles</h1>
<p><img class="editor-inline-macro" src="/plugins/servlet/confluence/placeholder/macro?definition=e2NvbnRlbnRieWxhYmVsOnNvcnQ9bW9kaWZpZWR8ZXhjZXJwdFR5cGU9cmljaCBjb250ZW50fGNxbD1sYWJlbCBpbiAoImtiaWtldjIiLCJrYndpbmRvd3MiLCJrYmRoIikgYW5kIHR5cGUgPSAicGFnZSJ9&amp;locale=en_GB&amp;version=2" data-macro-name="contentbylabel" data-macro-id="b00c8c16-b965-4566-8971-d4ac5469fdf8" data-macro-parameters='cql=label in ("kbikev2","kbwindows","kbdh") and type \= "page"|excerptType=rich content|sort=modified' data-macro-schema-version="3"></p>
<p><br></p>
<p><br></p>
</div>
</div>
</div>
</div>