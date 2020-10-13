---
confluence-id: '314127273'
date: '2020-09-08T01:21:44.000+02:00'
excerpt: The lifetime for IP-reputation-based blacklistings is hard-coded to 300 seconds.
  However, when the blacklisting is lifted, the next packet from/to such a host will
  trigger a new IP reputation lookup and re-block it. The blacklist merely acts as
  a cache here - having longer blacklist lifetimes affords you no greater security.
last_modified_at: '2020-09-08T01:21:44.000+02:00'
layout: article
orig-title: Can blacklist timeouts (TTL,lifetime) for "Scanner Protection" or "Botnet
  Blocking" be changed or increased?
orig-title-slugified: can-blacklist-timeouts-ttl-lifetime-for-scanner-protection-or-botnet-blocking-be-changed-or-increased-
permalink: /314127273/can-blacklist-timeouts-ttl-lifetime-for-scanner-protection-or-botnet-blocking-be-changed-or-increased-
properties:
- - Up to date for
  - Core 12.00.22, 13.00.01
- - Supported since
  - Core 12.00.00
- - Status
  - - OK
published: 'true'
redirect_from:
- /314127273/
slug: '314127273'
status:
- OK
tags: kb kbcore kbipreputation kbblacklist kbthreatprevention
title: Can blacklist timeouts (TTL,lifetime) for "Scanner Protection" or "Botnet Blocking"
  be changed or increased?
toc: false
version: 5
---

# See also: Threshold Rules
If you want to perform your own rate logic on hosts scanning your networks, please see "Threshold Rules".

Threshold Rules are the only way to deal with rogue internal hosts attempting to scan your own networks - global IP reputation databases obviously know nothing about your private IP addresses.

And, yes, the blacklisting lifetimes _can_ be configured for these.




# Related articles

        {% assign list = "" | split:"" %}
        {% assign articles = site.pages | where: "layout", "article" %}
        {% for article in articles %}
        {% if item.tags contains "kbthreatprevention" or item.tags contains "kbblacklist" %}
            {% assign list = list | push: article %}
            
        {% endif %}
        {% endfor %}
        {% assign list = list | uniq %}
        {% include listrelated.html articles = list %}