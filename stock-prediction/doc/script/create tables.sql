DROP SEQUENCE WBS_MENU_INFO_SEQ;
DROP SEQUENCE WBS_MARKET_TYPE_INFO_SEQ;
DROP SEQUENCE WBS_MARKET_INFO_TOPIC_ID_SEQ;
DROP SEQUENCE WBS_MARKET_SUB_INFO_SUB_ID_SEQ;
DROP SEQUENCE WBS_FAVOURABLE_LIST_PUB_SEQ;
DROP SEQUENCE WBS_FAVOURABLE_LIST_BATCH_SEQ;
DROP SEQUENCE WBS_FAVOURABLE_INTRO_SEQ;
DROP SEQUENCE WBS_IMAGE_TEMP_SEQ;
DROP SEQUENCE WBS_IDEA_FEEDBACK_SEQ;
DROP SEQUENCE WBS_ADVERT_INFO_SEQ;
DROP SEQUENCE USER_INFO_SEQ;
DROP SEQUENCE SESSION_ID_SEQ;
DROP SEQUENCE SEQ_ID;
DROP SEQUENCE USER_SEQ_ID;
DROP SEQUENCE ROLE_SEQ_ID;
DROP SEQUENCE DEPARTMENT_SEQ_ID;
DROP TABLE WBS_FAVOURABLE_LIST_BATCH ;
DROP TABLE WBS_MENU_INFO ;
DROP TABLE WBS_ADVERT_INFO ;
DROP TABLE WBS_IDEA_FEEDBACK ;
DROP TABLE WBS_FAVOURABLE_LIST_INFO ;
DROP TABLE WBS_FAVOURABLE_LIST_PUB ;
DROP TABLE WBS_IMAGE_TEMP ;
DROP TABLE WBS_PREVIEW_INFO ;
DROP TABLE WBS_LOG_OPERATION ;
DROP TABLE WBS_MARKET_INFO ;
DROP TABLE WBS_MARKET_SUB_INFO ;
DROP TABLE WBS_MARKET_TYPE_INFO ;
DROP TABLE WBS_FAVOURABLE_INTRO ;
DROP TABLE WBS_SYS_PARM ;
DROP TABLE WBS_USER_BINDCARD ;
DROP TABLE WBS_USER_CLS ;
DROP TABLE WBS_USER_INFO ;
DROP TABLE FCSI_EX_LOG;
DROP TABLE FCSI_JOURNAL;
DROP TABLE FCSI_JOURNAL_DATA;
DROP TABLE FCSI_JOURNAL_DETAIL;
DROP TABLE FCSI_JOURNAL_DETAIL_DATA;
DROP TABLE FCSI_REVERSAL_PARAM;
DROP TABLE FCSI_REVERSAL_LOCAL_JOURNAL;
DROP TABLE FCSI_SERVICE_PARAMETER;
DROP TABLE WBS_WIZARD_SESSION;
DROP TABLE WBS_MENU;
DROP TABLE FCSI_SEQ_NO;
DROP TABLE FCSI_ACCOUNTING_DATE;
DROP TABLE FCSI_RBAC_ROLE ;
DROP TABLE FCSI_RBAC_USER;
DROP TABLE FCSI_RBAC_MENU ;
DROP TABLE FCSI_RBAC_FUNCTION ;
DROP TABLE FCSI_RBAC_PRIVILEGE ;
DROP TABLE FCSI_RBAC_DEPARTMENT ;

drop table WECHAT_ANSWER cascade constraints;
drop table WECHAT_ASK cascade constraints;
drop table WECHAT_KEYWORD cascade constraints;
drop table WECHAT_QUESTION cascade constraints;
drop table WECHAT_QUESTION_TYPE cascade constraints;

create sequence WBS_MENU_INFO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_MARKET_TYPE_INFO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_MARKET_INFO_TOPIC_ID_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_MARKET_SUB_INFO_SUB_ID_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_FAVOURABLE_LIST_PUB_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_FAVOURABLE_LIST_BATCH_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_FAVOURABLE_INTRO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_IMAGE_TEMP_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_IDEA_FEEDBACK_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create sequence WBS_ADVERT_INFO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

CREATE SEQUENCE USER_INFO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

CREATE SEQUENCE SESSION_ID_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

create SEQUENCE SEQ_ID
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

CREATE SEQUENCE USER_SEQ_ID
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

CREATE SEQUENCE ROLE_SEQ_ID
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

CREATE SEQUENCE DEPARTMENT_SEQ_ID
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
;

/*==============================================================*/
/* Table: WBS_FAVOURABLE_LIST_BATCH                             */
/*==============================================================*/
create table WBS_FAVOURABLE_LIST_BATCH 
(
  BATCH_NO             VARCHAR2(11)         not null,
   MERCHANT_NM          VARCHAR2(100),
   FAVL_RATE            VARCHAR2(100),
   USE_WAY              VARCHAR2(30),
   FAVL_LIST_NM         VARCHAR2(100),
   UPLOAD_DATE          TIMESTAMP,
   USE_TOTAL_NUM        INTEGER,
   PUB_TOTAL_NUM        INTEGER,
   UPLOAD_TOTAL_NUM     INTEGER,
   CANCEL_REASON        VARCHAR2(100),
   BATCH_STATUS         CHAR(1),
   REMARK               VARCHAR2(100),
   constraint PK_WBS_FAVOURABLE_LIST_BATCH primary key (BATCH_NO)
);

comment on column WBS_FAVOURABLE_LIST_BATCH.BATCH_NO is
'批次号: 日期（年月日8位）+ 3位序列号';

comment on column WBS_FAVOURABLE_LIST_BATCH.MERCHANT_NM is
'商户名称';

comment on column WBS_FAVOURABLE_LIST_BATCH.FAVL_RATE is
'优惠额度';

comment on column WBS_FAVOURABLE_LIST_BATCH.USE_WAY is
'使用方法';

comment on column WBS_FAVOURABLE_LIST_BATCH.FAVL_LIST_NM is
'优惠券名称';

comment on column WBS_FAVOURABLE_LIST_BATCH.UPLOAD_DATE is
'上传时间';

comment on column WBS_FAVOURABLE_LIST_BATCH.USE_TOTAL_NUM is
'已使用数量';

comment on column WBS_FAVOURABLE_LIST_BATCH.PUB_TOTAL_NUM is
'总发布数量';

comment on column WBS_FAVOURABLE_LIST_BATCH.UPLOAD_TOTAL_NUM is
'总上传数量';

comment on column WBS_FAVOURABLE_LIST_BATCH.CANCEL_REASON is
'作废理由';

comment on column WBS_FAVOURABLE_LIST_BATCH.BATCH_STATUS is
'批次状态:0=正常，1=作废';

comment on column WBS_FAVOURABLE_LIST_BATCH.REMARK is
'备注';

/*==============================================================*/
/* Table: WBS_MENU_INFO                                         */
/*==============================================================*/
create table WBS_MENU_INFO 
(
   SEQ_NO               INTEGER              not null,
   MENU_KEY             VARCHAR2(4)          not null,
   MENU_MAME            VARCHAR2(200),
   REMARK               VARCHAR2(200),
   constraint PK_WBS_MENU_INFO primary key (SEQ_NO)
);

comment on table WBS_MENU_INFO is
'手机营销菜单信息表';

comment on column WBS_MENU_INFO.SEQ_NO is
'序列号';

comment on column WBS_MENU_INFO.MENU_KEY is
'菜单KEY';

comment on column WBS_MENU_INFO.MENU_MAME is
'菜单名称';

comment on column WBS_MENU_INFO.REMARK is
'备注';


