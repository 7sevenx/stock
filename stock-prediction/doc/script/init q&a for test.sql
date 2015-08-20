DELETE FROM WECHAT_QUESTION_TYPE;
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000009', '客户类', '1', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000008', '存款类', '2', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000010', '账户类', '3', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000011', '网银类', '4', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000012', '贷款类', '5', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000013', '利率类', '6', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000014', '汇率类', '7', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000015', '理财类', '8', null);
insert into WECHAT_QUESTION_TYPE (ID, TYPE_NAME, SEQ, REMARK) values ('QY201403140000016', '其他类', '0', null);

DELETE FROM WECHAT_QUESTION;
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000008', 'QY201403140000016', '电子商务平台上做善融前景如何', 'AN201403140000003', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000009', 'QY201403140000010', '建行信用卡如何提高额度', 'AN201403140000002', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000007', 'QY201403140000016', '手机接收不到95533的短信', 'AN201403140000005', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000006', 'QY201403140000011', '我如何使用“账号支付”功能进行网上支付？', 'AN201403140000006', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000010', 'QY201403140000011', '开通网上银行如何把信用卡账号追加进网上银行', 'AN201403140000007', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000011', 'QY201403140000011', '网银盾被锁了怎么办', 'AN201403140000008', null);
insert into WECHAT_QUESTION (ID, TYPE_ID, QUESTION, ANSWER_ID, REMARK) values ('QU201403140000012', 'QY201403140000012', '请问现在建行二手房贷', 'AN201403140000009', null);

DELETE FROM WECHAT_KEYWORD;
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000059', 'QU201403150000018', 'AN201403150000013', '哈哈', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000063', 'QU201403150000022', 'AN201403140000005', '迭代', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000064', 'QU201403150000023', 'AN201403140000005', '哼哼', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000065', 'QU201403150000024', 'AN201403140000005', '空空', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000049', 'QU201403150000016', 'AN201403150000013', 'test', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000058', 'QU201403150000018', 'AN201403150000013', '吃个毛线', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000066', 'QU201403150000025', 'AN201403140000005', '老刘', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403170000070', 'QU201403170000029', 'AN201403140000007', '账号', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000035', 'QU201403140000007', 'AN201403140000005', '短信', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000036', 'QU201403140000007', 'AN201403140000005', '95533', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000032', 'QU201403140000008', 'AN201403140000003', '电子商务', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000033', 'QU201403140000008', 'AN201403140000003', '善融', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000034', 'QU201403140000009', 'AN201403140000002', '信用卡额度', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000037', 'QU201403140000006', 'AN201403140000006', '账号支付', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000038', 'QU201403140000006', 'AN201403140000006', '网上支付', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000039', 'QU201403140000010', 'AN201403140000007', '网上银行', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000040', 'QU201403140000010', 'AN201403140000007', '信用卡账号', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000041', 'QU201403140000011', 'AN201403140000008', '网银盾', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000042', 'QU201403140000011', 'AN201403140000008', '锁', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000043', 'QU201403140000012', 'AN201403140000009', '房贷', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000048', 'QU201403140000015', 'AN201403140000012', '世上', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403170000071', 'QU201403170000030', 'AN201403140000005', '是', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403170000073', 'QU201403170000032', 'AN201403140000002', '是', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000054', 'QU201403140000014', 'AN201403140000012', '看看', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000055', 'QU201403140000014', 'AN201403140000012', '时', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000056', 'QU201403150000017', 'AN201403150000014', '看看', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000057', 'QU201403150000017', 'AN201403150000014', '的', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000067', 'QU201403150000026', 'AN201403140000005', '别', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403140000044', 'QU201403140000013', 'AN201403140000004', '方法', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403170000072', 'QU201403170000031', 'AN201403140000007', '是', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000062', 'QU201403150000021', 'AN201403140000005', '哦', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000068', 'QU201403150000027', 'AN201403140000005', '短信', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000060', 'QU201403150000019', 'AN201403140000005', '短信', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000061', 'QU201403150000020', 'AN201403140000012', '口袋', null);
insert into WECHAT_KEYWORD (ID, QUESTION_ID, ANSWER_ID, KEYWORD, REMARK) values ('KE201403150000069', 'QU201403150000028', 'AN201403140000005', '短信', null);

DELETE FROM WECHAT_ASK;
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000007', '41', '网银盾被锁了怎么办', '连续10次输入错误的密码导致网银盾锁定，则需要用户到网点更换网银盾。您可以去任一网点办理网银盾更换！ ', TIMESTAMP '2014-03-14 17:47:37', TIMESTAMP '2014-03-14 18:09:21', 'R', '1', null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000006', '1', '手机接收不到95533的短信', '编辑短信“QXZH#账户后四位”发送到95533可注销指定账户所签约的所有短信服务；编辑“QXFW”发送到95533可注销客户名下所有短信服务，包括账户变动通知、短信转账汇款、短信缴费充值及理财资讯短信服务等。 ', TIMESTAMP '2014-03-14 17:23:52', TIMESTAMP '2014-03-14 17:23:59', 'R', '1', null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000009', '1', '账户怎么开', null, TIMESTAMP '2014-03-14 18:17:50', null, 'A', null, null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000010', '1', '账户怎么绑定', '在微信银行功能菜单使用银行卡号进行绑定', TIMESTAMP '2014-03-15 17:47:37', TIMESTAMP '2014-03-17 14:56:52', 'R', '1', null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000008', '1', '建行信用卡如何提高额度', null, TIMESTAMP '2014-03-14 18:07:10', null, 'A', null, null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000011', '41', '附近有什么网点', null, TIMESTAMP '2014-03-16 13:37:27', null, 'A', null, null);
insert into WECHAT_ASK (ID, ASKER_ID, QUESTION, ANSWER, ASKED_TIME, REPLIED_TIME, STATUS, REPLIER_ID, REMARK) values ('AS201403140000012', '41', '我想购买理财产品，有什么推荐的', null, TIMESTAMP '2014-03-15 11:42:37', null, 'A', null, null);

DELETE FROM WECHAT_ANSWER;
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000003', '首先，我们要知道什么是电子商务，电子商务时代的到来对于我们来说，对于企业来说意味着什么，带着这这些疑问那么我们就可以探讨一下基于电子商务平台善融的发展前景如何了..... ', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000002', '到发卡网点申请调整信用额度，持信用卡和本人有效身份证件，填写申请书，审核通过后调整信用额度。', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000005', '编辑短信“QXZH#账户后四位”发送到95533可注销指定账户所签约的所有短信服务；编辑“QXFW”发送到95533可注销客户名下所有短信服务，包括账户变动通知、短信转账汇款、短信缴费充值及理财资讯短信服务等。 ', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000006', '在进行网上购物时，选择使用“中国建设银行”进行网上支付，页面会自动跳转至建行网上支付页面，页面上有“网上银行客户支付”“账号支付”两个页签，请点击“账号支付”页签，页面提示将会自动引导您使用“账号支付”功能。', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000007', '您好，您只需要登录您的个人网上银行，然后点击“我的账户”，选择“追加新账户”，最后填写新追加账户的相关信息即可。', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000008', '连续10次输入错误的密码导致网银盾锁定，则需要用户到网点更换网银盾。您可以去任一网点办理网银盾更换！ ', null);
insert into WECHAT_ANSWER (ID, ANSWER, REMARK) values ('AN201403140000009', '您好，建议您直接联系当地办理贷款的分行哦', null);