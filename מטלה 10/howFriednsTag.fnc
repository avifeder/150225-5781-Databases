create or replace function howFriednsTag(profile_id in number) return number is
  FunctionResult number;
begin
         select count(*)
         into FunctionResult
         from bmarcus.tag t join  bmarcus.friends f on f.friend_id2 = t.profile_id1 
         where f.friend_id1 = profile_id and t.profile_id2 = profile_id;
         
         
  return(FunctionResult);
end howFriednsTag;
/