/*==============================================================*/
/* Table: WBS_ADVERT_INFO                                       */
/*==============================================================*/
create table WBS_ADVERT_INFO 
(
   SEQ_NO               INTEGER              not null,
   TITLE                VARCHAR2(200)        not null,
   BRVY_IMAGE           BLOB,
   INTRO_IMAGE          BLOB,
   INTRO_ONE            VARCHAR2(4000),
   INTRO_SED            VARCHAR2(4000),
   IS_BIG_IMG_FLAG      CHAR(1),
   IS_PUB               CHAR(1),
   constraint PK_WBS_ADVERT_INFO primary key (SEQ_NO)
);

comment on table WBS_ADVERT_INFO is
'直销广告信息表';

comment on column WBS_ADVERT_INFO.SEQ_NO is
'序列号';

comment on column WBS_ADVERT_INFO.TITLE is
'标题';

comment on column WBS_ADVERT_INFO.BRVY_IMAGE is
'缩略图';

comment on column WBS_ADVERT_INFO.INTRO_IMAGE is
'介绍图片';

comment on column WBS_ADVERT_INFO.INTRO_ONE is
'介绍文字一';

comment on column WBS_ADVERT_INFO.INTRO_SED is
'介绍文字二';

comment on column WBS_ADVERT_INFO.IS_BIG_IMG_FLAG is
'是否大图标志  Y=大图，N=小图';

comment on column WBS_ADVERT_INFO.IS_PUB is
'是否发布  N=未发布，Y=已发布';


/*==============================================================*/
/* Table: WBS_IDEA_FEEDBACK                              */
/*==============================================================*/
create table WBS_IDEA_FEEDBACK 
(
   SEQ_NO               INTEGER,
   WX_ID                VARCHAR2(30)         not null,
   CRED_TYPE            CHAR(1),
   CRED_NO              VARCHAR2(30),
   IDEA_TYPE            CHAR(1),
   IDEA                 VARCHAR2(4000),
   FEEDBACKTIME         TIMESTAMP
);

comment on table WBS_IDEA_FEEDBACK is
'意见反馈表';

comment on column WBS_IDEA_FEEDBACK.SEQ_NO is
'序列号';

comment on column WBS_IDEA_FEEDBACK.WX_ID is
'微信ID';

comment on column WBS_IDEA_FEEDBACK.CRED_TYPE is
'证件类型';

comment on column WBS_IDEA_FEEDBACK.CRED_NO is
'证件号码';

comment on column WBS_IDEA_FEEDBACK.IDEA_TYPE is
'意见类型  0-手机银行，1-微信银行';

comment on column WBS_IDEA_FEEDBACK.IDEA is
'反馈意见';

comment on column WBS_IDEA_FEEDBACK.FEEDBACKTIME is
'反馈时间';


/*==============================================================*/
/* Table: WBS_FAVOURABLE_LIST_INFO                              */
/*==============================================================*/
create table WBS_FAVOURABLE_LIST_INFO 
(
   FAVL_LIST_NO         VARCHAR(20)          not null,
   BATCH_NO             VARCHAR2(11)         not null,
   SUB_BATCH_NO         VARCHAR2(15),
   FAVL_LIST_NM         VARCHAR2(100),
   STATUS               CHAR(1),
   USE_DATE             TIMESTAMP,
   USE_MAN              VARCHAR(30),
   USE_STATUS           CHAR(1),
   constraint PK_WBS_FAVOURABLE_LIST_INFO primary key (FAVL_LIST_NO)
);

comment on column WBS_FAVOURABLE_LIST_INFO.FAVL_LIST_NO is
'优惠券编号';

comment on column WBS_FAVOURABLE_LIST_INFO.BATCH_NO is
'批次号';

comment on column WBS_FAVOURABLE_LIST_INFO.SUB_BATCH_NO is
'子批次号';

comment on column WBS_FAVOURABLE_LIST_INFO.FAVL_LIST_NM is
'优惠券名称';

comment on column WBS_FAVOURABLE_LIST_INFO.STATUS is
'优惠券状态:0=有效，1=无效';

comment on column WBS_FAVOURABLE_LIST_INFO.USE_DATE is
'使用日期';

comment on column WBS_FAVOURABLE_LIST_INFO.USE_MAN is
'使用者';

comment on column WBS_FAVOURABLE_LIST_INFO.USE_STATUS is
'使用状态:0=未使用，1=已使用';

/*==============================================================*/
/* Table: WBS_FAVOURABLE_LIST_PUB                               */
/*==============================================================*/
create table WBS_FAVOURABLE_LIST_PUB 
(
   SUB_BATCH_NO         VARCHAR2(15)         not null,
   BATCH_NO             VARCHAR2(11)         not null,
   PUB_COUNTS           INTEGER,
   TOPIC                VARCHAR2(100)        not null,
   APP_DATE             TIMESTAMP,
   BREY_IMAGE           BLOB,
   BACKGRD_IMAGE        BLOB,
   START_DATE           TIMESTAMP,
   END_DATE             TIMESTAMP,
   RELEASE_STATUS       CHAR(1),
   AUDT_STATUS          CHAR(1),
   PUB_DATE             TIMESTAMP,
   REMARK               VARCHAR2(100),
   constraint PK_WBS_FAVOURABLE_LIST_PUB primary key (SUB_BATCH_NO, BATCH_NO)
);

comment on column WBS_FAVOURABLE_LIST_PUB.SUB_BATCH_NO is
'子批次号.格式:日期（年月日8位）+ 3位序列号 + 4位子序列号';

comment on column WBS_FAVOURABLE_LIST_PUB.BATCH_NO is
'批次号';

comment on column WBS_FAVOURABLE_LIST_PUB.PUB_COUNTS is
'发布条数';

comment on column WBS_FAVOURABLE_LIST_PUB.TOPIC is
'标题';

comment on column WBS_FAVOURABLE_LIST_PUB.APP_DATE is
'申请日期';

comment on column WBS_FAVOURABLE_LIST_PUB.BREY_IMAGE is
'缩略图';

comment on column WBS_FAVOURABLE_LIST_PUB.BACKGRD_IMAGE is
'背景图';

comment on column WBS_FAVOURABLE_LIST_PUB.START_DATE is
'起始日期';

comment on column WBS_FAVOURABLE_LIST_PUB.END_DATE is
'结止日期';

comment on column WBS_FAVOURABLE_LIST_PUB.RELEASE_STATUS is
'发布状态: 0=未发布，1=展示中，2=撤销';

comment on column WBS_FAVOURABLE_LIST_PUB.AUDT_STATUS is
'审核状态: 0=未提交审核，1=待审核 ，2=审核通过，3=审核拒绝';

comment on column WBS_FAVOURABLE_LIST_PUB.PUB_DATE is
'发布时间';


/*==============================================================*/
/* Table: WBS_IMAGE_TEMP                                        */
/*==============================================================*/
create table WBS_IMAGE_TEMP 
(
   IMAGE_ID             INTEGER              not null,
   IMAGE                BLOB,
   constraint PK_WBS_IMAGE_TEMP primary key (IMAGE_ID)
);

comment on table WBS_IMAGE_TEMP is
'图片信息表';

comment on column WBS_IMAGE_TEMP.IMAGE_ID is
'图片ID';

comment on column WBS_IMAGE_TEMP.IMAGE is
'图片';

/*==============================================================*/
/* Table: WBS_PREVIEW_INFO                                      */
/*==============================================================*/
create table WBS_PREVIEW_INFO 
(
   PER_ID               VARCHAR2(20),
   CERT_ID              VARCHAR2(18)
);

