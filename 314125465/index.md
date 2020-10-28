---
confluence-id: '314125465'
date: '2020-09-08T01:19:35.000+02:00'
excerpt: The data portion of SNMPv3 and SNMPv2 traps are identical. Only the wrapping
  headers differ. Wireshark shows the data portion in the summary line.
last_modified_at: '2020-09-08T01:19:35.000+02:00'
layout: article
orig-title: Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"?
orig-title-slugified: why-does-wireshark-say-that-snmpv3-traps-sent-from-cos-core-are-snmpv2-trap-
permalink: /314125465/why-does-wireshark-say-that-snmpv3-traps-sent-from-cos-core-are-snmpv2-trap-
properties:
- - Up to date for
  - - Core 12.00.22
    - Core 13.00.01
    - WireShark 2.6.10
- - Status
  - - OK
published: 'true'
redirect_from:
- /314125465/
slug: '314125465'
tags: snmp core wireshark
title: Why does WireShark say that SNMPv3 traps sent from cOS Core are "snmpV2-trap"?
toc: true
version: 3
---


# Manually testing SNMP trap behavior using ucs-snmp
This can be tested on e.g. a Linux host:

<ac:structured-macro><ac:parameter>bash</ac:parameter><ac:plain-text-body>$ snmptrap -v 2c -c public 192.168.0.101 '' 1.3.6.1.4.1.8072.2.3.0.1 1.3.6.1.4.1.8072.2.3.2.1 i 123456

$ snmptrap -v 3 -u ExampleSecurityName -l noAuthNoPriv 192.168.0.101 '' 1.3.6.1.4.1.8072.2.3.0.1 1.3.6.1.4.1.8072.2.3.2.1 i 123456</ac:plain-text-body></ac:structured-macro>If you walk inside the packet data, you'll see that the trap data itself is identical in both v2 and v3, but they're wrapped in different headers (v2 vs v3).


## SNMPv2 trap:
<img src="image2020-1-3_16-32-38.png" class="border" style="width: 600px;"/>


## SNMPv3 trap
<img src="image2020-1-3_17-7-27.png" class="border" style="width: 600px;"/>

Note that the contained data is still identified as a "v2 trap", it is unchanged.


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "snmp" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}