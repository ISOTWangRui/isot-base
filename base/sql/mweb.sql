CREATE INDEX INDEX_MUSER_USERID ON carl.MUSER USING btree (USERID);

UPDATE carl.PRDSET SET "PRDSETNAME"  ='交易复核' WHERE prdsetid='jyfh';
UPDATE carl.PRDSET SET "PRDSETNAME"  ='日志管理' WHERE prdsetid='grzx';




--insert into carl."PRDSET" (PRDSETID, MODULEID, PRDSETTYPEID, PRDSETNAME, PARENTID, ORDERID)
--values ('CusMgmtBatchInput', 'bank', 'bank', '客户经理批量导入', 'UserMgmt', '2002');

--insert into carl."PRDSETPRD" (PRDSETID, PRDID)
--values ('CusMgmtBatchInput', 'core.MCMCusMgmtBatchInput');

--insert into carl.ECCIFROLEPRDSET (ROLESEQ, PRDSETID, MAKERIGHT, CHECKRIGHT, AUTHRIGHT, AUTHGROUP, RELEASERIGHT, CREATEUSERSEQ, CREATEDEPTSEQ, CREATETIME, UPDATEUSERSEQ, UPDATEDEPTSEQ, UPDATETIME)
--values (2, 'CusMgmtBatchInput', '0', '0', '0', '0', '0', 1, 1, now(), null, null, null);






  CREATE TABLE "carl"."TASKENTRY" (
	"TASKSEQ" numeric(20,0) NOT NULL,
	"PROCESSSTATE" character varying(8 char) NOT NULL COLLATE "ci_x_icu",
	"TASKCREATEDATE" timestamp without time zone NOT NULL,
	"PRDID" character varying(64 char) NULL COLLATE "ci_x_icu",
	"PRDNAME" character varying(64 char) NULL COLLATE "ci_x_icu",
	"CIFSEQ" numeric(20,0) NOT NULL,
	"USERSEQ" numeric(20,0) NULL,
	"USERID" varchar(20),
	"MCHANNELID" character varying(16 char) NOT NULL COLLATE "ci_x_icu",
	"LOGINTYPE" character(1 char) NOT NULL COLLATE "ci_x_icu",
	"TASKEXPIREDATE" timestamp without time zone NULL,
	"DEPTSEQ" numeric(20,0) NULL,
	"CHECKUSERSEQ" numeric(20,0) NULL,
	"CHECKCIFSEQ" numeric(20,0) NULL,
	"CHECKUSERID" varchar(20),
	"CHECKTIME" timestamp(6) without time zone NULL,
	"CHECKSTATE" character varying(4 char) NULL COLLATE "ci_x_icu",
	"CHECKREMARK" character varying(200 char) NULL COLLATE "ci_x_icu",
	"RETURNCODE" character varying(64 char) NULL COLLATE "ci_x_icu",
	"RETURNMSG" character varying(1024 char) NULL COLLATE "ci_x_icu",
	"JNLDATA" bytea NOT NULL,
	CONSTRAINT "PK_TASKSEQ" PRIMARY KEY (TASKSEQ)
);

comment on column TASKENTRY.TASKSEQ is '交易序号';
comment on column TASKENTRY.PROCESSSTATE is '交易状态';
comment on column TASKENTRY.TASKCREATEDATE is '交易时间';
comment on column TASKENTRY.PRDID is '产品ID';
comment on column TASKENTRY.PRDNAME is '产品名';
comment on column TASKENTRY.CIFSEQ is '客户号';
comment on column TASKENTRY.USERSEQ is '用户号';
comment on column TASKENTRY.USERID is '用户名';
comment on column TASKENTRY.MCHANNELID is '渠道号';
comment on column TASKENTRY.LOGINTYPE is '登录类型';
comment on column TASKENTRY.TASKEXPIREDATE is '交易过期时间';
comment on column TASKENTRY.DEPTSEQ is '机构号';
comment on column TASKENTRY.CHECKUSERID is '审核用户名';
comment on column TASKENTRY.CHECKUSERSEQ is '审核用户号';
comment on column TASKENTRY.CHECKCIFSEQ is '审核客户号';
comment on column TASKENTRY.CHECKTIME is '审核时间';
comment on column TASKENTRY.CHECKSTATE is '审核状态';
comment on column TASKENTRY.CHECKREMARK is '审核备注';
comment on column TASKENTRY.RETURNCODE is '返回码';
comment on column TASKENTRY.RETURNMSG is '返回信息';
comment on column TASKENTRY.JNLDATA is '交易数据';