comment on table WBS_PREVIEW_INFO is
'微信预览信息表';

comment on column WBS_PREVIEW_INFO.PER_ID is
'可为营销资讯ID或优惠券ID';

comment on column WBS_PREVIEW_INFO.CERT_ID is
'证件号码';


/*==============================================================*/
/* Table: WBS_LOG_OPERATION                                     */
/*==============================================================*/
create table WBS_LOG_OPERATION 
(
   JOURNAL_NO           VARCHAR2(20)         not null,
   USER_ID              VARCHAR2(16)         not null,
   WX_ID                VARCHAR2(30),
   CRED_TYPE            CHAR(1),
   CRED_NO              VARCHAR2(30),
   OP_TIME              TIMESTAMP            not null,
   OP_BIZ_CODE          VARCHAR2(10),
   OP_BIZ_NAME          VARCHAR2(80),
   OP_CARD_TYPE         CHAR(1),
   OP_CARD_NO           VARCHAR2(30),
   OP_CARD_SUPERBANKNO  VARCHAR2(20),
   OP_CARD_BANKNAME     VARCHAR2(100),
   OP_OPCARD_TYPE       CHAR(1),
   OP_OPCARD_NO         VARCHAR2(30),
   OP_OPCARD_SUPERBANKNO VARCHAR2(20),
   OP_OPCARD_BANKNAME   VARCHAR2(100),
   OP_TX_CCY            CHAR(3),
   OP_TX_AMT            NUMBER(18,2),
   OP_TX_FEE            NUMBER(18,2),
   OP_TX_DIGEST         VARCHAR2(200),
   OP_TXFLAG            CHAR(1),
   OP_ERRCODE           VARCHAR2(10),
   OP_ERRMSG            VARCHAR2(100),
   constraint PK_WBS_LOG_OPERATION primary key (JOURNAL_NO)
);

comment on table WBS_LOG_OPERATION is
'微信用户操作日志表';

comment on column WBS_LOG_OPERATION.JOURNAL_NO is
'流水号';

comment on column WBS_LOG_OPERATION.USER_ID is
'用户ID';

comment on column WBS_LOG_OPERATION.WX_ID is
'微信ID';

comment on column WBS_LOG_OPERATION.CRED_TYPE is
'证件类型';

comment on column WBS_LOG_OPERATION.CRED_NO is
'证件号码';

comment on column WBS_LOG_OPERATION.OP_TIME is
'操作时间';

comment on column WBS_LOG_OPERATION.OP_BIZ_CODE is
'业务代码';

comment on column WBS_LOG_OPERATION.OP_BIZ_NAME is
'业务名称';

comment on column WBS_LOG_OPERATION.OP_CARD_TYPE is
'操作账户类型
D：借记卡
C：信用卡
';

comment on column WBS_LOG_OPERATION.OP_CARD_NO is
'操作账户号';

comment on column WBS_LOG_OPERATION.OP_CARD_SUPERBANKNO is
'操作账户银行超级网银联行号';

comment on column WBS_LOG_OPERATION.OP_CARD_BANKNAME is
'操作账户银行名称';

comment on column WBS_LOG_OPERATION.OP_OPCARD_TYPE is
'对方账户类型
D：借记卡
C：信用卡
';

comment on column WBS_LOG_OPERATION.OP_OPCARD_NO is
'对方账户号';

comment on column WBS_LOG_OPERATION.OP_OPCARD_SUPERBANKNO is
'对方账户超级网银联行号';

comment on column WBS_LOG_OPERATION.OP_OPCARD_BANKNAME is
'对方账户银行名称';

comment on column WBS_LOG_OPERATION.OP_TX_CCY is
'交易货币';

comment on column WBS_LOG_OPERATION.OP_TX_AMT is
'交易金额';

comment on column WBS_LOG_OPERATION.OP_TX_FEE is
'交易手续费';

comment on column WBS_LOG_OPERATION.OP_TX_DIGEST is
'交易摘要';

comment on column WBS_LOG_OPERATION.OP_TXFLAG is
'操作结果标志 0：成功；1：失败；9：未知';

comment on column WBS_LOG_OPERATION.OP_ERRCODE is
'错误代码';

comment on column WBS_LOG_OPERATION.OP_ERRMSG is
'错误信息';


/*==============================================================*/
/* Table: WBS_MARKET_INFO                                       */
/*==============================================================*/
create table WBS_MARKET_INFO 
(
   TOPIC_ID             INTEGER              not null,
   TOPIC                VARCHAR(200),
   TYPE_ID              INTEGER,
   SUB_INFO_COUNTS      INTEGER,
   CREAT_DATE           TIMESTAMP,
   PUB_DATE             TIMESTAMP,
   CLEAN_DATE           TIMESTAMP,
   AUDITING_STATUS      CHAR(1),
   PUB_STATUS           CHAR(1),
   REMARK               VARCHAR(200),
   constraint PK_WBS_MARKET_INFO primary key (TOPIC_ID)
);


comment on column WBS_MARKET_INFO.TOPIC_ID is
'主题ID';

comment on column WBS_MARKET_INFO.TOPIC is
'主题';

comment on column WBS_MARKET_INFO.TYPE_ID is
'类型';

comment on column WBS_MARKET_INFO.SUB_INFO_COUNTS is
'子信息个数';

comment on column WBS_MARKET_INFO.CREAT_DATE is
'创建日期';

comment on column WBS_MARKET_INFO.PUB_DATE is
'发布日期';

comment on column WBS_MARKET_INFO.CLEAN_DATE is
'撤销日期';

comment on column WBS_MARKET_INFO.AUDITING_STATUS is
'审核状态   0=未审核，1=已审核';

comment on column WBS_MARKET_INFO.PUB_STATUS is
'发布状态    0=未发布，1=展示中';

comment on column WBS_MARKET_INFO.REMARK is
'备注';

/*==============================================================*/
/* Table: WBS_MARKET_SUB_INFO                                   */
/*==============================================================*/
create table WBS_MARKET_SUB_INFO 
(
   SUB_ID               INTEGER              not null,
   TOPIC_ID             INTEGER              not null,
   TITLE                VARCHAR2(200),
   BRVY_IMAGE           BLOB,
   INTRO_IMAGE          BLOB,
   INTRO_ONE            VARCHAR2(4000),
   INTRO_SED            VARCHAR2(4000),
   LINK                 VARCHAR2(200),
   IS_BIG_IMG_FLAG      CHAR(1),
   constraint PK_WBS_MARKET_SUB_INFO primary key (SUB_ID)
);


comment on table WBS_MARKET_SUB_INFO is
'营销资讯子信息表';

comment on column WBS_MARKET_SUB_INFO.SUB_ID is
'子信息ID';

comment on column WBS_MARKET_SUB_INFO.TOPIC_ID is
'主题ID';

comment on column WBS_MARKET_SUB_INFO.TITLE is
'标题';

comment on column WBS_MARKET_SUB_INFO.BRVY_IMAGE is
'缩略图';

comment on column WBS_MARKET_SUB_INFO.INTRO_IMAGE is
'介绍图片';

comment on column WBS_MARKET_SUB_INFO.INTRO_ONE is
'介绍文字一';

comment on column WBS_MARKET_SUB_INFO.INTRO_SED is
'介绍文字二';

comment on column WBS_MARKET_SUB_INFO.LINK is
'引用链接';

comment on column WBS_MARKET_SUB_INFO.IS_BIG_IMG_FLAG is
'是否大图标志   Y=大图，N=小图';

