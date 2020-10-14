---
confluence-id: '309993213'
date: '2020-09-08T01:20:03.000+02:00'
excerpt: For a long time, TCP MSS (Maximum Segment Size) above 1460 was abnormal.
  However, with the advent of jumboframe-capable hosts, we now see TCP MSS announcements
  of 8960. The setting can safely be raised to 9000.
last_modified_at: '2020-09-08T01:20:03.000+02:00'
layout: article
orig-title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
orig-title-slugified: tcp-mss-above-log-level-log-events-for-mss-8960-being-higher-than-tcpmssloglevel-7000
permalink: /309993213/tcp-mss-above-log-level-log-events-for-mss-8960-being-higher-than-tcpmssloglevel-7000
properties:
- - Up to date for
  - - Core 12.00.20
- - Status
  - - OK
published: 'true'
redirect_from:
- /309993213/
slug: '309993213'
tags: log tcp mtu core mss
title: tcp_mss_above_log_level log events for MSS 8960 being higher than TCPMSSLogLevel
  7000
toc: true
version: 6
---

<img ac:height="170" src="image2019-9-6_23-26-26.png"/>

Log events like the above are becoming a common occurence as more and more servers become connected to jumbogram networks - even though the Internet at large does not support larger frames than standard Ethernet.

# Changing the TCPMSSLogLevel
To suppress the log events, simply set the "TCPMSSLogLevel" setting to e.g. 9000. Or 8960 if you like.

The default value for this setting will be changed in a future release of cOS Core.




# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "kbtcp" or tags contains "kbmtu" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}