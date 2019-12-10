+++
title = "zpool status: too many errors"
date = "2018-11-01T16:48:47+08:00"
draft = false
tags = ["linux","zfs"]
topics = []
description = ""
+++

## CHECK THE CABLE AND POWER

## CHECK THE STATUS OF THE SPECIFIC DISK

```bash
smartctl -a /dev/sde
```

## Clear

```bash
zpool clear tank
```

## SCRUB AT LEAST ONCE PER MONTH

```bash
zpool scrub tank #stop scrubbing: zpool scrub -s tank
```

## CHECK STATUS

```bash
zpool status -v
```