/*==============================================================*/
/* Table: WBS_MARKET_TYPE_INFO                                  */
/*==============================================================*/
create table WBS_MARKET_TYPE_INFO 
(
   SEQ_NO               INTEGER              not null,
   TYPE_CODE            VARCHAR2(3)          not null,
   TYPE_NAME            VARCHAR2(200),
   REMARK               VARCHAR2(200),
   MENU_KEY             VARCHAR2(4),
   MENU_FLAG            CHAR(1),
   constraint PK_WBS_MARKET_TYPE_INFO primary key (SEQ_NO)
);

comment on table WBS_MARKET_TYPE_INFO is
'营销类型信息表';

comment on column WBS_MARKET_TYPE_INFO.SEQ_NO is
'序利号';

comment on column WBS_MARKET_TYPE_INFO.TYPE_CODE is
'类型码';

comment on column WBS_MARKET_TYPE_INFO.TYPE_NAME is
'类型名称';

comment on column WBS_MARKET_TYPE_INFO.REMARK is
'备注';

comment on column WBS_MARKET_TYPE_INFO.MENU_KEY is
'菜单KEY';

comment on column WBS_MARKET_TYPE_INFO.MENU_FLAG is
'标志  Y=为手机上菜单，N=不为手机上菜单';


/*==============================================================*/
/* Table: WBS_FAVOURABLE_INTRO                                  */
/*==============================================================*/
create table WBS_FAVOURABLE_INTRO 
(
   SEQ_NO               INTEGER,
   CREAT_DATE           TIMESTAMP,
   TITLE                VARCHAR2(100),
   BRVY_IMAGE           BLOB,
   INTRO_IMAGE          BLOB,
   INTRO                VARCHAR2(100),
   LINK                 VARCHAR2(100),
   PUB_DATE             TIMESTAMP,
   CANCEL               TIMESTAMP,
   STATUS               CHAR(1)
);

comment on column WBS_FAVOURABLE_INTRO.SEQ_NO is
'序列号';

comment on column WBS_FAVOURABLE_INTRO.TITLE is
'标题';

comment on column WBS_FAVOURABLE_INTRO.CREAT_DATE is
'创建日期';

comment on column WBS_FAVOURABLE_INTRO.BRVY_IMAGE is
'缩略图';

comment on column WBS_FAVOURABLE_INTRO.INTRO_IMAGE is
'介绍图片';

comment on column WBS_FAVOURABLE_INTRO.INTRO is
'介绍文字';

comment on column WBS_FAVOURABLE_INTRO.LINK is
'引用链接';

comment on column WBS_FAVOURABLE_INTRO.PUB_DATE is
'发布日期';

comment on column WBS_FAVOURABLE_INTRO.CANCEL is
'撤销日期';

comment on column WBS_FAVOURABLE_INTRO.STATUS is
'状态:0-未发布，1-已发布，2-展示中，3-已撤销';

/*==============================================================*/
/* Table: WBS_SYS_PARM                                          */
/*==============================================================*/
create table WBS_SYS_PARM 
(
   PARM_NAME            VARCHAR2(50)         not null,
   PARM_DESC            VARCHAR2(100),
   PARM_VALUE           VARCHAR2(200),
   PARM_VALUE_EXT1      VARCHAR2(200),
   PARM_VALUE_EXT2      VARCHAR2(200),
   AUTH_MANAGERQUERY    CHAR(1),
   AUTH_MANAGERMODIFY   CHAR(1),
   MODIFY_TIME          TIMESTAMP
);

comment on column WBS_SYS_PARM.AUTH_MANAGERQUERY is
'Y：允许
N：不允许
';

comment on column WBS_SYS_PARM.AUTH_MANAGERMODIFY is
'Y：允许
N：不允许
';

/*==============================================================*/
/* Table: WBS_USER_BINDCARD                                     */
/*==============================================================*/
create table WBS_USER_BINDCARD 
(
   USER_ID              VARCHAR2(16)         not null,
   CARD_NO              VARCHAR2(30)         not null,
   CARD_TYPE            CHAR(1)              not null,
   OTHERBANK_FLAG       CHAR(1),
   OTHERBANK_SUPERBANKNO VARCHAR2(20),
   OTHERBANK_BANKNAME   VARCHAR2(100),
   AUTH_TSF_FLAG        CHAR(1),
   AUTH_PAY_FLAG        CHAR(1),
   AUTH_TSF_OPENTIME    TIMESTAMP,
   AUTH_PAY_OPENTIME    TIMESTAMP,
   CARD_BINDTIME        TIMESTAMP,
   constraint PK_WBS_USER_BINDCARD primary key (USER_ID, CARD_NO)
);

comment on table WBS_USER_BINDCARD is
'微信用户银行卡关联表';

comment on column WBS_USER_BINDCARD.USER_ID is
'用户ID';

comment on column WBS_USER_BINDCARD.CARD_NO is
'账号/卡号';

comment on column WBS_USER_BINDCARD.CARD_TYPE is
'卡类型   D：借记卡   C：信用卡';

comment on column WBS_USER_BINDCARD.OTHERBANK_FLAG is
'他行卡标志  Y：他行卡    N：我行卡';

comment on column WBS_USER_BINDCARD.OTHERBANK_SUPERBANKNO is
'他行卡超级网银联行号, 12位联行号。';

comment on column WBS_USER_BINDCARD.OTHERBANK_BANKNAME is
'银行名称';

comment on column WBS_USER_BINDCARD.AUTH_TSF_FLAG is
'转账权限开通标志  Y：已开通   N：未开通';

comment on column WBS_USER_BINDCARD.AUTH_PAY_FLAG is
'支付权限开通标志  Y: 已开通   N：未开通';

comment on column WBS_USER_BINDCARD.AUTH_TSF_OPENTIME is
'转账权限开通时间';

comment on column WBS_USER_BINDCARD.AUTH_PAY_OPENTIME is
'支付权限开通时间';

comment on column WBS_USER_BINDCARD.CARD_BINDTIME is
'绑定时间';

/*==============================================================*/
/* Table: WBS_USER_CLS                                          */
/*==============================================================*/
create table WBS_USER_CLS 
(
   USER_ID              VARCHAR2(16)         not null,
   WX_ID                VARCHAR2(30)         not null,
   WX_NAME              VARCHAR2(30),
   CRED_TYPE            CHAR(1),
   CRED_NO              VARCHAR2(30),
   USER_NAME            VARCHAR2(30),
   USER_SEX             CHAR(1),
   USER_VERIFIED        CHAR(1),
   USER_MOBILE          VARCHAR2(20),
   USER_MOBILE_FROM     VARCHAR2(4),
   USER_MOBILE_LEVEL    CHAR(1),
   CORE_CUSTID          VARCHAR2(20),
   CCIF_CUSTID          VARCHAR2(20),
   USER_TYPE            CHAR(1),
   USER_STATUS          CHAR(1),
   USER_LEVEL           CHAR(1),
   ATTENTION_TIME       TIMESTAMP,
   FREEZE_TIME          TIMESTAMP,
   CLOSE_TIME           TIMESTAMP,
   CREATE_TIME          TIMESTAMP,
   RECORD_STATUS        CHAR(1),
   REMARK              VARCHAR2(100),
   constraint PK_WBS_USER_CLS primary key (USER_ID)
);

comment on table WBS_USER_CLS is
'微信已注销用户信息表';

comment on column WBS_USER_CLS.USER_ID is
'用户ID';

comment on column WBS_USER_CLS.WX_ID is
'微信ID';

comment on column WBS_USER_CLS.WX_NAME is
'微信昵称';

comment on column WBS_USER_CLS.CRED_TYPE is
'证件类型';

