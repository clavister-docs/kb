---
confluence-id: '314121742'
orig-title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer
  sent a main mode delete"'
slug: '314121742'
tags: kb kbcore kbvpn kbipsec kbikev2 kbwindows kbdh
title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer sent
  a main mode delete"'
version: 13
---

<ac:layout><ac:layout-section ac:type="two_equal"><ac:layout-cell><ac:structured-macro ac:name="excerpt" ac:schema-version="1" ac:macro-id="2a6e168f-b284-4015-a70f-5110bdc4ede8"><ac:parameter ac:name="atlassian-macro-output-type">INLINE</ac:parameter><ac:rich-text-body><p>This error indicates a mismatch in the Phase 2 (IPsec / main mode) proposal lists, where only AES256/3DES with HMAC-SHA1 is proposed by default in Windows.</p></ac:rich-text-body></ac:structured-macro><p><br /></p><p><ac:structured-macro ac:name="toc" ac:schema-version="1" ac:macro-id="b14ec6bf-c24f-4c52-ae96-1779f5f720df" /></p><p><ac:image ac:queryparams="effects=border-simple,shadow-kn" ac:height="250"><ri:attachment ri:filename="image2019-12-5_19-22-44.png" /></ac:image></p></ac:layout-cell><ac:layout-cell><ac:structured-macro ac:name="details" ac:schema-version="1" ac:macro-id="d6c80c04-42e9-45c0-8446-1df87ed8ca22"><ac:rich-text-body><table class="wrapped"><colgroup> <col /> <col /> </colgroup><tbody><tr><td><p>Up to date for</p></td><td><p>Core 12.00.21</p><p>Windows 10.0.18362 (2019)</p><p><br /></p></td></tr><tr><td colspan="1">Not valid for</td><td colspan="1"><ac:placeholder>Remove line if unnecessary </ac:placeholder></td></tr><tr><td colspan="1">Status</td><td colspan="1"><div class="content-wrapper"><p><ac:structured-macro ac:name="status" ac:schema-version="1" ac:macro-id="000e7e8f-43e7-42ba-90a3-a0bc34ddfd27"><ac:parameter ac:name="colour">Green</ac:parameter><ac:parameter ac:name="title">OK</ac:parameter></ac:structured-macro>&nbsp;</p><p><ac:placeholder>DRAFT: still working on this </ac:placeholder></p><p><ac:placeholder>OK: usable (doesn't have to mean final!) </ac:placeholder></p><p><ac:placeholder>OLD: information is out of date </ac:placeholder></p><p><ac:placeholder>NEVERPUBLIC: never consider it for publication.</ac:placeholder></p></div></td></tr></tbody></table></ac:rich-text-body></ac:structured-macro></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><h1>Windows 10 (2019) IKEv2 Phase 1 proposals</h1><p>First, we negotiate the encryption parameters used for IKE (port 500/4500) itself.</p><p>With Windows IKEv2 &quot;Require encryption&quot; and &quot;Maximum strength encryption&quot; modes, these proposal lists are sent:</p><table class="wrapped"><colgroup><col /><col /><col /></colgroup><tbody><tr><th>Encrypt</th><th>HMAC</th><th colspan="1">DH</th></tr><tr><td>3DES</td><td>SHA1-96</td><td colspan="1">2 (1024 bit)</td></tr><tr><td>AES256</td><td>SHA1-96</td><td colspan="1">2 (1024 bit)</td></tr><tr><td>3DES</td><td>SHA2-256-128</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">AES256</td><td colspan="1">SHA2-256-128</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">3DES</td><td colspan="1">SHA2-384-192</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">AES256</td><td colspan="1">SHA2-384-192</td><td colspan="1">2 (1024 bit)</td></tr></tbody></table><p>cOS Core will pick the first allowed proposal, from the top.</p><p>In other words, if your proposal list includes 3DES (reasonable), but SHA1 is removed (reasonable but slightly paranoid), the result will be <strong>3DES + SHA2-128</strong>.</p><h1>The problem: Phase 2 (IPsec / main mode) proposals</h1><p>Windows 10 (2019) has a very limited proposal list for Phase 2:</p><table class="wrapped"><colgroup><col /><col /><col /></colgroup><tbody><tr><th>Encrypt</th><th>HMAC</th><th colspan="1">DH (PFS)</th></tr><tr><td>AES256</td><td>SHA1-96</td><td colspan="1">None</td></tr><tr><td>3DES</td><td>SHA1-96</td><td colspan="1">None</td></tr></tbody></table><p>In other words: Your perfectly reasonable proposal list in Phase 1 will no longer work in Phase 2.</p><p>You have two choices:</p><ul><li>Add SHA1 to your IPsec (Phase 2 / main mode) proposal list.</li><li>Registry-patch Windows to use stronger crypto See e.g. <a href="https://duckduckgo.com/?q=NegotiateDH2048_AES256">the &quot;NegotiateDH2048_AES256&quot; registry value<br /></a></li></ul><h1>Footnotes</h1><ul><li>Diffie-Hellman group 2 (1024 bit) is no longer considered secure against state-level actors or equivalent. See <ac:link><ri:page ri:content-title="LogJam" /><ac:plain-text-link-body><![CDATA[LogJam]]></ac:plain-text-link-body></ac:link>.</li><li>SHA1 is known to be flawed, but is still fine for use as an HMAC, as the flaws are mitigated by the HMAC construct. Additionally, there is simply no time to mount an attack from one packet to the next</li><li>As an aside, Windows 10 does not speak IKEv2 correctly. The 6 proposals in Phase 1 should simply be expressed as a single proposal with all supported algorithms listed - see <a href="https://tools.ietf.org/html/rfc5996#section-3.3">RFC5996, page 76</a>.</li></ul><p><br /></p></ac:layout-cell></ac:layout-section><ac:layout-section ac:type="single"><ac:layout-cell><h1>Related articles</h1><p><ac:structured-macro ac:name="contentbylabel" ac:schema-version="3" ac:macro-id="b00c8c16-b965-4566-8971-d4ac5469fdf8"><ac:parameter ac:name="sort">modified</ac:parameter><ac:parameter ac:name="excerptType">rich content</ac:parameter><ac:parameter ac:name="cql">label in (&quot;kbikev2&quot;,&quot;kbwindows&quot;,&quot;kbdh&quot;) and type = &quot;page&quot;</ac:parameter></ac:structured-macro></p><p><ac:placeholder> Change the labels in the macro to match suitably narrow labels, e.g. &quot;kbdhcp, kbrouting&quot; but not &quot;kbcore&quot;/&quot;kbhowto&quot;/&quot;kb&quot;/&quot;kbdictionary&quot;. Pages with ANY of the labels will be shown - it's _not_ a &quot;must match all&quot; filter. (You can of course use as much advanced filtering as you like!) </ac:placeholder></p><p><br /></p><p><br /></p></ac:layout-cell></ac:layout-section></ac:layout>