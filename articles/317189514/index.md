---
confluence-id: '317189514'
date: '2020-09-07T17:01:55.000+02:00'
last_modified_at: '2020-09-07T17:01:55.000+02:00'
layout: article
orig-title: InControl command-line options
orig-title-slugified: incontrol-command-line-options
permalink: /317189514/
published: 'true'
slug: '317189514'
tags: kb kbincontrol
title: InControl command-line options
version: 5
---

<div class="contentLayout2">
<div class="columnLayout two-equal" data-layout="two-equal">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="excerpt" data-macro-id="f1799f1b-1fea-483c-b960-d01d117d72db" data-macro-parameters="atlassian-macro-output-type=INLINE" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2V4Y2VycHQ6YXRsYXNzaWFuLW1hY3JvLW91dHB1dC10eXBlPUlOTElORX0&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><p>There are useful command line options for the InControl client and server, e.g. for getting more console output, or to provide login details.</p></td></tr></table>
</div>
</div>
<div class="cell normal" data-type="normal">
<div class="innerCell">
<table class="wysiwyg-macro" data-macro-name="details" data-macro-id="c6af50fb-7ab7-4aec-9cb1-89f56fb6ba52" data-macro-schema-version="1" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2RldGFpbHN9&amp;locale=en_GB&amp;version=2); background-repeat: no-repeat;" data-macro-body-type="RICH_TEXT"><tr><td class="wysiwyg-macro-body"><table class="wrapped confluenceTable">
<colgroup>
<col>
<col>
</colgroup>
<tbody>
<tr>
<td class="confluenceTd">Up to date for</td>
<td class="confluenceTd">InControl 1.40.06</td>
</tr>
<tr>
<td colspan="1" class="confluenceTd">Status</td>
<td colspan="1" class="confluenceTd"><div class="content-wrapper"><p><img class="editor-inline-macro" height="18" width="88" src="/plugins/servlet/status-macro/placeholder?title=DRAFT&amp;colour=Yellow" data-macro-name="status" data-macro-id="010f216c-9116-4e10-a4b4-0d5123150336" data-macro-parameters="colour=Yellow|title=DRAFT" data-macro-schema-version="1"></p></div></td>
</tr>
</tbody>
</table></td></tr></table>
</div>
</div>
</div>
<div class="columnLayout single" data-layout="single">
<div class="cell normal" data-type="normal">
<div class="innerCell">
<h2>Note</h2>
<p>The use of the flag signs<strong> '/'</strong> and<strong> '-'</strong> are interchangeable when giving these command-line options.</p>
<h2>InControl Server (ICS.exe)</h2>
<p>These options can be added when starting ICS.exe from a command-line.</p>
<ul><li>
<strong>-help</strong> or <strong>-?</strong> <br>Will not start ICS and will instead show the available command-line options in the console.</li></ul>
<ul>
<li>
<p><strong>-debug</strong> </p>
<p>Start the server as a console application instead of a service and output information into the console. Useful for finding roots to problems post-deployment.</p>
</li>
<li><p><strong>-install</strong> </p></li>
</ul>
<ul><li><p><strong>-uninstall</strong> </p></li></ul>
<h2>InControl Client (ICC.exe)</h2>
<p>Adding any options can be done by locating the executable in the Windows Start menu, right clicking it and then selecting Properties to edit the <em>Target</em> for the executable and add the options to the end of it. Alternatively, a console could be opened and the command could then be entered with the desired options.</p>
<ul>
<li> <strong>-AuthenticationMethod </strong><br>Possible values: <strong>MSDomain</strong>, <strong>Auto</strong> (the default) or <strong>Internal</strong>.</li>
<li>
<p class="_mce_tagged_br"><strong>-Host</strong> </p>
<p class="_mce_tagged_br">Host IP or URL to the server.</p>
</li>
<li><p class="_mce_tagged_br"><strong>-Port</strong></p></li>
<li><p class="_mce_tagged_br"><strong>-Username</strong></p></li>
<li><strong>-Password</strong></li>
<li><p class="_mce_tagged_br"><strong>-MSDomainType </strong></p></li>
</ul>
<p><strong>And new options that are to be added in InControl version 1.40.06 to the client:</strong></p>
<ul><li>
<strong>-help</strong> or <strong>-?</strong> <br>Will not start ICC and will instead just show available command-line options in the console.</li></ul>
<ul><li>
<strong>-debug [verbosity] [filename]</strong><br>Can't be used in combination with the other command-line options. Verbosity and filename are optional arguments.<br>Verbosity can be an integer between 0 and 15 and defaults to 5 where 15 is the highest verbosity. If no filename is specified then the debug information will be output into the console instead.<br>Useful for finding roots to problems post-deployment. <br><br>
</li></ul>
<ul class="inline-task-list" data-inline-tasks-content-id="317189514"><li data-inline-task-id="2">What do we do with this old line? "Read the Wiki page <a class="confluence-link" href="/pages/viewpage.action?pageId=16092154" data-linked-resource-id="16092154" data-linked-resource-version="1" data-linked-resource-type="page" data-linked-resource-default-alias="DebugPrint (DP)" data-base-url="http://wiki.clavister.com">DebugPrint (DP)</a> for more information on how to use the updated DebugPrint functionality for the InControl Client and how to make it more useful. "</li></ul>
</div>
</div>
</div>
</div>