+++
title = "Mv after find"
date = "2018-10-21T17:27:15+08:00"
draft = false
tags = ["linux","search"]
topics = []
description = ""
+++

```bash
find path_A -name '*AAA*' -exec mv -t path_B {} +
```

That will use find's -exec option which replaces the {} with each find result in turn and runs the command you give it. As explained in man find:

```
-exec command ;

Execute  command;  true  if 0 status is returned.  All following
arguments to find are taken to be arguments to the command until
an  argument  consisting of ';' is encountered.  

```

In this case, we are using the + version of -exec so that we run as few mv operations as possible:

```
-exec command {} +

This  variant  of the -exec action runs the specified command on
the selected files, but the command line is built  by  appending
each  selected file name at the end; the total number of invoca‐
tions of the command will  be  much  less  than  the  number  of
matched  files.   The command line is built in much the same way
that xargs builds its command lines.  Only one instance of  '{}'
is  allowed  within the command.  The command is executed in the
starting directory.

```					
