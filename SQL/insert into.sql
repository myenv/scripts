-- 抽取并插入
SELECT * into dbo.Wares_test FROM dbo.Wares WHERE PublishDate >= '2015-03-10 00:00:00'

-- 统计行数
select COUNT(*) from dbo.Wares_test
select COUNT(*) from dbo.Wares
SELECT COUNT(*) FROM dbo.Wares WHERE PublishDate >= '2015-03-10 00:00:00'


-------------详解-------------------
-- 语句形式为：
 Insert into Table2(field1,field2,...) select value1,value2,... from Table1
-- 要求目标表Table2必须存在，由于目标表Table2已经存在，所以我们除了插入源表Table1的字段外，还可以插入常量。
-- 例如:
 --1.创建测试表
    create TABLE Table1
    (
        a varchar(10),
        b varchar(10),
        c varchar(10),
        CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED
        (
            a ASC
        )
    ) ON [PRIMARY]

    create TABLE Table2
    (
        a varchar(10),
        c varchar(10),
        d int,
        CONSTRAINT [PK_Table2] PRIMARY KEY CLUSTERED
        (
            a ASC
        )
    ) ON [PRIMARY]
    GO
    --2.创建测试数据
    Insert into Table1 values('赵','asds','90')
    Insert into Table1 values('钱','asds','100')
    Insert into Table1 values('孙','asds','80')
    Insert into Table1 values('李','asds',null)
    GO
    select * from Table2

    --3.INSERT INTO SELECT语句复制表数据
    Insert into Table2(a, c, d) select a,c,5 from Table1
    GO

    --4.显示更新后的结果
    select * from Table2
    GO
    --5.删除测试表
    drop TABLE Table1
    drop TABLE Table2

-- 语句形式为：
SELECT vale1, value2 into Table2 from Table1
-- 要求目标表Table2不存在，因为在插入时会自动创建表Table2，并将Table1中指定字段数据复制到Table2中。
-- 示例如下：
 --1.创建测试表
    create TABLE Table1
    (
        a varchar(10),
        b varchar(10),
        c varchar(10),
        CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED
        (
            a ASC
        )
    ) ON [PRIMARY]
    GO

    --2.创建测试数据
    Insert into Table1 values('赵','asds','90')
    Insert into Table1 values('钱','asds','100')
    Insert into Table1 values('孙','asds','80')
    Insert into Table1 values('李','asds',null)
    GO

    --3.SELECT INTO FROM语句创建表Table2并复制数据
    select a,c INTO Table2 from Table1
    GO

    --4.显示更新后的结果
    select * from Table2
    GO
    --5.删除测试表
    drop TABLE Table1
    drop TABLE Table2