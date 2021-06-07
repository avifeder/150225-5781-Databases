create index index1 ON AFEDER.PROFILE(profile_id,first_name,last_name,gender);
create index index2 ON AFEDER.POST(post_id,number_of_likes);
create index index3 ON AFEDER.POST_COMMENT(comment_id,post_id,profile_id);