comment on column WBS_USER_CLS.CRED_NO is
'证件号码';

comment on column WBS_USER_CLS.USER_NAME is
'用户姓名';

comment on column WBS_USER_CLS.USER_SEX is
'用户性别   M：男  F：女';

comment on column WBS_USER_CLS.USER_VERIFIED is
'用户信息已验证标识  Y：已验证   N：未验证';

comment on column WBS_USER_CLS.USER_MOBILE is
'用户手机号';

comment on column WBS_USER_CLS.USER_MOBILE_FROM is
'用户手机号来源   IBS: 个人网银系统   CORE: 存款及借记卡系统   CCIF: 信用卡系统';

comment on column WBS_USER_CLS.USER_MOBILE_LEVEL is
'用户手机号安全等级  (H   M   L)';

comment on column WBS_USER_CLS.CORE_CUSTID is
'核心系统客户识别号';

comment on column WBS_USER_CLS.CCIF_CUSTID is
'信用卡系统客户识别号';

comment on column WBS_USER_CLS.USER_TYPE is
'用户类型';

comment on column WBS_USER_CLS.USER_STATUS is
'用户状态   0：正常   1：挂失   2：注销';

comment on column WBS_USER_CLS.USER_LEVEL is
'用户级别   默认值：0';

comment on column WBS_USER_CLS.ATTENTION_TIME is
'关注时间';

comment on column WBS_USER_CLS.FREEZE_TIME is
'冻结时间';

comment on column WBS_USER_CLS.CLOSE_TIME is
'注销时间';

comment on column WBS_USER_CLS.CREATE_TIME is
'记录创建时间';

comment on column WBS_USER_CLS.RECORD_STATUS is
'记录状态  0：有效1：无效';

comment on column WBS_USER_CLS.REMARK is
'备注';

/*==============================================================*/
/* Table: WBS_USER_INFO                                         */
/*==============================================================*/
create table WBS_USER_INFO 
(
   USER_ID              VARCHAR2(16)         not null,
   WX_ID                VARCHAR2(30)         not null,
   WX_NAME              VARCHAR2(30),
   CRED_TYPE            CHAR(1),
   CRED_NO              VARCHAR2(30),
   USER_NAME            VARCHAR2(30),
   USER_SEX             CHAR(1),
   USER_VERIFIED        CHAR(1),
   USER_MOBILE          VARCHAR2(20),
   USER_MOBILE_FROM     VARCHAR2(4),
   USER_MOBILE_LEVEL    CHAR(1),
   CORE_CUSTID          VARCHAR2(20),
   CCIF_CUSTID          VARCHAR2(20),
   USER_TYPE            CHAR(1),
   USER_STATUS          CHAR(1),
   USER_LEVEL           CHAR(1),
   ATTENTION_TIME       TIMESTAMP,
   FREEZE_TIME          TIMESTAMP,
   CLOSE_TIME           TIMESTAMP,
   CREATE_TIME          TIMESTAMP,
   RECORD_STATUS        CHAR(1),
   REMARK               VARCHAR2(100),
   constraint PK_WBS_USER_INFO primary key (USER_ID)
);

comment on table WBS_USER_INFO is
'微信用户信息表';

comment on column WBS_USER_INFO.USER_ID is
'用户ID';

comment on column WBS_USER_INFO.WX_ID is
'微信ID';

comment on column WBS_USER_INFO.WX_NAME is
'微信昵称';

comment on column WBS_USER_INFO.CRED_TYPE is
'证件类型';

comment on column WBS_USER_INFO.CRED_NO is
'证件号码';

comment on column WBS_USER_INFO.USER_NAME is
'用户姓名';

comment on column WBS_USER_INFO.USER_SEX is
'用户性别   M：男  F：女';

comment on column WBS_USER_INFO.USER_VERIFIED is
'用户信息已验证标识  Y：已验证   N：未验证';

comment on column WBS_USER_INFO.USER_MOBILE is
'用户手机号';

comment on column WBS_USER_INFO.USER_MOBILE_FROM is
'用户手机号来源   IBS: 个人网银系统   CORE: 存款及借记卡系统   CCIF: 信用卡系统';

comment on column WBS_USER_INFO.USER_MOBILE_LEVEL is
'用户手机号安全等级  (H   M   L)';

comment on column WBS_USER_INFO.CORE_CUSTID is
'核心系统客户识别号';

comment on column WBS_USER_INFO.CCIF_CUSTID is
'信用卡系统客户识别号';

comment on column WBS_USER_INFO.USER_TYPE is
'用户类型';

comment on column WBS_USER_INFO.USER_STATUS is
'用户状态   0：正常   1：挂失   2：注销';

comment on column WBS_USER_INFO.USER_LEVEL is
'用户级别   默认值：0';

comment on column WBS_USER_INFO.ATTENTION_TIME is
'关注时间';

comment on column WBS_USER_INFO.FREEZE_TIME is
'冻结时间';

comment on column WBS_USER_INFO.CLOSE_TIME is
'注销时间';

comment on column WBS_USER_INFO.CREATE_TIME is
'记录创建时间';

comment on column WBS_USER_INFO.RECORD_STATUS is
'记录状态  0：有效1：无效';

comment on column WBS_USER_INFO.REMARK is
'备注';

--==============================================================
-- Table: FCSI_EX_LOG
--==============================================================
create table FCSI_EX_LOG
(
   JOURNAL_NO           VARCHAR2(20)            not null,
   AC_DATE              DATE,
   TX_DATE              DATE                   not null,
   TX_TIME              DATE                   not null,
   CONTEXT              VARCHAR2(4000),
   THREAD_NO            VARCHAR2(10),
   EX_MSG               VARCHAR2(200),
   EX_STACK             VARCHAR2(4000),
   primary key (JOURNAL_NO)
);

comment on table FCSI_EX_LOG is
'异常日志表';

comment on column FCSI_EX_LOG.JOURNAL_NO is
'流水号';

comment on column FCSI_EX_LOG.AC_DATE is
'会计日期';

comment on column FCSI_EX_LOG.TX_DATE is
'交易日期';

comment on column FCSI_EX_LOG.TX_TIME is
'交易时间';

comment on column FCSI_EX_LOG.CONTEXT is
'输入输出数据';

comment on column FCSI_EX_LOG.THREAD_NO is
'线程号';

comment on column FCSI_EX_LOG.EX_MSG is
'异常信息';

comment on column FCSI_EX_LOG.EX_STACK is
'异常详细信息';

--==============================================================
-- Table: FCSI_JOURNAL
--==============================================================
create table FCSI_JOURNAL
(
   JOURNAL_NO           VARCHAR2(20)            not null,
   ORI_JOURNAL_NO       VARCHAR2(20),
   REQ_JOURNAL_NO       VARCHAR2(20),
   AC_DATE              DATE,
   TX_DATE              DATE                   not null,
   TX_TIME              DATE                   not null,
   TX_TYPE              CHAR(1)                not null,
   APP_CODE             VARCHAR2(10),
   SERVICE_CODE         VARCHAR2(50)            not null,
   CHANNEL_NO           VARCHAR2(10),
   TERM_ID              VARCHAR2(20),
   BRANCH_CODE          VARCHAR2(20),
   TELLER_ID            VARCHAR2(10),
   STATUS               CHAR(1)                not null,
   REVERSAL_STATUS      CHAR(1),
   REMARK               VARCHAR2(200),
  primary key (JOURNAL_NO)
);

comment on table FCSI_JOURNAL is
'业务日志表';

comment on column FCSI_JOURNAL.JOURNAL_NO is
'流水号';

