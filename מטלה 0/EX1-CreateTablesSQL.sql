CREATE TABLE area
(
  areaID NUMERIC(3) ,
  areaName VARCHAR(20) ,
  PRIMARY KEY (areaID)
);

CREATE TABLE city
(
  cityName VARCHAR(20) ,
  areaID NUMERIC(3) REFERENCES area,
  PRIMARY KEY (cityName)
);

CREATE TABLE client
(
  clientName VARCHAR(20) ,
  agentID NUMERIC(9)  REFERENCES agent,
  phoneNr VARCHAR(10) ,
  Address VARCHAR(25) ,
  cityName VARCHAR(20) ,
  clientID NUMERIC(9)  REFERENCES city,
  PRIMARY KEY (clientID)
);

CREATE TABLE agent
(
  areaID NUMERIC(3) REFERENCES area,
  Rating NUMERIC(2) ,
  HireYear NUMERIC(4) ,
  bossID NUMERIC(9) L,
  salary FLOAT ,
  agentID NUMERIC(9) ,
  agentName VARCHAR(20) ,
  PRIMARY KEY (agentID)
);

CREATE TABLE schedule
(
  agentID NUMERIC(9) REFERENCES agent,
  clientID NUMERIC(9) REFERENCES city,
  meetingTime DATE ,
  PRIMARY KEY (agentID, clientID, meetingTime)
);
