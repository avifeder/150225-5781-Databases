create or replace function equalNamae(user_name in VARCHAR2) return number is
  FunctionResult number;
begin
    
  select count(*)
  into FunctionResult
  from afeder.profile p
  where p.first_name = user_name or p.last_name = user_name;
 
  return(FunctionResult);
end equalNamae;
/
