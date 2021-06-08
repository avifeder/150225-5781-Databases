create or replace procedure allInfo(profile_id in INTEGER) is
       proId INTEGER := profile_id;
       numOfPost number;
       numOfLikes number;
       numOfFriends number;
       numOfShare number;
       numOfTags number;
       numOfSuggestion number;
       numOfRequest number;
       numOfNotification number;
begin
         select count(*)
         into numOfRequest
         from ydemri.friendshiprequest f1
         where f1.reciever_id = proId;
         
         select count(*)
         into numOfSuggestion
         from ydemri.friendshipsuggestion s1
         where s1.recieverid = proId;
         
         select count(*)
         into numOfNotification
         from ydemri.notification n
         where n.profile_id = proId;
         
         select count(*)
         into numOfShare
         from bmarcus.share_post s2
         where s2.profile_id = proId;
         
         select count(*)
         into numOfFriends
         from bmarcus.friends f2
         where f2.friend_id1 = proId;
         
         select count(*)
         into numOfTags
         from bmarcus.tag t
         where t.profile_id2 = proId;
         
          select sum(p1.number_of_likes)
         into numOfLikes
         from afeder.post p1
         where p1.profile_id = proId;
         
         IF numOfLikes is null then
           numOfLikes := 0;
         end if;
         
         select count(*)
         into numOfPost
         from afeder.post p2
         where p2.profile_id = proId;
         
         dbms_output.put_line('---------------------------------------------------------------------------------');
         dbms_output.put_line('                                    USER INFO                                    ');
         dbms_output.put_line('ID | POST | LIKES | SHARES | TAGS | FREINDS | SUGGESTION | REQUEST | NOTIFICATION');
         dbms_output.put_line('---------------------------------------------------------------------------------');
         dbms_output.put_line(proId || ' | ' ||numOfPost || ' | ' ||numOfLikes || ' | ' ||numOfShare ||
                                       ' | ' ||numOfTags || ' | ' ||numOfFriends || ' | '|| numOfSuggestion ||
                                        ' | '|| numOfRequest || ' | ' ||numOfNotification );

end allInfo;
/
