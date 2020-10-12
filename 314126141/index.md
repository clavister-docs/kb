---
confluence-id: '314126141'
date: '2020-09-08T00:29:17.000+02:00'
excerpt: IKE specifications are fuzzy in places. Some vendors sometimes choose to
  do things a little differently, and frankly we can't blame them - there's no way
  to say for sure who's right and wrong. All we can do is document the differences.Fortigate,
  when an IKE SA is configured with multiple networks, seems to treat them like "this
  SA negotiation should cover all networks in a single negotiation". Most others treat
  it like everything else in a proposal - pick the option that we prefer.
last_modified_at: '2020-09-08T00:29:17.000+02:00'
layout: article
orig-title: Behavior of multiple traffic selectors in IKE negotiations - differences
  in Fortigate vs Clavister,Juniper,Cisco
orig-title-slugified: behavior-of-multiple-traffic-selectors-in-ike-negotiations---differences-in-fortigate-vs-clavister-juniper-cisco
permalink: /314126141/behavior-of-multiple-traffic-selectors-in-ike-negotiations---differences-in-fortigate-vs-clavister-juniper-cisco
properties:
- - Up to date for
  - - Core 13.00.00
    - Fortigate N.NN
- - Status
  - - OK
published: 'true'
redirect_from:
- /314126141/
slug: '314126141'
tags: kb kbcore kbipsec kbikev2 kbike kbfortigate
title: Behavior of multiple traffic selectors in IKE negotiations - differences in
  Fortigate vs Clavister,Juniper,Cisco
toc: true
version: 4
---

# Example negotiation from a Fortigate
<ac:structured-macro ac:name="jira" ac:schema-version="1" ac:macro-id="d8717671-3aa6-4368-8806-8556b282b593"><ac:parameter ac:name="server">Clavister JIRA</ac:parameter><ac:parameter ac:name="columns">key,summary,type,created,updated,due,assignee,reporter,priority,status,resolution</ac:parameter><ac:parameter ac:name="serverId">3aa38841-2d2f-3a6e-862d-31e643fb0cf1</ac:parameter><ac:parameter ac:name="key">TIC-29771</ac:parameter></ac:structured-macro>

Example: Fortigate is configured with 6 networks as its local traffic selector.

User (perhaps reasonably) expects this to result in a VPN tunnel allowing 6 networks.

The Clavister IPsec implementation, as initiator, would handle this by negotiating 6 SAs.

Fortigate however attempts to negotiate all 6 selectors in one SA.

<table class="wrapped"><colgroup> <col/> <col/> </colgroup><tbody><tr><th>Fortigate (initiator)</th><th>Clavister (responder)</th></tr><tr><td><pre>    TSi (Traffic Selector - Initiator)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.84.0-192.168.84.255
    TSr (Traffic Selector - Responder)
      Traffic selector 1/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.0.0-10.0.0.255
      Traffic selector 2/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.150.0-192.168.150.255
      Traffic selector 3/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.1.0.0-10.1.1.255
      Traffic selector 4/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.73.0-10.0.73.255
      Traffic selector 5/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.2.0-10.0.2.255
      Traffic selector 6/6
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.22.2.0-10.22.2.255
              </pre></td><td><pre>    TSi (Traffic Selector - Initiator)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 192.168.84.0-192.168.84.255
    TSr (Traffic Selector - Responder)
      Traffic selector 1/1
        IP protocol  : 0
        Port range   : 0-0
        Address range: 10.0.2.0-10.0.2.255
            </pre></td></tr></tbody></table># Problem: the behavior is undefined according to RFC
<a href="https://tools.ietf.org/html/rfc5996">https://tools.ietf.org/html/rfc5996</a> talks about multiple traffic selectors using 2 examples:

As a way of handling units being reconfigured / moved:

<blockquote>"This could happen when the configurations of the two endpoints are being updated but only one end has received the new information."

</blockquote>When the initiator does not know the granularity of the responder, i.e. per port/proto or net:

<blockquote>"In the example, the initiator would include in TSi two Traffic Selectors: the first containing the address range (198.51.100.43 - 198.51.100.43) and the source port and IP protocol from the packet and the second containing (198.51.100.0 - 198.51.100.255) with all ports and IP protocols.

</blockquote>So, the Clavister IPsec implementation picks the selector that it "prefers" from the provided list. In the example above, all networks are equally wide = there is no real preference.




# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% if article.tags contains "kbipsec" or article.tags contains "kbikev2" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}