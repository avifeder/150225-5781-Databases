REM PL/SQL Developer SQL History
CREATE TABLE profile
(
  profile_id INT NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  pass VARCHAR(20) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (profile_id)
);

CREATE TABLE post
(
  post_id INT NOT NULL,
  profile_id INT NOT NULL ,
  post_date DATE NOT NULL,
  visability_code NUMERIC(10) NOT NULL,
  number_of_likes INT NOT NULL,
  post_content VARCHAR(5000) NOT NULL,
  post_type VARCHAR(20) NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (post_id),
  foreign key(profile_id) references profile(profile_id)
);

CREATE TABLE comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(5000) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
/

CREATE TABLE post
(
  post_id INT NOT NULL,
  profile_id INT NOT NULL ,
  post_date DATE NOT NULL,
  visability_code NUMERIC(10) NOT NULL,
  number_of_likes INT NOT NULL,
  post_content VARCHAR(500) NOT NULL,
  post_type VARCHAR(20) NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (post_id),
  foreign key(profile_id) references profile(profile_id)
);

CREATE TABLE comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(500) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
/


CREATE TABLE comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(500) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
/
CREATE TABLE profile
(
  profile_id INT NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  pass VARCHAR(20) NOT NULL,
  gender CHAR(1) CHECK(gender='F' or gender='M') NOT NULL, 
  PRIMARY KEY (profile_id)
);

CREATE TABLE post
(
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  post_date DATE NOT NULL,
  visability_code NUMERIC(10) NOT NULL,
  number_of_likes INT NOT NULL,
  post_content VARCHAR(500) NOT NULL,
  post_type VARCHAR(20) NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (post_id),
  foreign key(profile_id) references profile(profile_id)
);



CREATE TABLE post_comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(500) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
/
CREATE TABLE profile
(
  profile_id INT NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  pass VARCHAR(20) NOT NULL,
  gender CHAR(1) CHECK(gender='F' or gender='M' or gender='O') NOT NULL, 
  PRIMARY KEY (profile_id)
);

CREATE TABLE post
(
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  post_date DATE NOT NULL,
  visability_code NUMERIC(10) NOT NULL,
  number_of_likes INT NOT NULL,
  post_content VARCHAR(500) NOT NULL,
  post_type VARCHAR(20) NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (post_id),
  foreign key(profile_id) references profile(profile_id)
);



CREATE TABLE post_comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(500) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
/
CREATE TABLE profile
(
  profile_id INT NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  pass VARCHAR(20) NOT NULL,
  gender CHAR(1) CHECK(gender='F' or gender='M' or gender='O') NOT NULL, 
  PRIMARY KEY (profile_id)
);

CREATE TABLE post
(
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  post_date DATE NOT NULL,
  visability_code NUMERIC(10) NOT NULL,
  number_of_likes INT NOT NULL,
  post_content VARCHAR(500) NOT NULL,
  post_type VARCHAR(20) NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (post_id),
  foreign key(profile_id) references profile(profile_id)
);



CREATE TABLE post_comment
(
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  profile_id INT NOT NULL,
  comment_content VARCHAR(500) NOT NULL,
  PRIMARY KEY (comment_id),
  foreign key(profile_id) references profile(profile_id),
  foreign key(post_id) references post(post_id)
);
