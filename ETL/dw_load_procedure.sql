-- FULL LOAD

create or replace PROCEDURE  load_dw_doctor IS
dcnt NUMBER;
icnt NUMBER;
err_code NUMBER;
err_msg VARCHAR2(32000);
BEGIN
dcnt := 0;
icnt := 0;
for c in (select * from stg_dw_doctor)
loop
    delete from doctor where empno=c.empno and park_id=c.park_id and projid=c.projid;
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

-- INCREMENTAL LOAD 