comment on column FCSI_JOURNAL.ORI_JOURNAL_NO is
'原交易流水号';

comment on column FCSI_JOURNAL.REQ_JOURNAL_NO is
'请求流水号';

comment on column FCSI_JOURNAL.AC_DATE is
'会计日期';

comment on column FCSI_JOURNAL.TX_DATE is
'交易日期';

comment on column FCSI_JOURNAL.TX_TIME is
'交易时间';

comment on column FCSI_JOURNAL.TX_TYPE is
'交易类型-N:正常；R:冲正';

comment on column FCSI_JOURNAL.APP_CODE is
'应用码';

comment on column FCSI_JOURNAL.SERVICE_CODE is
'服务码';

comment on column FCSI_JOURNAL.CHANNEL_NO is
'渠道号';

comment on column FCSI_JOURNAL.TERM_ID is
'终端号';

comment on column FCSI_JOURNAL.BRANCH_CODE is
'部门号';

comment on column FCSI_JOURNAL.TELLER_ID is
'柜员号';

comment on column FCSI_JOURNAL.STATUS is
'状态-0:处理中；1:成功；2:失败';

comment on column FCSI_JOURNAL.REVERSAL_STATUS is
'冲正状态-0:冲正处理中；1:冲正成功；2:冲正失败';

comment on column FCSI_JOURNAL.REMARK is
'备注';

--==============================================================
-- Table: FCSI_JOURNAL_DATA
--==============================================================
create table FCSI_JOURNAL_DATA
(
   JOURNAL_NO           VARCHAR2(20)            not null,
   DATA_TYPE            CHAR(1)                not null,
   "DATA"               VARCHAR2(4000),
   CLASS_NAME           VARCHAR2(100),
   DATA_LEN             INT,
  primary key (JOURNAL_NO, DATA_TYPE)
);

comment on table FCSI_JOURNAL_DATA is
'业务日志输入输出数据表';

comment on column FCSI_JOURNAL_DATA.JOURNAL_NO is
'流水号';

comment on column FCSI_JOURNAL_DATA.DATA_TYPE is
'数据流向-I:输入；O:输出';

comment on column FCSI_JOURNAL_DATA."DATA" is
'数据';

comment on column FCSI_JOURNAL_DATA.CLASS_NAME is
'数据类型';

comment on column FCSI_JOURNAL_DATA.DATA_LEN is
'数据长度';

--==============================================================
-- Table: FCSI_JOURNAL_DETAIL
--==============================================================
create table FCSI_JOURNAL_DETAIL
(
   JOURNAL_NO           VARCHAR2(20)            not null,
   IDX_NO               INT                    not null,
   REMOTE_AC_DATE       DATE,
   TX_DATE              DATE                   not null,
   TX_TIME              DATE                   not null,
   COMPONENT_TYPE       CHAR(2),
   COMPONENT_ID         VARCHAR2(20),
   COMPONENT_NAME       VARCHAR2(50),
   JRN_DET_TX_TYPE      CHAR(1),
   STATUS               CHAR(1)                not null,
   REVERSAL_STATUS      CHAR(1),
   AUTH_INFOS           VARCHAR2(200),
   RES_CODE             CHAR(2),
   RMT_REQ_JRN_NO       VARCHAR2(20)            not null,
   RMT_RES_JRN_NO       VARCHAR2(20),
   REMOTE_SYS_ID        VARCHAR2(20),
   REMOTE_TX_CODE       VARCHAR2(20),
   REMARK               VARCHAR2(200),
   primary key (JOURNAL_NO, IDX_NO)
);

comment on table FCSI_JOURNAL_DETAIL is
'日志明细表';

comment on column FCSI_JOURNAL_DETAIL.JOURNAL_NO is
'流水号';

comment on column FCSI_JOURNAL_DETAIL.IDX_NO is
'顺序号';

comment on column FCSI_JOURNAL_DETAIL.TX_DATE is
'交易日期';

comment on column FCSI_JOURNAL_DETAIL.TX_TIME is
'交易时间';

comment on column FCSI_JOURNAL_DETAIL.COMPONENT_TYPE is
'明细类型-预留如（transport）';

comment on column FCSI_JOURNAL_DETAIL.COMPONENT_ID is
'相关标识-如transportId';

comment on column FCSI_JOURNAL_DETAIL.COMPONENT_NAME is
'名称-预留 ';

comment on column FCSI_JOURNAL_DETAIL.STATUS is
'状态-0:处理中；1:成功；2：失败；3：超时';

comment on column FCSI_JOURNAL_DETAIL.REVERSAL_STATUS is
'冲正状态-0：冲正中；1：冲正成功；2：冲正失败；3：冲正超时；4：无需冲正';

comment on column FCSI_JOURNAL_DETAIL.AUTH_INFOS is
'授权信息';

comment on column FCSI_JOURNAL_DETAIL.RES_CODE is
'返回码';

comment on column FCSI_JOURNAL_DETAIL.RMT_REQ_JRN_NO is
'远程请求流水号';

comment on column FCSI_JOURNAL_DETAIL.RMT_RES_JRN_NO is
'远程响应流水号';

comment on column FCSI_JOURNAL_DETAIL.REMOTE_SYS_ID is
'远程系统ID';

comment on column FCSI_JOURNAL_DETAIL.REMOTE_TX_CODE is
'远程交易码';

comment on column FCSI_JOURNAL_DETAIL.REMARK is
'备注';

--==============================================================
-- Table: FCSI_JOURNAL_DETAIL_DATA
--==============================================================
create table FCSI_JOURNAL_DETAIL_DATA
(
   JOURNAL_NO           VARCHAR2(20)            not null,
   IDX_NO               INT                    not null,
   DATA_TYPE            CHAR(1)                not null,
   RMT_REQ_JRN_NO       VARCHAR2(20),
   "DATA"               VARCHAR2(4000),
   CLASS_NAME           VARCHAR2(100),
   DATA_LEN             INT,
   primary key (JOURNAL_NO, IDX_NO, DATA_TYPE)
);

comment on table FCSI_JOURNAL_DETAIL_DATA is
'明细日志输入输出数据表';

comment on column FCSI_JOURNAL_DETAIL_DATA.JOURNAL_NO is
'流水号';

comment on column FCSI_JOURNAL_DETAIL_DATA.IDX_NO is
'顺序号';

comment on column FCSI_JOURNAL_DETAIL_DATA.DATA_TYPE is
'数据流向-I：输入；O：输出';

comment on column FCSI_JOURNAL_DETAIL_DATA.RMT_REQ_JRN_NO is
'远程请求流水号';

comment on column FCSI_JOURNAL_DETAIL_DATA."DATA" is
'数据';

comment on column FCSI_JOURNAL_DETAIL_DATA.CLASS_NAME is
'数据类型';

comment on column FCSI_JOURNAL_DETAIL_DATA.DATA_LEN is
'数据长度';


--==============================================================
-- Table: FCSI_REVERSAL_PARAM
--==============================================================
CREATE
    TABLE FCSI_REVERSAL_PARAM
    (
        REMOTE_SYS_ID 					VARCHAR2(20) 		NOT NULL,
        REMOTE_TX_CODE 					VARCHAR2(40) 		NOT NULL,
        REVERSABLE 					CHARACTER(1)		NOT NULL,
        CURR_DAY_REVERSABLE 			CHARACTER(1),
        NEXT_DAY_REVERSABLE 		CHARACTER(1),
        VALIDATE_OVER_TIME 				CHARACTER(1),
        CURR_DAY_RVS_TX_CODE 			VARCHAR2(50),
        NEXT_DAY_RVS_TX_CODE 			VARCHAR2(50),
        CURR_DAY_RVS_DATA_INTERFACE 	VARCHAR2(50),
        NEXT_DAY_RVS_DATA_INTERFACE 	VARCHAR2(50),
        VALIDATE_OVER_TIME_INTERFACE 	VARCHAR2(50),
        REVERSAL_SERVICE_INTERFACE 		VARCHAR2(50) NOT NULL,
      PRIMARY KEY (REMOTE_SYS_ID, REMOTE_TX_CODE)
    );

