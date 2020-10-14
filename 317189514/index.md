---
confluence-id: '317189514'
date: '2020-09-07T17:01:55.000+02:00'
excerpt: There are useful command line options for the InControl client and server,
  e.g. for getting more console output, or to provide login details.
last_modified_at: '2020-09-07T17:01:55.000+02:00'
layout: article
orig-title: InControl command-line options
orig-title-slugified: incontrol-command-line-options
permalink: /317189514/incontrol-command-line-options
properties:
- - Up to date for
  - - InControl 1.40.06
- - Status
  - - DRAFT
published: 'true'
redirect_from:
- /317189514/
slug: '317189514'
tags: incontrol
title: InControl command-line options
toc: false
version: 5
---

## Note
The use of the flag signs** '/'** and** '-'** are interchangeable when giving these command-line options.

## InControl Server (ICS.exe)
These options can be added when starting ICS.exe from a command-line.

<ul><li>**-help** or **-?** 
Will not start ICS and will instead show the available command-line options in the console.</li></ul><ul><li>**-debug** 

Start the server as a console application instead of a service and output information into the console. Useful for finding roots to problems post-deployment.

</li><li>**-install** 

</li></ul><ul><li>**-uninstall** 

</li></ul>## InControl Client (ICC.exe)
Adding any options can be done by locating the executable in the Windows Start menu, right clicking it and then selecting Properties to edit the _Target_ for the executable and add the options to the end of it. Alternatively, a console could be opened and the command could then be entered with the desired options.

<ul><li> **-AuthenticationMethod **
Possible values: **MSDomain**, **Auto** (the default) or **Internal**.</li><li>**-Host** 

Host IP or URL to the server.

</li><li>**-Port**

</li><li>**-Username**

</li><li>**-Password**</li><li>**-MSDomainType **

</li></ul>**And new options that are to be added in InControl version 1.40.06 to the client:**

<ul><li>**-help** or **-?** 
Will not start ICC and will instead just show available command-line options in the console.</li></ul><ul><li>**-debug [verbosity] [filename]**
Can't be used in combination with the other command-line options. Verbosity and filename are optional arguments.
Verbosity can be an integer between 0 and 15 and defaults to 5 where 15 is the highest verbosity. If no filename is specified then the debug information will be output into the console instead.
Useful for finding roots to problems post-deployment. 

</li></ul><ac:task-list>
<ac:task>
<ac:task-id>2</ac:task-id>
<ac:task-status>incomplete</ac:task-status>
<ac:task-body>What do we do with this old line? "Read the Wiki page <ac:link><ri:page ri:space-key="ICC" ri:content-title="DebugPrint (DP)"/></ac:link> for more information on how to use the updated DebugPrint functionality for the InControl Client and how to make it more useful. "</ac:task-body>
</ac:task>
</ac:task-list>