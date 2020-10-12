---
confluence-id: '309987444'
date: '2020-09-07T00:29:20.000+02:00'
excerpt: In high-load scenarios, you may need to increase to the size of RX and TX
  rings beyond the default settings (e.g. Ringsize_e1000_rx), and possibly also increase
  the total number of packet buffers in the system (Highbuffers).
last_modified_at: '2020-09-07T00:29:20.000+02:00'
layout: article
orig-title: How to adjust RX and TX ring sizes (queue lengths) of Ethernet interfaces
orig-title-slugified: how-to-adjust-rx-and-tx-ring-sizes-queue-lengths-of-ethernet-interfaces
permalink: /309987444/how-to-adjust-rx-and-tx-ring-sizes-queue-lengths-of-ethernet-interfaces
properties:
- - Up to date for
  - Core 12.00.19
- - Status
  - - DRAFT
    - OK
published: 'true'
redirect_from:
- /309987444/
slug: '309987444'
tags: kb kbcore kbhowto kbethernet kbpacketloss kbcpu
title: How to adjust RX and TX ring sizes (queue lengths) of Ethernet interfaces
toc: true
version: 8
---

# Suitable ring sizes for gigabit Ethernet interfaces
<img ac:align="right" src="changing-core-ringsize-settings.svg"/>

Adjust the right setting for your interface type, e.g. the "Ringsize_e1000_..." settings for e1000 interfaces.

An RX ring size of 1000 packets means that the system will tolerate up to 1 ms of delay between servicing the queues in a 1 MPPS scenario before losing packets.

# Increase number of system packet buffers if necessary
In a 6-interface system, 1024 buffers on RX queues, and up to 1024 on TX queues when full, will consume (1024+1024)  x 6 = 12288 packet buffers total.

The currently-allocated number is shown in the "stats" console command:

<img ac:height="149" src="stats-command-with-buffers.png"/>

On this example E80, 24666 buffers are allocated by default, so 12288 is only about half of that, and the setting probably does not need to be increased - there's still 50% buffers available for other queues. Though if there is enough RAM available, it would certainly be advisable to increase the **HighBuffers** setting (first make it NOT dynamic!) to get the peak usage down to 25%, in order to leave room for packet queueing in other subsystems!

Use the **mem** console command to see how much free RAM there is. If there is not enough, the first thing to tune down is typically the maximum number of statefully-tracked connections - the **MaxConnections** setting.

After changing HighBuffers or MaxConnections, a core restart is needed (e.g "shutdown 1" on the console).

# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% if article.tags contains "kbethernet" or article.tags contains "kbpacketloss" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}