comment ON TABLE FCSI_REVERSAL_PARAM
IS
    '冲正参数表';
comment ON COLUMN FCSI_REVERSAL_PARAM.REMOTE_SYS_ID
IS
    '外围系统标识';
comment ON COLUMN FCSI_REVERSAL_PARAM.REMOTE_TX_CODE
IS
    '原子（远程）交易码';
comment ON COLUMN FCSI_REVERSAL_PARAM.REVERSABLE
IS
    '是否允许冲正标志,Y=允许，N=不允许';
comment ON COLUMN FCSI_REVERSAL_PARAM.CURR_DAY_REVERSABLE
IS
    '是否允许当日冲正标志,Y=允许，N=不允许';
comment ON COLUMN FCSI_REVERSAL_PARAM.NEXT_DAY_REVERSABLE
IS
    '是否允许隔日冲正标志,Y=允许，N=不允许';
comment ON COLUMN FCSI_REVERSAL_PARAM.VALIDATE_OVER_TIME
IS
    '是否验证超时交易标志,Y=是，N=否';
comment ON COLUMN FCSI_REVERSAL_PARAM.CURR_DAY_RVS_TX_CODE
IS
    '当日冲正交易（服务）码';
comment ON COLUMN FCSI_REVERSAL_PARAM.NEXT_DAY_RVS_TX_CODE
IS
    '隔日冲正交易（服务）码';
comment ON COLUMN FCSI_REVERSAL_PARAM.CURR_DAY_RVS_DATA_INTERFACE
IS
    '当日冲正参数组成规则接口';
comment ON COLUMN FCSI_REVERSAL_PARAM.NEXT_DAY_RVS_DATA_INTERFACE
IS
    '隔日冲正参数组成规则接口';
comment ON COLUMN FCSI_REVERSAL_PARAM.VALIDATE_OVER_TIME_INTERFACE
IS
    '验证超时交易信息接口';
comment ON COLUMN FCSI_REVERSAL_PARAM.REVERSAL_SERVICE_INTERFACE
IS
    '冲正服务接口';


CREATE TABLE FCSI_REVERSAL_LOCAL_JOURNAL
(
     JOURNAL_NO 			VARCHAR2(20) 		NOT NULL,
     STATUS 				CHARACTER(1) 		NOT NULL,
     REMARK 				VARCHAR2(200),
    PRIMARY KEY (JOURNAL_NO)
);

COMMENT ON TABLE FCSI_REVERSAL_LOCAL_JOURNAL
IS
    '本地冲正记录表';
COMMENT ON COLUMN FCSI_REVERSAL_LOCAL_JOURNAL.JOURNAL_NO
IS
    '日志流水号';
COMMENT ON COLUMN FCSI_REVERSAL_LOCAL_JOURNAL.STATUS
IS
    '冲正状态,Y=冲正成功,N=冲正失败';
COMMENT ON COLUMN FCSI_REVERSAL_LOCAL_JOURNAL.REMARK
IS
    '备注';
    
--==============================================================
-- Table: FCSI_SERVICE_PARAMETER
--==============================================================
    
CREATE TABLE FCSI_SERVICE_PARAMETER
(
     SERVICE_CODE 				VARCHAR2(50) 	NOT NULL,
     ACCEPTANCE_CHNL_ID 		VARCHAR2(20) 	NOT NULL,
     MSG_TYPE 					VARCHAR2(2) 		NOT NULL,
     ACCEPTANCE_SYS_ID 			VARCHAR2(8) 		NOT NULL,
     PROCESS_ID 				VARCHAR2(50),
     PROCESS_STATUS 			VARCHAR2(2),
     LOGGABLE 					VARCHAR2(1),
     TX_TYPE 					VARCHAR2(2),
     REVERSABLE 				VARCHAR2(1),
     REVERSAL_STRATEGY 			VARCHAR2(20),
     LOCAL_REVERSAL 			VARCHAR2(20),
     PRIMARY KEY (SERVICE_CODE, ACCEPTANCE_CHNL_ID, MSG_TYPE, ACCEPTANCE_SYS_ID)
);

comment on table FCSI_SERVICE_PARAMETER is
'服务参数表';

comment on column FCSI_SERVICE_PARAMETER.SERVICE_CODE is
'交易码';

comment on column FCSI_SERVICE_PARAMETER.ACCEPTANCE_CHNL_ID is
'接入渠道ID';

comment on column FCSI_SERVICE_PARAMETER.MSG_TYPE is
' 报文类型（暂时默认2）';

comment on column FCSI_SERVICE_PARAMETER.ACCEPTANCE_SYS_ID is
'接入系统ID';

comment on column FCSI_SERVICE_PARAMETER.PROCESS_ID is
'process Id';

comment on column FCSI_SERVICE_PARAMETER.PROCESS_STATUS is
'process 状态（Y/启用，N/停用）';

comment on column FCSI_SERVICE_PARAMETER.LOGGABLE is
'是否记日志（Y/N）';

comment on column FCSI_SERVICE_PARAMETER.TX_TYPE is
'交易类型（正常：N；冲正：R）';

comment on column FCSI_SERVICE_PARAMETER.REVERSABLE is
'出错时是否自动冲正（Y/N)';

comment on column FCSI_SERVICE_PARAMETER.REVERSAL_STRATEGY is
'冲正策略（暂时留空）';

comment on column FCSI_SERVICE_PARAMETER.LOCAL_REVERSAL is
'本地冲正接口（冲正时本地接口，为空时不调用）';

CREATE TABLE WBS_WIZARD_SESSION
    (
        WIZARD_SESSION_ID VARCHAR2(30) NOT NULL,
        CREATE_TIME TIMESTAMP,
        LAST_UPD_TIME TIMESTAMP,
        TRADE VARCHAR2(300),
        CUSTOM_DATA VARCHAR2(4000),
        PRIMARY KEY (WIZARD_SESSION_ID)
    );
    
comment on table WBS_WIZARD_SESSION is
'微信session表';
    
comment on column WBS_WIZARD_SESSION.WIZARD_SESSION_ID is
'sessionID';

comment on column WBS_WIZARD_SESSION.CREATE_TIME is
'创建时间';

comment on column WBS_WIZARD_SESSION.LAST_UPD_TIME is
'最后更新时间';

comment on column WBS_WIZARD_SESSION.TRADE is
'交易数据';

comment on column WBS_WIZARD_SESSION.CUSTOM_DATA is
'客户数据';

CREATE TABLE WBS_MENU
    (
        WIZARD_SESSION_ID VARCHAR2(30) NOT NULL,
        CURR_SEQ INT,
        MENU_JSON VARCHAR2(3000),
        PRIMARY KEY (WIZARD_SESSION_ID, CURR_SEQ)
    );
    
comment on table WBS_MENU is
'微信菜单表';

comment on column WBS_MENU.WIZARD_SESSION_ID is
'sessionID';

comment on column WBS_MENU.CURR_SEQ is
'当前序号';

comment on column WBS_MENU.WIZARD_SESSION_ID is
'菜单json内容';

