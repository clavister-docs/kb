---
confluence-id: '317174827'
date: '2020-11-10T11:22:33.000+01:00'
excerpt: In most cases customers want to send logs to a external server instead of
  relaying on text files found on the server it self. Here is how you do that in EasyAccess.
last_modified_at: '2020-11-10T11:22:33.000+01:00'
layout: article
orig-title: Send logs to InCenter or external syslog receiver.
orig-title-slugified: send-logs-to-incenter-or-external-syslog-receiver-
permalink: /317174827/send-logs-to-incenter-or-external-syslog-receiver-
properties:
- - Up to date for
  - - EasyAccess 3.0+
- - Status
  - - OK
published: 'true'
redirect_from:
- /317174827/
slug: '317174827'
tags: changeme
title: Send logs to InCenter or external syslog receiver.
toc: true
version: 6
---


# Modify log4j2.xml
All we really need to do is to modify the log4j2.xml file found in /opt/EasyAccess/Server/config or C:/program files/EasyAccess/Server/config:

<ac:structured-macro><ac:parameter>RDark</ac:parameter><ac:parameter>log4j2.xml</ac:parameter><ac:plain-text-body>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!--
  ~ Copyright (c) 2015 PhenixID AB (http://phenixid.net) - All Rights Reserved
  ~
  ~  Proprietary and confidential
  ~
  ~  Unauthorized copying and distribution of this file (via any medium) is strictly prohibited
  ~
  ~  For more information please contact: info@phenixid.se
  --&gt;

&lt;Configuration monitorInterval="30"&gt;
    &lt;Appenders&gt;
        &lt;Console name="CONSOLE" target="SYSTEM_OUT"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
        &lt;/Console&gt;
        &lt;RollingFile
                name="FILE"
                fileName="logs/server.log"
                filePattern="logs/server.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
        &lt;RollingFile
                name="EVENT"
                fileName="logs/event.log"
                filePattern="logs/event.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
    &lt;/Appenders&gt;
    &lt;Loggers&gt;
        &lt;AsyncLogger name="com.phenixidentity" level="DEBUG"/&gt;
        &lt;AsyncLogger name="io.netty" level="WARN"/&gt;
        &lt;AsyncLogger name="com.hazelcast" level="WARN"/&gt;
        &lt;AsyncLogger name="org.vertx" level="WARN"/&gt;
        &lt;AsyncLogger name="com.orientechnologies" level="WARN"/&gt;
        &lt;Logger name="EVENT" level="INFO" additivity="false"&gt;
            &lt;AppenderRef ref="EVENT"/&gt;
        &lt;/Logger&gt;
        &lt;Root level="WARN"&gt;
            &lt;AppenderRef ref="FILE"/&gt;
        &lt;/Root&gt;
    &lt;/Loggers&gt;
&lt;/Configuration&gt;

</ac:plain-text-body></ac:structured-macro>Change to:

<ac:structured-macro><ac:parameter>RDark</ac:parameter><ac:parameter>log4j2.xml</ac:parameter><ac:plain-text-body>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!--
  ~ Copyright (c) 2015 PhenixID AB (http://phenixid.net) - All Rights Reserved
  ~
  ~  Proprietary and confidential
  ~
  ~  Unauthorized copying and distribution of this file (via any medium) is strictly prohibited
  ~
  ~  For more information please contact: info@phenixid.se
  --&gt;

&lt;Configuration monitorInterval="30"&gt;
    &lt;Appenders&gt;
        &lt;Console name="CONSOLE" target="SYSTEM_OUT"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
        &lt;/Console&gt;
        &lt;RollingFile
                name="FILE"
                fileName="logs/server.log"
                filePattern="logs/server.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
        &lt;RollingFile
                name="EVENT"
                fileName="logs/event.log"
                filePattern="logs/event.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
        &lt;Syslog
    		name="CEF"
    		host="1.1.1.1" 
    		port="514"
    		protocol="UDP"&gt;
            facility="LOCAL7"
        &lt;/Syslog&gt;
    &lt;/Appenders&gt;
    &lt;Loggers&gt;
        &lt;AsyncLogger name="com.phenixidentity" level="DEBUG"/&gt;
        &lt;AsyncLogger name="io.netty" level="WARN"/&gt;
        &lt;AsyncLogger name="com.hazelcast" level="WARN"/&gt;
        &lt;AsyncLogger name="org.vertx" level="WARN"/&gt;
        &lt;AsyncLogger name="com.orientechnologies" level="WARN"/&gt;
        &lt;Logger name="EVENT" level="INFO" additivity="false"&gt;
            &lt;AppenderRef ref="EVENT"/&gt;
            &lt;AppenderRef ref="CEF"/&gt;
        &lt;/Logger&gt;
        &lt;Root level="WARN"&gt;
            &lt;AppenderRef ref="FILE"/&gt;
        &lt;/Root&gt;
    &lt;/Loggers&gt;
&lt;/Configuration&gt;

</ac:plain-text-body></ac:structured-macro>
# Send logs to InCenter
For InCenter there are some more stuff that we need to change as well, first modify log4j2.xml to look like this:

<ac:structured-macro><ac:parameter>RDark</ac:parameter><ac:parameter>log4j2.xml</ac:parameter><ac:plain-text-body>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!--
  ~ Copyright (c) 2015 PhenixID AB (http://phenixid.net) - All Rights Reserved
  ~
  ~  Proprietary and confidential
  ~
  ~  Unauthorized copying and distribution of this file (via any medium) is strictly prohibited
  ~
  ~  For more information please contact: info@phenixid.se
  --&gt;

&lt;Configuration monitorInterval="30"&gt;
    &lt;Appenders&gt;
        &lt;Console name="CONSOLE" target="SYSTEM_OUT"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
        &lt;/Console&gt;
        &lt;RollingFile
                name="FILE"
                fileName="logs/server.log"
                filePattern="logs/server.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
        &lt;RollingFile
                name="EVENT"
                fileName="logs/event.log"
                filePattern="logs/event.%date{yyyy-MM-dd}.log"
                append="true"&gt;
            &lt;PatternLayout pattern="%d [%c{1}]  %p: %m%n"/&gt;
            &lt;Policies&gt;
                &lt;TimeBasedTriggeringPolicy interval="1"/&gt;
            &lt;/Policies&gt;
        &lt;/RollingFile&gt;
        &lt;Syslog
    		name="CEF"
    		host="1.1.1.1" 
    		port="514"
    		protocol="UDP"&gt;
		&lt;PatternLayout&gt;
        	&lt;Pattern&gt;%m%n&lt;/Pattern&gt;
        &lt;/PatternLayout&gt;
        &lt;/Syslog&gt;
    &lt;/Appenders&gt;
    &lt;Loggers&gt;
        &lt;AsyncLogger name="com.phenixidentity" level="DEBUG"/&gt;
        &lt;AsyncLogger name="io.netty" level="WARN"/&gt;
        &lt;AsyncLogger name="com.hazelcast" level="WARN"/&gt;
        &lt;AsyncLogger name="org.vertx" level="WARN"/&gt;
        &lt;AsyncLogger name="com.orientechnologies" level="WARN"/&gt;
        &lt;Logger name="EVENT" level="INFO" additivity="false"&gt;
            &lt;AppenderRef ref="EVENT"/&gt;
            &lt;AppenderRef ref="CEF"/&gt;
        &lt;/Logger&gt;
        &lt;Root level="WARN"&gt;
            &lt;AppenderRef ref="FILE"/&gt;
        &lt;/Root&gt;
    &lt;/Loggers&gt;
&lt;/Configuration&gt;

</ac:plain-text-body></ac:structured-macro>Next we need to modify add the following line to /opt/EasyAccess/Server/binstart-PhenixID.sh  or  C:/program files/EasyAccess/Server/bin/EasyAccess vmotion file:

<table class="wrapped"><colgroup><col/></colgroup><tbody><tr><td><code class="cpp plain">JAVA_OPTS=</code><code class="cpp string">"${JAVA_OPTS} -Dcom.phenixidentity.globals.datetimepattern=yyyy-MM-dd'T'HH:mm:ssXXX"</code></td></tr></tbody></table>This will require a reboot to take affect.


# Additional information on log4j framework:
<a href="http://document.phenixid.net/m/84614/l/1020157-edit-log-settings">http://document.phenixid.net/m/84614/l/1020157-edit-log-settings</a>

<a href="https://logging.apache.org/log4j/2.x/">https://logging.apache.org/log4j/2.x/</a>


# Related articles
{% assign list = "" | split:"" %}
{% assign articles = site.pages | where: "layout", "article" | where_exp: "item", "item.slug != page.slug" %}
{% for article in articles %}
{% assign tags = article.tags | split: " " %}
{% if tags contains "easyaccess" or tags contains "incenter" %}
{% assign list = list | push: article %}
{% endif %}
{% endfor %}
{% assign list = list | uniq %}
{% include listrelated.html articles = list %}