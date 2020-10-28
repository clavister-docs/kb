---
confluence-id: '309993643'
date: '2020-09-08T01:20:16.000+02:00'
excerpt: cOS Core will log about unexpected packets on its sync interface in order
  to alert you about the sync interface possibly becoming connected to a general LAN
  - something which likely would be harmful to your security level.However, if all
  you see if Reverse ARP (RARP) and IGMP broadcasts, chances are that you are seeing
  a VMWare ESX host with the vswitch "Notify Switches" setting enabled.
last_modified_at: '2020-09-08T01:20:16.000+02:00'
layout: article
orig-title: 'HA: disallowed_on_sync_iface log events with rule=HA_RestrictSyncIf for
  Reverse ARP, RARP, and IGMP'
orig-title-slugified: ha-disallowed-on-sync-iface-log-events-with-rule-ha-restrictsyncif-for-reverse-arp-rarp-and-igmp
permalink: /309993643/ha-disallowed-on-sync-iface-log-events-with-rule-ha-restrictsyncif-for-reverse-arp-rarp-and-igmp
properties:
- - Up to date for
  - - Core 12.00.20
- - Status
  - - OK
published: 'true'
redirect_from:
- /309993643/
slug: '309993643'
tags: vmware log ha rarp arp core
title: 'HA: disallowed_on_sync_iface log events with rule=HA_RestrictSyncIf for Reverse
  ARP, RARP, and IGMP'
toc: false
version: 3
---

If it is established that the source of the packets is ESXi and there are no other packet types, there is no need for further action.

It is however completely safe to disable "Notify Switches" on vhost interfaces used for HA sync - they will do broadcasts of their own very often and do not need help with notifying switches.


# Further reading
<a href="https://www.google.com/search?q=esxi+%22notify+switches%22+setting+%22nic+teaming%22+rarp">Google: esxi "notify switches" setting "nic teaming" rarp</a>


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "vmware" or tags contains "ha" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}