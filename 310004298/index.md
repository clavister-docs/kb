---
confluence-id: '310004298'
date: '2020-09-08T01:19:08.000+02:00'
excerpt: 'As with all mDNS-based discovery, transparent mode and multicast forwarding
  (multiplex SAT) rules are required. 224.0.0.251 multicasts to port 5353 have to
  be forwarded in both directions. And, of course, the printing itself: IPP, TCP port
  631.'
last_modified_at: '2020-09-08T01:19:08.000+02:00'
layout: article
orig-title: How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf
  discovery over multicast in transparent mode
orig-title-slugified: how-to-set-up-airprint-airplay-mopria-cups-etc-with-mdns-dns-sd-bonjour-avahi-zeroconf-discovery-over-multicast-in-transparent-mode
permalink: /310004298/how-to-set-up-airprint-airplay-mopria-cups-etc-with-mdns-dns-sd-bonjour-avahi-zeroconf-discovery-over-multicast-in-transparent-mode
properties:
- - Up to date for
  - - Core 12.00.21
    - Core 13.00.00
    - Mopria Print Service for Android 2.10.6
    - CUPS (2019)
- - Supported since
  - - Core 8.70.xx
- - Status
  - - OK
published: 'true'
redirect_from:
- /310004298/
slug: '310004298'
tags: core howto mdns multicast transparentmode airprint igmp
title: How to set up AirPrint, AirPlay, Mopria, CUPS etc with mDNS,DNS-SD,Bonjour,Avahi,Zeroconf
  discovery over multicast in transparent mode
toc: true
version: 32
---

# mDNS? Bonjour? AirSomething?
<div ac:name="panel" ac:schema-version="1" ac:macro-id="aef4ae9c-dd23-42cf-b81f-9697529467eb" class="panel"><ac:rich-text-body><img ac:name="information" src="/assets/img/information.svg"/> More specifically, <a href="http://www.dns-sd.org/">DNS-SD</a> _typically_ runs on top of mDNS, but technically speaking it can query a regular DNS server, too, if the server is configured to hand out these records. But that's unusual.

</ac:rich-text-body></div>First, it's important to understand that these are all (mostly) about UDP multicasts to address 224.0.0.251, port 5353. Aka "multicast DNS", mDNS.

Example mDNS query from a Linux host running "mdns-scan":

<img ac:queryparams="effects=border-simple,blur-border" src="example-query.png"/>

Example mDNS response from a multifunction printer/scanner:

<img ac:queryparams="effects=border-simple,blur-border" src="example-response.png"/>




# Strategy - IGMP or not?
<div ac:name="panel" ac:schema-version="1" ac:macro-id="a296df52-0004-495e-832b-b01eb2fa27a4" class="panel"><ac:rich-text-body><img ac:name="information" src="/assets/img/information.svg"/> IGMP makes more sense for large data streams, where you want to limit the amount of traffic flowing. Here, you always want to receive the mDNS packets.

</ac:rich-text-body></div>We can opt to work with IGMP Rules (under the Routing subsection), which also works, but _assumes_ that all units speak IGMP correctly.

It would also mean delays in our testing - _nothing would work until the firewall receives the IGMP rebroadcasts_.

So, we opt to simply go for raw **SAT Multiplex** rules: **Always forward the multicasts,** regardless of hearing IGMP or not.




# How to configure
## Enable transparent mode
First, **Transparent Mode** most likely needs to be enabled on the involved interfaces.

-- Without it, TTL=1 multicasts will be dropped. (But if all systems use higher TTLs it will likely still work? Untested.)

Note that "Forward Broadcast Traffic" does _not_ need to be enabled on the interfaces for this to work. mDNS uses multicast, not broadcast.

## But I don't want switched routes, L3C, CAM, and all of that?
That's fine. Simply configure static routes. It's just that Transparent Mode on the sending interface is currently a requirement for leaving the IP TTL untouched in cOS Core.

With static routes + Transparent Mode, the only 2 differences will be:

<ul><li>MAC addresses are not hidden</li><li>We can leave the IP TTL alone</li></ul>## Add Multiplex SAT rules for mDNS in both directions
<div ac:name="panel" ac:schema-version="1" ac:macro-id="a21d8a07-3724-44d8-8428-64e22f0506b8" class="panel"><ac:rich-text-body><img ac:name="question" src="/assets/img/question.svg"/> _Can you use interface groups to make it a single rule?_

Yes, it'll work, but unfortunately the firewall <u>will also duplicate the packet back</u> out the interface it came from, which is <u>possibly dangerous</u> if there is another unit doing the same.

</ac:rich-text-body></div>As you see in the packet traces, mDNS responses do not arrive to the IP address that sent the query. They are sent out to the multicast address.

Therefore, mDNS multicasts have to be separately **allowed in both directions**.

<img ac:queryparams="effects=border-simple,blur-border" src="sat-multiplex-rule.png"/>

... and of course **one more in the opposite direction**.

<ac:task-list>
<ac:task>
<ac:task-id>1</ac:task-id>
<ac:task-status>incomplete</ac:task-status>
<ac:task-body><span>Make RFE about interface groups in sat multiplex - don't send back out where it came from!</span></ac:task-body>
</ac:task>
</ac:task-list><div ac:name="panel" ac:schema-version="1" ac:macro-id="53c86b68-e0d9-417b-930b-af8b1405e93f" class="panel"><ac:rich-text-body><span><img ac:name="information" src="/assets/img/information.svg"/> Technically, the firewall defaults to adding a route for 224.0.0.0/4 to "core" so you _could_ also set the destination interface to "core". </span>

</ac:rich-text-body></div><span>Note the "Destination: any" in the filter - it does not make sense to filter according to the routing table here.</span>

<span>
</span>

## Add rule for Internet Printing Protocol
This is entirely straightforward.

Allow traffic to the printer's IP address, TCP port 631.




## Double check TTL setting
In case a unit sends mDNS packets with IP TTL=1, we may want to make sure we don't decrement it to 0 and drop it.

There may also be mDNS clients that check for TTL still being 255 on receipt, i.e. that the packet didn't traverse a network boundary.

Either way, it's a good idea to make sure that TTL is left untouched:

<img ac:queryparams="effects=border-simple,blur-border" ac:height="250" src="decrement-ttl-off.png"/>

### That's a lot of talk about TTL?
Well, <a href="https://tools.ietf.org/html/rfc6762">https://tools.ietf.org/html/rfc6762</a> says this:

<pre>11. Source Address Check</pre><pre>   All Multicast DNS responses (including responses sent via unicast)
   SHOULD be sent with IP TTL set to 255.  This is recommended to
   provide backwards-compatibility with older Multicast DNS queriers
   (implementing a draft version of this document, posted in February
   2004) that check the IP TTL on reception to determine whether the
   packet originated on the local link.  These older queriers discard
   all packets with TTLs other than 255.
</pre>And additionally, there are recommendations for dropping mDNS packets if the source IP address does not belong on the local network.

<img ac:name="warning" src="/assets/img/warning.svg"/> If you find an mDNS that implementation refuses to cross the firewall boundary, you may have to renumber your IP ranges to match.

Microsoft's mDNS implementation for instance, _may_ give you problems via Windows Defender Firewall. But here you can simply re-configure the rules.

<img ac:queryparams="effects=border-simple,blur-border" ac:width="800" src="image2019-10-23_12-9-27.png"/>

## Test it!
<img ac:queryparams="effects=border-simple,blur-border" src="mdns-scan-console-screenshot.png"/>







# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "kbmulticast" or tags contains "kbprint" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}