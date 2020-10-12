---
confluence-id: '314121742'
date: '2020-09-08T01:19:54.000+02:00'
excerpt: This error indicates a mismatch in the Phase 2 (IPsec / main mode) proposal
  lists, where only AES256/3DES with HMAC-SHA1 is proposed by default in Windows.
last_modified_at: '2020-09-08T01:19:54.000+02:00'
layout: article
orig-title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer
  sent a main mode delete"'
orig-title-slugified: windows-10-ikev2-ipsec-error-main-mode-sa-lifetime-expired-or-peer-sent-a-main-mode-delete-
permalink: /314121742/windows-10-ikev2-ipsec-error-main-mode-sa-lifetime-expired-or-peer-sent-a-main-mode-delete-
properties:
- - Up to date for
  - - Core 12.00.21
    - Windows 10.0.18362 (2019)
- - Status
  - - OK
published: 'true'
redirect_from:
- /314121742/
slug: '314121742'
tags: kb kbcore kbvpn kbipsec kbikev2 kbwindows kbdh
title: 'Windows 10 IKEv2 IPsec error: "Main mode SA lifetime expired or peer sent
  a main mode delete"'
toc: true
version: 13
---

# Windows 10 (2019) IKEv2 Phase 1 proposals
First, we negotiate the encryption parameters used for IKE (port 500/4500) itself.

With Windows IKEv2 "Require encryption" and "Maximum strength encryption" modes, these proposal lists are sent:

<table class="wrapped"><colgroup><col/><col/><col/></colgroup><tbody><tr><th>Encrypt</th><th>HMAC</th><th colspan="1">DH</th></tr><tr><td>3DES</td><td>SHA1-96</td><td colspan="1">2 (1024 bit)</td></tr><tr><td>AES256</td><td>SHA1-96</td><td colspan="1">2 (1024 bit)</td></tr><tr><td>3DES</td><td>SHA2-256-128</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">AES256</td><td colspan="1">SHA2-256-128</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">3DES</td><td colspan="1">SHA2-384-192</td><td colspan="1">2 (1024 bit)</td></tr><tr><td colspan="1">AES256</td><td colspan="1">SHA2-384-192</td><td colspan="1">2 (1024 bit)</td></tr></tbody></table>cOS Core will pick the first allowed proposal, from the top.

In other words, if your proposal list includes 3DES (reasonable), but SHA1 is removed (reasonable but slightly paranoid), the result will be **3DES + SHA2-128**.

# The problem: Phase 2 (IPsec / main mode) proposals
Windows 10 (2019) has a very limited proposal list for Phase 2:

<table class="wrapped"><colgroup><col/><col/><col/></colgroup><tbody><tr><th>Encrypt</th><th>HMAC</th><th colspan="1">DH (PFS)</th></tr><tr><td>AES256</td><td>SHA1-96</td><td colspan="1">None</td></tr><tr><td>3DES</td><td>SHA1-96</td><td colspan="1">None</td></tr></tbody></table>In other words: Your perfectly reasonable proposal list in Phase 1 will no longer work in Phase 2.

You have two choices:

<ul><li>Add SHA1 to your IPsec (Phase 2 / main mode) proposal list.</li><li>Registry-patch Windows to use stronger crypto See e.g. <a href="https://duckduckgo.com/?q=NegotiateDH2048_AES256">the "NegotiateDH2048_AES256" registry value
</a></li></ul># Footnotes
<ul><li>Diffie-Hellman group 2 (1024 bit) is no longer considered secure against state-level actors or equivalent. See <ac:link><ri:page ri:content-title="LogJam"/><ac:plain-text-link-body>LogJam</ac:plain-text-link-body></ac:link>.</li><li>SHA1 is known to be flawed, but is still fine for use as an HMAC, as the flaws are mitigated by the HMAC construct. Additionally, there is simply no time to mount an attack from one packet to the next</li><li>As an aside, Windows 10 does not speak IKEv2 correctly. The 6 proposals in Phase 1 should simply be expressed as a single proposal with all supported algorithms listed - see <a href="https://tools.ietf.org/html/rfc5996#section-3.3">RFC5996, page 76</a>.</li></ul>


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% if article.tags contains "kbikev2" or article.tags contains "kbdh" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}