CREATE TABLE
    FCSI_SEQ_NO
    (
        TYPE CHARACTER(2) NOT NULL,
        ID NUMBER ,
        DATETIME DATE,
        TERM_ID VARCHAR2(20),
        BRANCK_CODE VARCHAR2(20),
        PRIMARY KEY (TYPE)
    );
    
comment on table FCSI_SEQ_NO is
'顺序号表';

comment on column FCSI_SEQ_NO.ID is
'ID';

comment on column FCSI_SEQ_NO.DATETIME is
'时间';

comment on column FCSI_SEQ_NO.TERM_ID is
'终端号';

comment on column FCSI_SEQ_NO.BRANCK_CODE is
'预留字段';
    
CREATE TABLE
    FCSI_ACCOUNTING_DATE
    (
        AC_DATE_ID VARCHAR2(20) NOT NULL,
        AC_DATE DATE NOT NULL,
        PREVIOUS_DATE DATE,
        PRIMARY KEY (AC_DATE_ID)
    );
 comment on table FCSI_ACCOUNTING_DATE is
'会计日期表';

comment on column FCSI_ACCOUNTING_DATE.AC_DATE_ID is
'会计日期ID';

comment on column FCSI_ACCOUNTING_DATE.AC_DATE is
'当前会计日';

comment on column FCSI_ACCOUNTING_DATE.PREVIOUS_DATE is
'上一会计日';

--1、角色表
CREATE TABLE FCSI_RBAC_ROLE (
  ROLE_ID		INTEGER		NOT NULL ,--角色ID
  ROLE_NAME		VARCHAR(30)	NOT NULL ,--角色名称
  REMARK		VARCHAR(200)	,--备注
  SA_FLAG		VARCHAR(1)	,--前后台标志
  LAST_UPDATE_USER_ID	INTEGER		,--最后修改人
  LAST_UPDATE_TIME	VARCHAR(8)		,--最后修改时间
  PRIMARY KEY(ROLE_ID)
);

--2、用户表
CREATE TABLE FCSI_RBAC_USER(
  USER_ID		INTEGER		NOT NULL ,--用户ID
  USER_NAME		VARCHAR(30)	NOT NULL ,--用户名
  LOGIN_NAME		VARCHAR(30)	NOT NULL ,--登录名
  DEPARTMENT_ID		INTEGER		NOT NULL ,
  PASSWORD		VARCHAR(100)	NOT NULL ,--密码
  ROLE_ID		INTEGER		NOT NULL ,--角色ID
  LAST_LOGIN_TIME       VARCHAR(8)	,	--最后登录时间
  LOGIN_IP		VARCHAR(15)	,--登陆IP
  FAILED_NUMBER		INTEGER		,--登陆已失败次数
  REMARK		VARCHAR(600)    ,--备注
  STATUS		INTEGER		,--状态，0-未启用，1-正常，2-已冻结，3-删除
  LAST_UPDATE_USER_ID	INTEGER		,--最后修改人
  LAST_UPDATE_TIME	VARCHAR(8)		,--最后修改时间
  CREATED_USER_ID	INTEGER		,--创建人
  CREATED_TIME		VARCHAR(8)		,--创建时间
  PRIMARY KEY(USER_ID)
);

--3、资源菜单表
CREATE TABLE FCSI_RBAC_MENU (
  MENU_ID		INTEGER NOT NULL	,--菜单ID
  PARENT_MENU_ID	INTEGER 	,--父菜单
  URL			VARCHAR(50)		,--action
  IMAGE			VARCHAR(20)		,--图标
  SA_FLAG		VARCHAR(1)	,--前后台标志
  REMARK	VARCHAR(600)	,--备注
  PRIMARY KEY(MENU_ID)
);

--4、资源功能表
CREATE TABLE FCSI_RBAC_FUNCTION (
  FUNCTION_ID   INTEGER		NOT NULL ,	--功能ID
  MENU_ID	INTEGER		NOT NULL,	--菜单ID
  SA_FLAG		VARCHAR(1)	,--前后台标志
  REMARK	VARCHAR(600)	,--备注
  PRIMARY KEY(FUNCTION_ID)
);

--5、权限表
CREATE TABLE FCSI_RBAC_PRIVILEGE (
  RESOURCE_ID		INTEGER         not null,--资源ID
  RESOURCE_TYPE		INTEGER		not null,--资源类型，0-菜单，1-功能
  ROLE_ID		INTEGER		not null,--角色ID
  LAST_UPDATE_USER_ID	INTEGER		,--最后修改人
  LAST_UPDATE_TIME	VARCHAR(8)		,--最后修改时间
  PRIMARY KEY(RESOURCE_ID, RESOURCE_TYPE, ROLE_ID)
);

--6 部门表
CREATE TABLE FCSI_RBAC_DEPARTMENT (
  DEPARTMENT_ID		INTEGER		NOT NULL,
  DEPARTMENT_NAME	VARCHAR(50)	NOT NULL,
  DEPARTMENT_TYPE 	VARCHAR(2)	NOT NULL,
  REMARK		VARCHAR(600)	,
PRIMARY KEY(DEPARTMENT_ID)
);



/*==============================================================*/
/* Table: WECHAT_ANSWER                                         */
/*==============================================================*/
create table WECHAT_ANSWER 
(
   ID                   NVARCHAR2(30)        not null,
   ANSWER               NVARCHAR2(200)       not null,
   REMARK               NVARCHAR2(100),
   constraint PK_WECHAT_ANSWER primary key (ID)
);

/*==============================================================*/
/* Table: WECHAT_ASK                                            */
/*==============================================================*/
create table WECHAT_ASK 
(
   ID                   NVARCHAR2(30)        not null,
   ASKER_ID             NVARCHAR2(30)        not null,
   QUESTION             NVARCHAR2(200)       not null,
   ANSWER               NVARCHAR2(200),
   ASKED_TIME           DATE                 not null,
   REPLIED_TIME         DATE,
   STATUS               CHAR(1)              not null,
   REPLIER_ID           NVARCHAR2(30),
   REMARK               NVARCHAR2(100),
   constraint PK_WECHAT_ASK primary key (ID)
);

comment on column WECHAT_ASK.STATUS is
'A - 询问中
R - 已答复
D -已 删除';

/*==============================================================*/
/* Table: WECHAT_KEYWORD                                        */
/*==============================================================*/
create table WECHAT_KEYWORD 
(
   ID                   NVARCHAR2(30)        not null,
   QUESTION_ID          NVARCHAR2(30)        not null,
   ANSWER_ID            NVARCHAR2(30)        not null,
   KEYWORD              NVARCHAR2(50)        not null,
   REMARK               NVARCHAR2(100),
   constraint PK_WECHAT_KEYWORD primary key (ID)
);

/*==============================================================*/
/* Table: WECHAT_QUESTION                                       */
/*==============================================================*/
create table WECHAT_QUESTION 
(
   ID                   NVARCHAR2(30)        not null,
   TYPE_ID              NVARCHAR2(30)        not null,
   QUESTION             NVARCHAR2(200)       not null,
   ANSWER_ID            NVARCHAR2(30)        not null,
   REMARK               NVARCHAR2(100),
   constraint PK_WECHAT_QUESTION primary key (ID)
);

/*==============================================================*/
/* Table: WECHAT_QUESTION_TYPE                                  */
/*==============================================================*/
create table WECHAT_QUESTION_TYPE 
(
   ID                   NVARCHAR2(30)        not null,
   TYPE_NAME            NVARCHAR2(50)        not null,
   SEQ                  NVARCHAR2(8)         not null,
   REMARK               NVARCHAR2(100),
   constraint PK_WECHAT_QUESTION_TYPE primary key (ID)
);
