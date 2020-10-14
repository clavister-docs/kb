---
confluence-id: '309994088'
date: '2020-09-08T01:21:01.000+02:00'
excerpt: An Access rule - including the default reverse route lookup if reached -
  will drop the packet before it reaches the IPsec engine and/or is picked up by the
  IPsecBeforeRule.
last_modified_at: '2020-09-08T01:21:01.000+02:00'
layout: article
orig-title: Does IPsecBeforeRules trigger before Access rules?
orig-title-slugified: does-ipsecbeforerules-trigger-before-access-rules-
permalink: /309994088/does-ipsecbeforerules-trigger-before-access-rules-
properties:
- - Up to date for
  - - Core 12.00.20
- - Status
  - - OK
published: 'true'
redirect_from:
- /309994088/
slug: '309994088'
tags: core ipsec rules access
title: Does IPsecBeforeRules trigger before Access rules?
toc: false
version: 3
---




# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "kbrules" or tags contains "kbaccess" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}