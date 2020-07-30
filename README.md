# 家庭财务报表系统

## 1.本地开发文档

### 开发环境
在本地配置开发环境如下：

* Ruby version

  ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]

* System dependencies

  Rails 6.0.3.2

* 从Gemfile中安装依赖

  ` ➜  family_financial_management git:(master) ✗ bundle install`


### 数据结构和逻辑

* 收入模型

模型：

`➜  family_financial_management git:(master) ✗ rails generate model Income income_type:string value:decimal subtype:string detail:string credit_day:datetime user:references`

`➜  family_financial_management git:(master) ✗ rails generate model IncomeType income_type:string`

`➜  family_financial_management git:(master) ✗ rails generate model IncomeSubType subtype:string income_type:references`

控制器和视图：

`➜  family_financial_management git:(master) ✗ rails generate controller Incomes `


* 支出模型

创建模型：

`➜  family_financial_management git:(master) ✗ rails generate model Expense expense_type:string value:decimal subtype:string detailtype:string credit_day:datetime user:references`
`➜  family_financial_management git:(master) ✗ rails generate model ExpenseType expense_type:string`
`➜  family_financial_management git:(master) ✗ rails generate model ExpenseSubType subtype:string expense_type:references`
`➜  family_financial_management git:(master) ✗ rails generate model ExpenseLeafType leaftype:string expense_sub_type:references`

控制器和视图：
`➜  family_financial_management git:(master) ✗ rails generate controller Expenses`

### 数据库配置

为了后续在heroku部署生产，开发阶段丢弃sqlite3数据库，改用postgresql数据库

* 安装ruby的pg扩展
  `gem 'pg'`
  `bundle install`

* database.yml配置

* Database creation

  rails db:create

* Database initialization

  rails db:migrate


### 收入支出类别数据导入（用于创建级联列表）

收入类型数据表构建：
```
  -- SQLite
INSERT INTO income_types ( income_type)
VALUES ( '薪酬');

INSERT INTO income_types ( income_type)
VALUES ( '金融投资所得');

INSERT INTO income_types ( income_type)
VALUES ( '房租收入');

INSERT INTO income_types ( income_type)
VALUES ( '被动收入');

INSERT INTO income_types ( income_type)
VALUES ( '其它收入');
```

收入亚类数据表构建：
```
-- SQLite
INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('工资1', 1);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('工资2', 1);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('奖金', 1);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('股票抛售所得', 2);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('基金卖出所得', 2);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('储蓄性保险收回所得', 2);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('其它金融投资所得', 2);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('房租收入', 3);


INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('被动收入', 4);

INSERT INTO income_sub_types (subtype, income_type_id)
VALUES ('其它收入', 5);
```

支出类、亚类、子类数据表创建：


## 2.heroku部署文档

## 3.更新日志
* 2020年7月30日
修改每月1日0时的账单数据被归类到上月的问题；

* 
