---
title: "通过Docker运行MongoDB"
date: 2018-04-04T05:11:11+08:00
subtitle: ""
topics: []
tags: [mongodb, docker, linux]
---


## 运行

### 启动mongo实例
```bash
$ docker run --name some-mongo -d mongo
```

### 连接测试
```bash
$ docker run -it --link some-mongo:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'

MongoDB shell version v3.6.3
connecting to: mongodb://172.17.0.2:27017/test
MongoDB server version: 3.6.3
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
	http://docs.mongodb.org/
Questions? Try the support group
	http://groups.google.com/group/mongodb-user
Server has startup warnings:
2018-04-03T17:21:51.315+0000 I STORAGE  [initandlisten]
2018-04-03T17:21:51.315+0000 I STORAGE  [initandlisten] ** WARNING: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine
2018-04-03T17:21:51.315+0000 I STORAGE  [initandlisten] **          See http://dochub.mongodb.org/core/prodnotes-filesystem
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten]
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten]
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten]
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten]
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2018-04-03T17:21:52.516+0000 I CONTROL  [initandlisten]
>
```

## 配置

#### 启动配置
```
$ docker run --name some-mongo -p 27017:27017 -v /mongodb_storage_path:/data/db -v /mongodb_config_path:/data/configdb -d mongo --auth
4e72f6cf3dacef57659632b6701bf58c2901c8b8f6afea82cf72569a1831768b
```
| 参数                                   | 说明             |
| :---                                   | :---             |
| --name                                 | 指定运行名称     |
| -p 27017:27017                         | 指定映射端口     |
| -v /mongodb_storage_path:/data/db      | 指定数据存储路径 |
| -v /mongodb_config_path:/data/configdb | 指定配置文件路径 |
| --auth                                 | 开启权限验证模式 |

#### 检查运行状态
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
4e72f6cf3dac        mongo               "docker-entrypoint.s…"   13 minutes ago      Up 13 minutes       0.0.0.0:27017->27017/tcp   some-mongo
```

#### 添加初始管理员账号
```
$ docker exec -it some-mongo mongo admin
> db.createUser({
... user: '<username>',
... pwd: '<password>',
... roles: [{
... role: "userAdminAnyDatabase",
... db: "admin"}]
... });
Successfully added user: {
	"user" : "<username>",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
```

#### 测试用户名/密码连接
```
$ docker run -it --rm --link some-mongo:mongo mongo mongo -u jsmith -p some-initial-password --authenticationDatabase admin some-mongo/some-db
MongoDB shell version v3.6.3
connecting to: mongodb://some-mongo:27017/some-db
MongoDB server version: 3.6.3
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
	http://docs.mongodb.org/
Questions? Try the support group
	http://groups.google.com/group/mongodb-user
2018-04-03T18:31:41.558+0000 I STORAGE  [main] In File::open(), ::open for '/home/mongodb/.mongorc.js' failed with No such file or directory
> db.getName();
some-db
>
```

## 其它

#### 进入容器
```bash
# 进入mongo容器，其中‘some-mongo’是mongo容器别名
docker exec -it some-mongo bash
# 启动mongo服务
mongod &
# 在容器中查看mongo进程
ps -ef | grep mongo
```

#### 停止
```bash
$ docker stop some-mongo
```

#### 启动
```bash
$ docker start some-mongo
```

#### 删除
```bash
$ docker rm some-mongo
```

#### 开放端口
```bash
# Ubuntu 12.04 or later
$ sudo ufw allow 27017
$ sudo ufw reload
Firewall reloaded
```
