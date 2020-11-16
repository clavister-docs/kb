---
confluence-id: '310004298'
date: '2020-10-19T11:12:35.000+02:00'
excerpt: 'As with all mDNS-based discovery, transparent mode and multicast forwarding
  (multiplex SAT) rules are required. 224.0.0.251 multicasts to port 5353 have to
  be forwarded in both directions. And, of course, the printing itself: IPP, TCP port
  631.'
last_modified_at: '2020-10-19T11:12:35.000+02:00'
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
version: 37
---

<div class="alert alert-warning"><strong>This NOT YET TESTED with an actual iThing, only with a Linux client + Mopria!</strong></div>


# mDNS? Bonjour? AirSomething?
<div class="panel ml-2"><img src="/assets/img/information.svg"/> More specifically, <a href="http://www.dns-sd.org/">DNS-SD</a> <em>typically</em> runs on top of mDNS, but technically speaking it can query a regular DNS server, too, if the server is configured to hand out these records. But that's unusual.</div>
First, it's important to understand that these are all (mostly) about UDP multicasts to address 224.0.0.251, port 5353. Aka "multicast DNS", mDNS.

Example mDNS query from a Linux host running "mdns-scan":

<img src="example-query.png" class="border shadow"/>

Example mDNS response from a multifunction printer/scanner:

<img src="example-response.png" class="border shadow"/>


# Strategy - IGMP or not?
<div class="panel ml-2"><img src="/assets/img/information.svg"/> IGMP makes more sense for large data streams, where you want to limit the amount of traffic flowing. Here, you always want to receive the mDNS packets.</div>
We can opt to work with IGMP Rules (under the Routing subsection), which also works, but _assumes_ that all units speak IGMP correctly.

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

<ul><li>MAC addresses are not hidden</li><li>We can leave the IP TTL alone</li></ul>
## Add Multiplex SAT rules for mDNS in both directions
<div class="panel ml-2"><img src="/assets/img/question.svg"/> <em>Can you use interface groups to make it a single rule?</em>

Yes, it'll work, but unfortunately the firewall <u>will also duplicate the packet back</u> out the interface it came from, which is <u>possibly dangerous</u> if there is another unit doing the same.

</div>
As you see in the packet traces, mDNS responses do not arrive to the IP address that sent the query. They are sent out to the multicast address.

Therefore, mDNS multicasts have to be separately **allowed in both directions**.

<img src="sat-multiplex-rule.png" class="border shadow"/>

... and of course **one more in the opposite direction**.

<div class="panel ml-2"><span><img src="/assets/img/information.svg"/> Technically, the firewall defaults to adding a route for 224.0.0.0/4 to "core" so you <em>could</em> also set the destination interface to "core". </span></div>
<span>Note the "Destination: any" in the filter - it does not make sense to filter according to the routing table here.</span>


## Add rule for Internet Printing Protocol
This is entirely straightforward.

Allow traffic to the printer's IP address, TCP port 631.


## Double check TTL setting
In case a unit sends mDNS packets with IP TTL=1, we may want to make sure we don't decrement it to 0 and drop it.

There may also be mDNS clients that check for TTL still being 255 on receipt, i.e. that the packet didn't traverse a network boundary.

Either way, it's a good idea to make sure that TTL is left untouched:

<img src="decrement-ttl-off.png" class="border shadow" style="height: 250px;"/>


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

<img src="/assets/img/warning.svg"/> If you find an mDNS that implementation refuses to cross the firewall boundary, you may have to renumber your IP ranges to match.

Microsoft's mDNS implementation for instance, _may_ give you problems via Windows Defender Firewall. But here you can simply re-configure the rules.

<img src="image2019-10-23_12-9-27.png" class="border shadow" style="width: 800px;"/>


## Test it!
<img src="mdns-scan-console-screenshot.png" class="border shadow"/>


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "multicast" or tags contains "print" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}