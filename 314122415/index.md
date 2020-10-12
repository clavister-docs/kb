---
confluence-id: '314122415'
date: '2020-09-16T07:58:34.000+02:00'
excerpt: Registry-patch Windows to use stronger crypto See e.g. the "NegotiateDH2048_AES256"
  registry value, or use PowerShell to change the settings of a single tunnel
last_modified_at: '2020-09-16T07:58:34.000+02:00'
layout: article
orig-title: Windows 10 IKEv2 only proposes Diffie-Hellman group 2, 1024 bit - how
  do I configure it to use group 14, 2048 bit?
orig-title-slugified: windows-10-ikev2-only-proposes-diffie-hellman-group-2-1024-bit---how-do-i-configure-it-to-use-group-14-2048-bit-
permalink: /314122415/windows-10-ikev2-only-proposes-diffie-hellman-group-2-1024-bit---how-do-i-configure-it-to-use-group-14-2048-bit-
properties:
- - Up to date for
  - Windows 10.0.18362 (2019)
- - Not valid for
  - ''
- - Status
  - - OK
published: 'true'
redirect_from:
- /314122415/
slug: '314122415'
tags: kb kbvpn kbipsec kbikev2 kbwindows kbhowto kbdh
title: Windows 10 IKEv2 only proposes Diffie-Hellman group 2, 1024 bit - how do I
  configure it to use group 14, 2048 bit?
toc: true
version: 7
---

# Windows 10 IKEv2 Phase 2 (IPsec) proposals
Windows 10 (2019) has a very limited proposal list for Phase 2:

<table class="wrapped"><colgroup><col/><col/><col/></colgroup><tbody><tr><th>Encrypt</th><th>HMAC</th><th colspan="1">DH (PFS)</th></tr><tr><td>AES256</td><td>SHA1-96</td><td colspan="1">None</td></tr><tr><td>3DES</td><td>SHA1-96</td><td colspan="1">None</td></tr></tbody></table># Change defaults in the registry
It is possibly to registry-patch Windows to use stronger crypto See e.g. <a href="https://duckduckgo.com/?q=NegotiateDH2048_AES256">the "NegotiateDH2048_AES256" registry value</a>

# Change the settings of a single tunnel via PowerShell "Set-VpnConnectionIPsecConfiguration"
<a href="https://docs.microsoft.com/en-us/powershell/module/vpnclient/set-vpnconnectionipsecconfiguration?view=win10-ps">https://docs.microsoft.com/en-us/powershell/module/vpnclient/set-vpnconnectionipsecconfiguration?view=win10-ps</a>

<img ac:queryparams="effects=border-simple,shadow-kn" ac:height="150" src="image2019-12-18_14-29-47.png"/>

# GUI lets you improve the default ciphers and HMACs, but not DH Groups
<img src="windows-firewall-ipsec-quick-mode-settings.svg"/>

# Footnotes
<ul><li>Diffie-Hellman group 2 (1024 bit) is no longer considered secure against state-level actors or equivalent. See <ac:link><ri:page ri:content-title="LogJam"/><ac:plain-text-link-body>LogJam</ac:plain-text-link-body></ac:link>.</li><li>SHA1 is known to be flawed, but is still fine for use as an HMAC, as the flaws are mitigated by the HMAC construct. Additionally, there is simply no time to mount an attack from one packet to the next</li></ul>


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