# TPL
## 事务

-   一个事务，是由多个dml语句组成
-   事务具有不可分割性，要么完成（commit），要么同时撤销（rollback）
-   事务特性
    1.原子性：组成事务的DML语句是不可分割的
    2.一致性：语句要么同时完成，要么同时不完成
    3.隔离性：不同事务之间不能相互影响
    4.持久性：事务被提交后，结果存入数据库

```sql
update emp1
set sal=sal+200
where ename='hehe';

update emp1
set sal=sal -200
where ename='SMITH';
```
## 锁
DML操作时，默认为操作枷锁（行锁），其他用户不能进行修改
Question：后台代码执行完DML语句后无任何效果---行加锁

commit
rollback
