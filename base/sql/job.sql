TRUNCATE TABLE CARL.BJOB;
TRUNCATE TABLE CARL.BJOBCHILD;
--历史数据备份
insert into CARL.BJOB (JOBID, JOBNAME, MCHANNELID, JOBDESC)
values ('backup.backupJnlDataJob', '历史数据备份', 'CARL', '每日凌晨3点05执行');

insert into CARL.BJOBCHILD (JOBID, CHILDJOBID, RELTYPE, RELPARAM)
values ('backup.backupJnlDataJob', 'backup.backupJnlDataJobService', '1', '');  
commit;

--客户经理信息同步
insert into CARL.BJOB (JOBID, JOBNAME, MCHANNELID, JOBDESC)
values ('loan.EmpInfoSycJob', '客户经理信息同步', 'CARL', '每日23点05分执行');

insert into CARL.BJOBCHILD (JOBID, CHILDJOBID, RELTYPE, RELPARAM)
values ('loan.EmpInfoSycJob', 'loan.EmpInfoSycJobService', '1', '');  
commit;

--影像文件清理
insert into CARL.BJOB (JOBID, JOBNAME, MCHANNELID, JOBDESC)
values ('loan.LoanMediaFileClearJob', '影像文件清理', 'CARL', '每日23点执行');

insert into CARL.BJOBCHILD (JOBID, CHILDJOBID, RELTYPE, RELPARAM)
values ('loan.LoanMediaFileClearJob', 'loan.LoanMediaFileClearJobService', '1', '');  
commit;

--征信结果查询
insert into CARL.BJOB (JOBID, JOBNAME, MCHANNELID, JOBDESC)
values ('loan.LoanFirstAuthPbocInfoJob', '征信结果查询', 'CARL', '每20秒执行一次');

insert into CARL.BJOBCHILD (JOBID, CHILDJOBID, RELTYPE, RELPARAM)
values ('loan.LoanFirstAuthPbocInfoJob', 'loan.LoanFirstAuthPbocInfoJobService', '1', '');  
commit;

--反欺诈结果查询
insert into CARL.BJOB (JOBID, JOBNAME, MCHANNELID, JOBDESC)
values ('loan.LoanFirstAuthFqzJob', '反欺诈结果查询', 'CARL', '每55秒执行一次');

insert into CARL.BJOBCHILD (JOBID, CHILDJOBID, RELTYPE, RELPARAM)
values ('loan.LoanFirstAuthFqzJob', 'loan.LoanFirstAuthFqzJobService', '1', '');  
commit;


ALTER TABLE CARL.BJOBCHILD ADD STARTTIME  TIMESTAMP;
ALTER TABLE CARL.BJOBCHILD ADD ENDTIME  TIMESTAMP;
ALTER TABLE CARL.BJOBCHILD ADD STATUS  VARCHAR2(10);
ALTER TABLE CARL.BJOBCHILD ADD MESSAGE  VARCHAR2(1024);


CREATE TABLE CARL.MUSERPWD(
MUSERSEQ NUMERIC(20) PRIMARY KEY,
PWDTYPE VARCHAR2 (2),
PASSWORD VARCHAR2 (64),
STATUS VARCHAR2 (2),
CREATETIME TIMESTAMP DEFAULT SYSDATE,
UPDATETIME TIMESTAMP DEFAULT SYSDATE
);
comment on table CARL.MUSERPWD
  is '用户密码表';
comment on column CARL.MUSERPWD.MUSERSEQ
  is '用户序号';
comment on column CARL.MUSERPWD.PWDTYPE
  is '密码类型 1：登录密码 2：手势密码 3：指纹密码 4：人脸密码';
comment on column CARL.MUSERPWD.PASSWORD
  is '密码（国密sm4） ';
comment on column CARL.MUSERPWD.CREATETIME
  is '创建时间';
comment on column CARL.MUSERPWD.UPDATETIME
  is '更新时间';