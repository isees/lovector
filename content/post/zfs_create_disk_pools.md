+++
title = "ZFS - CREATE DISK POOLS"
<<<<<<< HEAD
date = "2019-08-07T19:46:29+08:01"
=======
date = "2019-08-07T19:46:29+08:00"
>>>>>>> 599416367886fa7fb840ac8b591bbc7849e6cb99
draft = false
tags = ["zfs", "raid", "ubuntu"]
topics = []
description = ""
+++

This tutorial will cover how to create pools with different RAID levels.

-   singular/basic (no RAID)
-   raidz
-   raidz2
-   raid 0
-   raid 10

Creating the pools by specifying disks like `/dev/sda` and `/dev/sdb` is somewhat dangerous. Your pool could become degraded or disappear if you plug in another drive and all the letters change. To remedy this, use paths with `/dev/disk/by-id/...` instead.

Also, if your pool does become degraded because of the situation described above, running those export/import commands will fix the situation, even if you have already written data since the pool became degraded.

```bash
sudo zpool export [my pool name]
sudo zpool import -d [my pool name]
```

## Single Disk (No RAID)

```bash
sudo zpool create -f [new pool name] /dev/disk/by-id/ata-TOSHIBA_DT01ACA300_37U9AR2AS
```

* * *

**NOTE**

The -f prevents the error message from preventing the creation. Be careful when using this as you could overwrite existing pools/partitions.

* * *

## Multiple Disk (RAID 0)

```bash
sudo zpool create -f [new pool name] /dev/disk/by-id/ata-TOSHIBA_DT01ACA300_37U9AR2AS /dev/disk/by-id/ata-TOSHIBA_DT01ACA300_37U9DSYAS
```

## Adding Drives

```bash
sudo zpool add [existing pool name] /dev/sdd
```

## Raid 1

To create a RAID1 pool (or mirror), simply add the command mirror when creating or adding drives. For example:

```bash
sudo zpool create  -f [new pool name] mirror /dev/sdb /dev/sdc
```

```bash
sudo zpool add [existing pool name] mirror /dev/sdd /dev/sde
```

## RAID 10

```bash
sudo zpool create [pool name] \
  mirror disk1 disk2 \
  mirror disk3 disk4
```

The output of sudo zpool status would show:

```bash
pool: myPool
 state: ONLINE
  scan: none requested
config:

        NAME        STATE     READ WRITE CKSUM
        myPool      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
            sdb     ONLINE       0     0     0
            sdc     ONLINE       0     0     0
          mirror-1  ONLINE       0     0     0
            sdd     ONLINE       0     0     0
            sde     ONLINE       0     0     0
```

## RAID Z (RAID 5)

```bash
sudo zpool create -f [pool name] raidz /dev/sdb /dev/sdc /dev/sdd
```

```bash
sudo zpool add -f [pool name] /dev/sde
```

```bash
pool: poolz
 state: ONLINE
  scan: none requested
config:

        NAME        STATE     READ WRITE CKSUM
        poolz       ONLINE       0     0     0
          raidz1-0  ONLINE       0     0     0
            sdb     ONLINE       0     0     0
            sdc     ONLINE       0     0     0
            sdd     ONLINE       0     0     0
            sde     ONLINE       0     0     0
```

## RAIDz2

```bash
sudo zpool create -f [pool name] raidz2 /dev/sdb /dev/sdc /dev/sdd
```

* * *

**NOTE**

You need a minimum of 3 drives

* * *

## RAIDz3

```bash
sudo zpool create -f [pool name] raidz3 /dev/sdb /dev/sdc /dev/sdd /dev/sde
```

## Destroying Pools

```bash
sudo zpool destroy [pool name]
```

## References

-   [ZFS - Create Disk Pools](http://blog.programster.org/zfs-create-disk-pools)
-   [HowTo : Create RAIDZ Zpool](http://www.zfsbuild.com/2010/06/03/howto-create-raidz-zpool/)
-   [Setting Up raid10 (Striped Mirror) ZFS on Ubuntu](http://elza.me/blog/2015/06/ZFS/)
-   [Oracle ZFS Documentation](https://docs.oracle.com/cd/E19253-01/819-5461/gaynr/index.html)
