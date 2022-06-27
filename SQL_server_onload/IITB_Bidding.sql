drop table "Student" cascade constraints;
drop table "Course" cascade constraints;
drop table "Bids" cascade constraints;
drop table "Ineligibility" cascade constraints;
drop table "Login" cascade constraints;
drop table "Allotment" cascade constraints;


CREATE TABLE "Student" (
  "roll_number" VARCHAR2(255),
  "student_name" VARCHAR2(255),
  "year_of_graduation" VARCHAR2(255),
  "degree" VARCHAR2(255),
  "points_remaining" LONG,
  PRIMARY KEY ("roll_number")
);

CREATE TABLE "Course" (
  "course_id" VARCHAR2(255),
  "course_name" VARCHAR2(255),
  "professors" VARCHAR2(255),
  "credit" VARCHAR2(255),
  "seats" NUMBER(3,0),
  PRIMARY KEY ("course_id")
);

CREATE TABLE "Bids" (
  "bid_id" VARCHAR2(255),
  "time" TIMESTAMP WITH TIME ZONE,
  "roll_number" VARCHAR2(255),
  "course_id" VARCHAR2(255),
  "bid_points" LONG,
  "bid_status" VARCHAR2(255),
  PRIMARY KEY ("bid_id"),
  CONSTRAINT "FK_Bids.roll_number"
    FOREIGN KEY ("roll_number")
      REFERENCES "Student"("roll_number"),
  CONSTRAINT "FK_Bids.course_id"
    FOREIGN KEY ("course_id")
      REFERENCES "Course"("course_id")
);

CREATE TABLE "Ineligibility" (
  "ineligibility_id" VARCHAR2(255),
  "roll_number" VARCHAR2(255),
  "course_id" VARCHAR2(255),
  PRIMARY KEY ("ineligibility_id"),
  CONSTRAINT "FK_Ineligibility.roll_number"
    FOREIGN KEY ("roll_number")
      REFERENCES "Student"("roll_number"),
  CONSTRAINT "FK_Ineligibility.course_id"
    FOREIGN KEY ("course_id")
      REFERENCES "Course"("course_id")
);

CREATE TABLE "Login" (
  "roll_number" VARCHAR2(255),
  "password" VARCHAR2(255),
  "type" VARCHAR2(255),
  PRIMARY KEY ("roll_number")
);

CREATE TABLE "Allotment" (
  "allotment_id" VARCHAR2(255),
  "roll_number" VARCHAR2(255),
  "course_id" VARCHAR2(255),
  PRIMARY KEY ("allotment_id"),
  CONSTRAINT "FK_Allotment.roll_number"
    FOREIGN KEY ("roll_number")
      REFERENCES "Student"("roll_number"),
  CONSTRAINT "FK_Allotment.course_id"
    FOREIGN KEY ("course_id")
      REFERENCES "Course"("course_id")
);


