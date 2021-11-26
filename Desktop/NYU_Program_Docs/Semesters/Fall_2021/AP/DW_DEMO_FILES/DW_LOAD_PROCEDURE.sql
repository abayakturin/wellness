

conn dws/dws@orcl   
set serveroutput on


create or replace PROCEDURE  load_dw_emp IS
dcnt NUMBER;
icnt NUMBER;
err_code NUMBER;
err_msg VARCHAR2(32000);
BEGIN
dcnt := 0;
icnt := 0;
for c in (select * from stg_dw_emp)
loop
    delete from dw_emp where empno=c.empno and park_id=c.park_id and projid=c.projid;
    dcnt := dcnt+1;
     INSERT INTO DW_EMP  (empno,ename,job,mgr,hiredate,sal,comm,deptno,park_id,floor,projid,pname,start_date,end_date,hours,tbl_last_dt)
     VALUES (c.empno,c.ename,c.job,c.mgr,c.hiredate,c.sal,c.comm,c.deptno,c.park_id,c.floor,c.projid,c.pname,c.start_date,c.end_date,c.hours,SYSDATE);
     icnt := icnt+1;
     commit;
     dbms_output.put_line('Total Deleted Record: '||dcnt||' Total Inserted Records: '||icnt);
end loop;
     commit;
     dbms_output.put_line('Total Deleted Record: '||dcnt||' Total Inserted Records: '||icnt);
EXCEPTION
    WHEN OTHERS THEN
         err_code := SQLCODE;
         err_msg  := SQLERRM;
         dbms_output.put_line('Error code ' || err_code || ': ' || err_msg);
END;
/


=======

create or replace PROCEDURE  load_merge_dw_emp IS
err_code NUMBER;
err_msg VARCHAR2(32000);
BEGIN
    MERGE INTO dw_emp e
    USING stg_dw_emp s
    ON (e.empno= s.empno and e.park_id=s.park_id and e.projid=s.projid)
  WHEN MATCHED THEN
    UPDATE SET 
         e.ename=s.ename,
         e. job=s.job,
         e.mgr=s.mgr,
         e.hiredate=s.hiredate,
         e.comm=s.comm,
         e.deptno=s.deptno,
         e.floor=s.floor,
         e.pname=s.pname,
         e.start_date=s.start_date,
         e.end_date=s.end_date,
         e.hours=s.hours,
         e.tbl_last_dt=sysdate 
  WHEN NOT MATCHED THEN
      INSERT (empno,ename,job,mgr,hiredate,sal,comm,deptno,park_id,floor,projid,pname,start_date,end_date,hours,tbl_last_dt)
      VALUES (s.empno,s.ename,s.job,s.mgr,s.hiredate,s.sal,s.comm,s.deptno,s.park_id,s.floor,s.projid,s.pname,s.start_date,s.end_date,s.hours,SYSDATE);
      commit;
EXCEPTION
    WHEN OTHERS THEN
         err_code := SQLCODE;
         err_msg  := SQLERRM;
         dbms_output.put_line('Error code ' || err_code || ': ' || err_msg);
END;
/

