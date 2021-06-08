create or replace procedure thePop is
   
     CURSOR top_users IS
     select t2.pro_id, t2.c
     from 
            (
            select t1.profile_id2 as pro_id , count(*) as c, ROW_NUMBER() OVER (ORDER BY count(*)) as rnum
            from bmarcus.tag t1
            group by t1.profile_id2
            ) t2
            
     where t2.rnum >= 
                     (
                     select count( distinct t1.profile_id2)
                     from bmarcus.tag t1
                     ) * 0.9
                     
     order by  t2.c desc;
     
     top_user top_users%rowtype;
     
       BEGIN
         open top_users;
         fetch top_users into top_user;
         if top_users%notfound then
               dbms_output.put_line('error');
         elsif top_users%found then
            
               dbms_output.put_line('---------------------------------------------------------------------------------');
               dbms_output.put_line('                                    USER INFO                                    ');
               dbms_output.put_line('ID | NUM OF TAGS ');
               dbms_output.put_line('---------------------------------------------------------------------------------');
               loop
                 exit when top_users%notfound ;
                 dbms_output.put_line(top_user.pro_id || ' | '|| top_user.c);
                 fetch top_users into top_user;
               end loop;
          close top_users;
          end if;

end thePop;
/
