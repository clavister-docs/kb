---
confluence-id: '314125764'
date: '2020-11-07T00:40:08.000+01:00'
excerpt: Sometimes you wan to get rid of the password requirement when using Onetouch
  as "strong" authentication. We will cover RADIUS Authentication and SAML in this
  article but this is also possible to do for Internal Authentication (Selfservice,
  WebUi etc.) and OIDC.This KB article assumes that you have the base scenario setup
  for OneTouch Authentication.
last_modified_at: '2020-11-07T00:40:08.000+01:00'
layout: article
orig-title: How to configure passwordless Onetouch authentication
orig-title-slugified: how-to-configure-passwordless-onetouch-authentication
permalink: /314125764/how-to-configure-passwordless-onetouch-authentication
properties:
- - Up to date for
  - - Easyaccess 3.0
- - Status
  - - OK
published: 'true'
redirect_from:
- /314125764/
slug: '314125764'
tags: changeme
title: How to configure passwordless Onetouch authentication
toc: true
version: 4
---


# SAML Authentication
For SAML authentication we need to change the authenticator used to be SAMLUidOneTouch. Login to the WebUI and go to the advance tab, click on the pen besides Authentication - HTTP:

<img src="image2020-1-8_9-16-5.png" style="height: 121px;"/>

Find your SAML authenticator:

<img src="image2020-1-8_9-16-49.png" style="height: 250px;"/>

Change the name value to SAMLUidOneTouch, stage changes and commit.

<img src="image2020-1-8_9-17-53.png" style="height: 250px;"/>

Next we need to remove some Valves from the execution flow since we still expect a password but there is no way for the user to enter a password. Go to Scenarios → Federation and click on your Username, Password and OneTouch scenario. Go to the Execution Flow tab. Delete the InputParameterExistValve and the LDAPBindValve. Click save.

<img src="image2020-1-8_9-19-9.png" style="height: 250px;"/>

We are now done the user will now see the following page when surfing to the authenticator URL:

<img src="image2020-1-8_9-30-43.png" style="height: 250px;"/>


# Radius Authentication
With RADIUS authentication it will be different we can't control client it self that connects, for example the OneConnect client (at the moment) will always show the password field even though we do this change on the EasyAccess server. The only thing we need to do here is to remove the LDAPBindValve from the Execution flow on the normal Username, Password and OneTouch RADIUS scenario.

Go to Scenarios → RADIUS and click on the Username, Password and OneTouch scenario. Go to the Execution Flow tab and delete the LDAPBindValve:

<img src="image2020-1-8_9-37-48.png" style="height: 250px;"/>

Click save. The users will now be able to login without password.


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "easyaccess" or tags contains "sso" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}