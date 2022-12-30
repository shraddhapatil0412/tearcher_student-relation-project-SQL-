use sql_2_4;

create table student(student_id int primary key,s_name varchar(20),s_surname varchar(20));
insert into student values(101,'shraddha','patil');
insert into student values(102,'shardul','harachkar');
insert into student values(103,'manish','mestry');
insert into student values(104,'sampada','tasvalkar');
insert into student values(105,'kalpesh','kadu');
insert into student values(106,'sayali','taral');
insert into student values(107,'durga','gupta');
insert into student values(108,'shraddha','harachkar');
insert into student values(109,'atish','patil');
insert into student values(110,'pushkar','nair');
select * from student;

create table teacher(teacher_id int primary key,t_name varchar(20),t_surname varchar(20));
insert into teacher values(201,'parinita','jain');
insert into teacher values(202,'meena','pandey');
insert into teacher values(203,'reshma','patil');
insert into teacher values(204,'vaishali','baikar');
insert into teacher values(205,'leena','naik');
select * from teacher;


create table course(course_id int primary key,course_name varchar(20));
insert into course values(301,'sql');
insert into course values(302,'java');
insert into course values(303,'python');
insert into course values(304,'html');
insert into course values(305,'css');
insert into course values(306,'php');
insert into course values(307,'ML');
select * from course;

create table student_course(student_id int,course_id int);
insert into student_course values(101,302);
insert into student_course values(102,302);
insert into student_course values(101,301);
insert into student_course values(102,303);
insert into student_course values(103,303);
insert into student_course values(104,304);
insert into student_course values(105,305);
insert into student_course values(106,306);
insert into student_course values(107,307);
insert into student_course values(108,305);
insert into student_course values(109,304);
insert into student_course values(110,307);
select * from student_course;


create table course_teacher(course_id int,teacher_id int,start_date date,end_date date);
insert into course_teacher values(301,201,'2022-11-01','2022-11-30');
insert into course_teacher values(302,202,'2022-11-02','2022-12-01');
insert into course_teacher values(303,203,'2022-11-03','2022-12-02');
insert into course_teacher values(304,204,'2022-11-04','2022-12-03');
insert into course_teacher values(305,205,'2022-11-05','2022-12-04');
insert into course_teacher values(306,201,'2022-11-06','2022-12-05');
insert into course_teacher values(307,202,'2022-11-07','2022-12-06');
select * from course_teacher;


create table lecture(lecture_id int primary key,room int,lecture_day varchar(20),lecture_time time,course_id int,teacher_id int);
insert into lecture values(401,1,'monday','08:00:00',301,201);
insert into lecture values(402,2,'tuesday','09:00:00',302,202);
insert into lecture values(403,3,'wednesday','10:00:00',303,203);
insert into lecture values(404,4,'thursday','09:30:00',304,204);
insert into lecture values(405,1,'friday','08:30:00',305,205);
insert into lecture values(406,3,'monday','08:00:00',306,201);
insert into lecture values(407,2,'tuesday','09:00:00',307,202);
select * from lecture;

create table attendance(student_id int,lecture_id int, stud_attendance int);
insert into attendance values(101,401,75);
insert into attendance values(102,402,75);
insert into attendance values(103,403,60);
insert into attendance values(104,404,65);
insert into attendance values(105,405,70);
insert into attendance values(106,406,80);
insert into attendance values(107,407,62);
insert into attendance values(108,401,74);
insert into attendance values(109,402,59);
insert into attendance values(110,403,65);
select * from attendance;


create table examination(examination_id int primary key,course_id int,teacher_id int,exam_date date);
insert into examination values(501,301,201,'2022-12-11');
insert into examination values(502,302,202,'2022-12-12');
insert into examination values(503,303,203,'2022-12-13');
insert into examination values(504,304,204,'2022-12-14');
insert into examination values(505,305,205,'2022-12-15');
insert into examination values(506,306,201,'2022-12-16');
insert into examination values(507,307,202,'2022-12-17');
select * from examination;

create table grade(examination_id int,student_id int,teacher_id int,grade varchar(20));
insert into grade values(501,101,201,'A');
insert into grade values(502,102,202,'A');
insert into grade values(503,103,203,'B');
insert into grade values(504,104,204,'C');
insert into grade values(505,105,205,'B');
insert into grade values(506,106,201,'C');
insert into grade values(507,107,202,'A');
insert into grade values(502,108,203,'B');
insert into grade values(501,109,204,'D');
insert into grade values(503,110,205,'C');
select * from grade;

#foreign key for student_course table
alter table student_course add constraint stud_f foreign key(student_id) references student(student_id);
alter table student_course add constraint stud_f1 foreign key(course_id) references course(course_id);
desc student_course;

#foreign key for course_teacher table
alter table course_teacher add constraint cour_f foreign key(course_id) references course(course_id);
alter table course_teacher add constraint cour_f1 foreign key(teacher_id) references teacher(teacher_id);
desc course_teacher;

#foreign key for attendance table
alter table attendance add constraint att_f foreign key(student_id) references student(student_id);
alter table attendance add constraint att_f1 foreign key(lecture_id) references lecture(lecture_id);
desc attendance;

#foreign key for lecture table
alter table lecture add constraint lec_f foreign key(course_id) references course(course_id);
alter table lecture add constraint lec_f1 foreign key(teacher_id) references teacher(teacher_id);
desc lecture;

#foreign key for examination table
alter table examination add constraint exam_f foreign key(course_id) references course(course_id);
alter table examination add constraint exam_f1 foreign key(teacher_id) references teacher(teacher_id);
desc examination;

#foreign key for grade table
alter table grade add constraint grade_f foreign key(examination_id) references examination(examination_id);
alter table grade add constraint grade_f1 foreign key(teacher_id) references teacher(teacher_id);
alter table grade add constraint grade_f2 foreign key(student_id) references student(student_id);
desc grade;

#select student whose course id=302?
select * from student_course where course_id=302;

#select student whosse attendance is greater than 70?
select * from attendance where stud_attendance>70;

#select student whose grade is A?
select * from grade where grade="A";

select t_name from teacher where Teacher_id=201; 

#natural join
select * from student natural join grade;

#right outer join
select * from teacher right outer join lecture on teacher.teacher_id=lecture.teacher_id;

#left outer join
select * from course left outer join examination on course.course_id=examination.course_id;

#inner join
select * from grade inner join examination on grade.examination_id=examination.examination_id;

#create view
create view stud_view as select * from attendance where stud_attendance>=80;
select * from stud_view;

#alter view
alter view stud_view as select s_name  , concat(s_name," ",s_surname) as full_name from student;
select * from stud_view;
