---
confluence-id: '309997970'
date: '2020-09-08T01:19:19.000+02:00'
excerpt: 'In short: forwarded, layer 3+ bytes that are SENT are counted.'
last_modified_at: '2020-09-08T01:19:19.000+02:00'
layout: article
orig-title: What packets are counted in "Forwarded bps" and "Forwarded pps" statistics
  (and SNMP) counters?
orig-title-slugified: what-packets-are-counted-in-forwarded-bps-and-forwarded-pps-statistics-and-snmp-counters-
permalink: /309997970/what-packets-are-counted-in-forwarded-bps-and-forwarded-pps-statistics-and-snmp-counters-
properties:
- - Up to date for
  - - Core 12.00.20
- - Status
  - - OK
published: 'true'
redirect_from:
- /309997970/
slug: '309997970'
tags: core statistics snmp
title: What packets are counted in "Forwarded bps" and "Forwarded pps" statistics
  (and SNMP) counters?
toc: false
version: 5
---

# The base principle
<ul><li>**We count bytes SENT at IP level** = bytes given to the layer 2 drivers. 
<ul><li>Note that past this point, ARP resolution, tunnel negotiation, interface drivers can still fail to deliver the packet. This does not affect the "Forwarded" statistic.</li></ul></li><li>Only bytes Layer 3 and up are counted = IP headers and the data beneath them. Not Ethernet headers, outer ESP where the firewall is a VPN endpoint, etc.</li><li>Packets originated by the firewall itself (log data, management traffic, etc) are (mostly) not counted.</li></ul>## But VPN tunnels?
We measure **data forwarded into / out of a tunnel**, not the outer encapsulation, as that part of the packet is considered "originated by the firewall itself".

## But some legacy exceptions
ICMP Echo responses are counted for legacy reasons.

ICMP errors and TCP RSTs are similarly counted for legacy reasons.




# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "kbstatistics" or tags contains "kbsnmp" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}