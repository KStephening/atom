# hr 环境下的 用户名hr，密码hr
如何解锁用户
1. 用管理员用户登录 sys（权限最高）密码sys sysdba身份
2. 通过指令解锁hr用户
```sql
alter user hr identified by hr;--设置hr用户hr密码
alter user hr account unlock;--结果hr用户
```
3.点击钥匙，登录hr账户
