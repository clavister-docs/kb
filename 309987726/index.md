---
confluence-id: '309987726'
date: '2020-09-16T02:31:34.000+02:00'
excerpt: There's many bad lookup tools out there, and to make it worse, some address
  spans are locally-configured. Here's what you need to know.
last_modified_at: '2020-09-16T02:31:34.000+02:00'
layout: article
orig-title: Best ways of looking up the MAC Vendor (OUI) for an Ethernet hardware
  address
orig-title-slugified: best-ways-of-looking-up-the-mac-vendor-oui-for-an-ethernet-hardware-address
permalink: /309987726/best-ways-of-looking-up-the-mac-vendor-oui-for-an-ethernet-hardware-address
properties:
- - Status
  - - OK
published: 'true'
redirect_from:
- /309987726/
slug: '309987726'
tags: kb kbethernet kboui
title: Best ways of looking up the MAC Vendor (OUI) for an Ethernet hardware address
toc: true
version: 14
---

# Ethernet MAC address format
6 bytes, formatted in lots of ways. "12-23-34-45-56-67", "1223:4556:6778", "1234.5678.9abc" - they're all the same.

The first 3 bytes are often referred to as the "MAC Vendor field" or "IEEE OUI", though note that OUI:s are also used for non-Ethernet things.

### First byte odd = multicast
**x1**-xx-xx-xx-xx-xx, **x3-**xx-xx-xx-xx-xx, **x5**..., **x7**..., **x9**..., **xb**..., **xd**..., **xf**...

These are typically never used as source address, only destination address. Rounding down to a multiple of 4 ( = subtracting 1 or 3 ) from the first byte MAY get you the vendor, depending on application.

### First byte not divisible by 4 = locally-configured
**x2**-xx-xx-xx-xx-xx, **x6-**xx-xx-xx-xx-xx, **xa**-xx-xx-xx-xx-xx, **xe-**xx-xx-xx-xx-xx

These are not registered with IEEE - you are supposed to assign them "locally", with varying interpretations of "local". Subtracting 2 from the first byte MAY get you the vendor, depending on what practice the local admins follow.

### First byte is x0, x4, x8, xc = you can look it up!
This ought to be an actual IEEE OUI <a href="https://en.wikipedia.org/wiki/Organizationally_unique_identifier">- https://en.wikipedia.org/wiki/Organizationally_unique_identifier</a>

### 01-00-5e-xx-xx-xx = IPv4 multicast
The final bytes are taken directly from the lowest 23 bits (aka 3 bytes minus highest 1 bit) of the IPv4 multicast address.

This means that several valid IPv4 multicast addresses map to the same Ethernet addresses. So: you can't know for sure what 01-00-5e-00-00-16 ... but it's a good bet that it's IGMP (224.0.0.22).

### 33-33-xx-xx-xx-xx = ipv6 multicast
The 4 lowest bytes are taken from the IPv6 address.

### In summary
<code>x0 x4 x8 xc</code> = registered MAC vendor
<code>x1 x5 x9 xd</code> = multicast, should belong to above
<code>x2 x6 xa xe</code> = locally-assigned
<code>x3 x7 xa xf</code> = multicast belonging to locally-assigned

# Good lookup tools
There's many that are poorly updated or pull from bad sources.

In our experience, **<a href="https://www.wireshark.org/tools/oui-lookup.html">https://www.wireshark.org/tools/oui-lookup.html</a>** is one of the best.

If you want the Official Source, it's **<a href="http://standards-oui.ieee.org/oui.txt">http://standards-oui.ieee.org/oui.txt</a>** - but the wireshark tables also contain unassigned-but-commonly-found addresses.




# Clavister HA shared (virtual) MACs
## 10-00-00?
If you're a Clavister customer, that's likely a HA cluster shared MAC address that you are seeing.

The last (sixth) byte is the cluster ID in hexadecimal.

## Multicasts to 11-00-00?
If you're a Clavister customer, that's likely HA Cluster Heartbeats you're seeing - it should be a handful every second.

It's the 10-00-00 address, +1 in the first byte, following standard multicast assignment rules.

## HAUseUniqueSharedMacPerIface
With this setting off, the shared address will be 10-00-00-c1-4a-xx.

With this setting ON, "c1-4a" is replaced by a unique number for that Ethernet interface. VLANs still copy that base address - as normal - and are not unique among VLANs on the same trunk.




# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% if article.tags contains "kbethernet" or article.tags contains "kboui" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}
