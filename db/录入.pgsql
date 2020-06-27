-- incometype入库

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

-- incomesubtype入库

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


