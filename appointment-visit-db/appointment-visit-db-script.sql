DROP TABLE visit;
DROP TABLE appointment;
DROP TABLE place_pr;
DROP TABLE goal_pr;
DROP TABLE appointment_result_pr;
DROP TABLE visit_result_pr;
DROP TABLE customer;
DROP TABLE users;
DROP TABLE employee;
DROP TABLE department;


CREATE TABLE department(
	id				smallint
		CONSTRAINT department_id_pk PRIMARY KEY(id), 
	department_name nvarchar(50)
		CONSTRAINT department_name_nn not null, 
	address			nvarchar(100)
		CONSTRAINT department_address_nn not null, 
	city			nvarchar(30)
		CONSTRAINT department_city_nn not null, 
	phone			nvarchar(11)
		CONSTRAINT department_phone_nn not null, 
	fax				nvarchar(11)
);

CREATE TABLE employee(
	employee_id			int IDENTITY(1,1),
		CONSTRAINT employee_employee_id_pk PRIMARY KEY(employee_id),
	tc_number			bigint,
		CONSTRAINT employee_tc_number_un UNIQUE (tc_number),
		CONSTRAINT employee_tc_number_ck CHECK (tc_number between 10000000000 and 99999999999),
	employee_name		nvarchar(25)
		CONSTRAINT employee_employee_name_nn not null, 
	employee_surname	nvarchar(25)
		CONSTRAINT employee_employee_surname_nn not null,
	gender				char(1)
		CONSTRAINT employee_gender_nn not null,
		CONSTRAINT employee_gender_ck CHECK  (gender in('E','B')), 	
	father_name			nvarchar(25)
		CONSTRAINT employee_father_name_nn not null,
	mother_name			nvarchar(25)
		CONSTRAINT employee_mother_name_nn not null,
	birth_date 			datetime,
	birth_city			nvarchar(30), 	
	home_phone			nvarchar(11),		
	mobile_phone		nvarchar(11),
	email				nvarchar(50),	
	home_address		nvarchar(100),
	home_city			nvarchar(30),
	department_id		smallint
		CONSTRAINT employee_department_id_nn not null,
		CONSTRAINT employee_department_id_fk FOREIGN KEY(department_id) REFERENCES department(id),	
	job_title			nvarchar(50), 	
	hire_date			datetime default getdate(),
	leave_date			datetime,
	record_date			datetime default getdate()
		CONSTRAINT employee_record_date_nn not null,
);

CREATE TABLE users(
	username		nvarchar(10)
		CONSTRAINT users_username_pk PRIMARY KEY(username),
	password		nvarchar(20)
		CONSTRAINT users_password_nn not null,
	employee_id		int
		CONSTRAINT users_employee_id_nn not null,
		CONSTRAINT users_employee_id_fk FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE customer(
	customer_id			int IDENTITY(1,1),
		CONSTRAINT customer_customer_id_pk PRIMARY KEY(customer_id),
	tc_number			bigint,
		CONSTRAINT customer_tc_number_un UNIQUE (tc_number),
		CONSTRAINT customer_tc_number_ck CHECK (tc_number between 10000000000 and 99999999999),
	customer_name		nvarchar(25)
		CONSTRAINT customer_customer_name_nn not null, 
	customer_surname	nvarchar(25)
		CONSTRAINT customer_customer_surname_nn not null,
	gender				char(1)
		CONSTRAINT customer_gender_nn not null,
		CONSTRAINT customer_gender_ck CHECK  (gender in('E','B')), 	
	father_name			nvarchar(25)
		CONSTRAINT customer_father_name_nn not null,
	mother_name			nvarchar(25)
		CONSTRAINT customer_mother_name_nn not null,
	birth_date 			datetime,
	birth_city			nvarchar(30), 	
	home_phone			nvarchar(11),
	office_phone		nvarchar(11),	
	mobile_phone		nvarchar(11),
	email				nvarchar(50),	
	home_address		nvarchar(100),
	home_city			nvarchar(30),	
	job					nvarchar(50), 	
	company_name		nvarchar(50),	
	office_address		nvarchar(100),
	office_city			nvarchar(30),
	statu				char(1) default 'A'
		CONSTRAINT customer_statu_nn not null,
		CONSTRAINT customer_statu_ck check(statu in('A','P')),	
	record_employee_id	int
		CONSTRAINT customer_record_employee_id_nn not null,	
	record_date			datetime default getdate()
		CONSTRAINT customer_record_date_nn not null,		
);

CREATE TABLE place_pr(
	id				smallint
		CONSTRAINT place_pr_id_pk PRIMARY KEY(id), 	
	place_name		nvarchar(50)
		CONSTRAINT place_pr_place_name_nn not null, 		
	statu			char(1) default 'A'
		CONSTRAINT place_pr_statu_nn not null,
		CONSTRAINT place_pr_statu_ck check(statu in('A','P')),
	record_date		datetime default getdate()
		CONSTRAINT place_pr_record_date_nn not null
);

insert into place_pr(id,place_name) values(1,'müşteri işyerinde');
insert into place_pr(id,place_name) values(2,'Ofiste');
insert into place_pr(id,place_name) values(3,'fuarda');
insert into place_pr(id,place_name) values(4,'Seminerde');

CREATE TABLE goal_pr(
	id				smallint
		CONSTRAINT goal_pr_id_pk PRIMARY KEY(id), 	
	goal_name		nvarchar(50)
		CONSTRAINT goal_pr_goal_name_nn not null, 		
	statu			char(1) default 'A'
		CONSTRAINT goal_pr_statu_nn not null,
		CONSTRAINT goal_pr_statu_ck check(statu in('A','P')),
	record_date		datetime default getdate()
		CONSTRAINT goal_pr_record_date_nn not null
);
insert into goal_pr(id,goal_name) values(1,'Tanışmak');
insert into goal_pr(id,goal_name) values(2,'Ürün tanıtmak');
insert into goal_pr(id,goal_name) values(3,'Ortaklık kurmak');
insert into goal_pr(id,goal_name) values(4,'Bayilik anlaşması');

CREATE TABLE appointment_result_pr(
	id				smallint
		CONSTRAINT apm_result_pr_id_pk PRIMARY KEY(id), 	
	result_name		nvarchar(50)
		CONSTRAINT apm_result_pr_name_nn not null, 		
	statu			char(1) default 'A'
		CONSTRAINT apm_result_pr_statu_nn not null,
		CONSTRAINT apm_result_pr_statu_ck check(statu in('A','P')),
	record_date		datetime default getdate()
		CONSTRAINT apm_result_pr_record_date_nn not null
);
insert into appointment_result_pr(id,result_name) values(1,'Ertelendi');
insert into appointment_result_pr(id,result_name) values(2,'İptal');
insert into appointment_result_pr(id,result_name) values(3,'Olumlu');
insert into appointment_result_pr(id,result_name) values(4,'Olumsuz');


CREATE TABLE visit_result_pr(
	id				smallint
		CONSTRAINT visit_result_pr_id_pk PRIMARY KEY(id), 	
	result_name		nvarchar(50)
		CONSTRAINT visit_result_pr_name_nn not null, 		
	statu			char(1) default 'A'
		CONSTRAINT visit_result_pr_statu_nn not null,
		CONSTRAINT visit_result_pr_statu_ck check(statu in('A','P')),
	record_date		datetime default getdate()
		CONSTRAINT visit_result_pr_record_date_nn not null
);
insert into visit_result_pr(id,result_name) values(1,'Olumsuz');
insert into visit_result_pr(id,result_name) values(2,'Beraber çalışılabilir');
insert into visit_result_pr(id,result_name) values(3,'Ürün satışı gerçekleştirildi');
insert into visit_result_pr(id,result_name) values(4,'Ortaklık kuruldu');
insert into visit_result_pr(id,result_name) values(5,'İleride tekrar görüşülecek');

CREATE TABLE appointment(
	appointment_no		int IDENTITY(1,1) 
		CONSTRAINT appointment_appointment_no_pk PRIMARY KEY(appointment_no),	
	customer_id			int 
		CONSTRAINT appointment_customer_id_nn not null,
		CONSTRAINT appointment_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	place_id			smallint
		CONSTRAINT appointment_place_id_nn not null,
		CONSTRAINT appointment_place_id_fk FOREIGN KEY(place_id) REFERENCES place_pr(id),
	goal_id			smallint
		CONSTRAINT appointment_goal_id_nn not null,
		CONSTRAINT appointment_goal_id_fk FOREIGN KEY(goal_id) REFERENCES goal_pr(id),
	appointment_date			datetime
		CONSTRAINT appointment_appointment_date_nn not null,		
	appointment_hour			char(4)
		CONSTRAINT appointment_appointment_hour_nn not null,
		CONSTRAINT appointment_date_customer_un UNIQUE (appointment_date,appointment_hour,customer_id),
	explanation			nvarchar(2000)
		CONSTRAINT appointment_explanation_nn not null,	
	result_id			smallint,	
		CONSTRAINT appointment_result_id_fk FOREIGN KEY(result_id) REFERENCES appointment_result_pr(id),	
	employee_id			int
		CONSTRAINT appointment_employee_id_nn not null,
		CONSTRAINT appointment_employee_id_fk FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
		CONSTRAINT appointment_date_employee_un UNIQUE (appointment_date,appointment_hour,employee_id),
	last_update_date	datetime,
	record_date			datetime
		CONSTRAINT appointment_record_date_nn not null,
);

CREATE TABLE visit(
	visit_no		int IDENTITY(1,1) 
		CONSTRAINT visit_visit_no_pk PRIMARY KEY(visit_no),	
	customer_id		int 
		CONSTRAINT visit_customer_id_nn not null,
		CONSTRAINT visit_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	place_id		smallint
		CONSTRAINT visit_place_id_nn not null,
		CONSTRAINT visit_place_id_fk FOREIGN KEY(place_id) REFERENCES place_pr(id),
	goal_id			smallint
		CONSTRAINT visit_goal_id_nn not null,
		CONSTRAINT visit_goal_id_fk FOREIGN KEY(goal_id) REFERENCES goal_pr(id),
	visit_date			datetime
		CONSTRAINT visit_visit_date_nn not null,		
	visit_hour			char(4)
		CONSTRAINT visit_visit_hour_nn not null,
		CONSTRAINT visit_date_customer_un UNIQUE (visit_date,visit_hour,customer_id),
	explanation			nvarchar(2000)
		CONSTRAINT visit_explanation_nn not null,
	result_id			smallint,	
		CONSTRAINT visit_result_id_fk FOREIGN KEY(result_id) REFERENCES visit_result_pr(id),
	appointment_id		int,
		CONSTRAINT visit_appointment_id_fk FOREIGN KEY(appointment_id) REFERENCES appointment(appointment_no),	
	employee_id			int
		CONSTRAINT visit_employee_id_nn not null,
		CONSTRAINT visit_employee_id_fk FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
		CONSTRAINT visit_date_employee_un UNIQUE (visit_date,visit_hour,employee_id),
	last_update_date	datetime,
	record_date			datetime
		CONSTRAINT visit_record_date_nn not null,
)
;

DROP VIEW visit_vw_full;
CREATE VIEW visit_vw_full
as
select v.visit_no, v.customer_id,c.customer_name,c.customer_surname,v.place_id, p.place_name,
		v.goal_id, g.goal_name, v.visit_date,v.visit_hour,v.explanation,v.result_id,r.result_name,v.appointment_id,
		v.employee_id, e.employee_name,e.employee_surname,v.last_update_date,v.record_date
from visit v inner join customer c on v.customer_id=c.customer_id
				inner join place_pr p on  v.place_id=p.id
				inner join goal_pr g on v.goal_id=g.id
				inner join employee e on v.employee_id=e.employee_id
				left outer join visit_result_pr r on v.result_id=r.id
;

DROP VIEW appointment_vw_full;
CREATE VIEW appointment_vw_full
as
select a.appointment_no, a.customer_id,c.customer_name,c.customer_surname,a.place_id, p.place_name,
		a.goal_id, g.goal_name, a.appointment_date,a.appointment_hour,a.explanation,a.result_id,r.result_name,
		a.employee_id, e.employee_name,e.employee_surname,a.last_update_date,a.record_date
from appointment a inner join customer c on a.customer_id=c.customer_id
				inner join place_pr p on  a.place_id=p.id
				inner join goal_pr g on a.goal_id=g.id
				inner join employee e on a.employee_id=e.employee_id
				left outer join appointment_result_pr r on a.result_id=r.id
;

DROP VIEW login_vw;
CREATE VIEW login_vw
as
select u.username, u.password, e.employee_name, e.employee_surname, e.department_id
from users u inner join employee e on u.employee_id=e.employee_id
where e.leave_date is null
;

DROP VIEW employee_department_vw;
CREATE VIEW employee_department_vw
as
select e.employee_id, e.employee_name, e.employee_surname, d.id,d.department_name
from employee e inner join department d on e.department_id=d.id
where e.leave_date is null
;

DROP PROC t_dml_visit_insert;
CREATE PROC t_dml_visit_insert	
	@customer_id	int,
    @place_id		smallint,
    @goal_id		smallint,
    @visit_date		datetime,
    @visit_hour		char(4),
    @explanation	nvarchar(2000),
    @result_id		smallint,
    @appointment_id int,
    @employee_id	int
    --@last_update_date datetime,
    --@record_date,	datetime
AS
INSERT INTO visit
           (customer_id
           ,place_id
           ,goal_id
           ,visit_date
           ,visit_hour
           ,explanation
           ,result_id
           ,appointment_id
           ,employee_id
           ,last_update_date
           ,record_date)
     VALUES
           (@customer_id,
			@place_id,
			@goal_id,
			@visit_date	,
			@visit_hour	,
			@explanation,
			@result_id,
			@appointment_id,
			@employee_id,
			null,
			getdate())
GO
;

DROP PROC t_dml_appointment_insert;
CREATE PROC t_dml_appointment_insert	
	@customer_id	int,
    @place_id		smallint,
    @goal_id		smallint,
    @appointment_date datetime,
    @appointment_hour char(4),
    @explanation	nvarchar(2000),
    @result_id		smallint,
    @employee_id	int
    --@last_update_date, datetime,
    --@record_date, datetime
AS
INSERT INTO appointment
           (customer_id
           ,place_id
           ,goal_id
           ,appointment_date
           ,appointment_hour
           ,explanation
           ,result_id
           ,employee_id
           ,last_update_date
           ,record_date)
     VALUES
           (@customer_id,
           @place_id,
           @goal_id,
           @appointment_date,
           @appointment_hour,
           @explanation,
           @result_id,
           @employee_id,
           null,
           getdate())
GO
;

DROP PROC get_user;
CREATE PROC get_user
@username		nvarchar(10),
@password		nvarchar(20)
AS
select * from login_vw
where username=@username
  AND password=@password
GO
;


DROP PROC get_visits;
CREATE PROC get_visits
@employee_id	int,
@visit_date		datetime
AS
if @visit_date != null 
begin 
	select * from visit_vw_full
	where employee_id=@employee_id
	AND visit_date > @visit_date
end
else
begin
	select * from visit_vw_full
	where employee_id=@employee_id
end  
GO
;

DROP PROC get_appointments;
CREATE PROC get_appointments
@employee_id	int,
@appointment_date		datetime
AS
if @appointment_date != null 
begin 
	select * from appointment_vw_full
	where employee_id=@employee_id
	AND appointment_date > @appointment_date
end
else
begin
	select * from appointment_vw_full
	where employee_id=@employee_id
end  
GO
;

DROP PROC get_customer;
CREATE PROC get_customer
@tc_number		bigint
AS
select *
from customer
where tc_number=@tc_number
GO
;

CREATE TRIGGER appointment_to_visit ON appointment
FOR UPDATE
AS
IF UPDATE(result_id) 
 BEGIN
	DECLARE @result_id smallint
	select @result_id=(select result_id from inserted)
	if @result_id=3 or @result_id=4
	begin
	INSERT INTO visit
		select 
			customer_id
           ,place_id
           ,goal_id
           ,appointment_date
           ,appointment_hour
           ,explanation
           ,null
		   ,appointment_no
           ,employee_id
           ,null
           ,getdate()  from inserted	
	end	
 END
;

CREATE TRIGGER place_delete ON place_pr 
FOR DELETE
AS
 RAISERROR ('you cannot delete any place,change the statu of the place P(passive)',16,1)
 ROLLBACK TRAN
;

CREATE TRIGGER goal_delete ON goal_pr 
FOR DELETE
AS
 RAISERROR ('you cannot delete any place,change the statu of the place P(passive)',16,1)
 ROLLBACK TRAN
;

CREATE TRIGGER appointment_result_pr_delete ON appointment_result_pr 
FOR DELETE
AS
 RAISERROR ('you cannot delete any place,change the statu of the place P(passive)',16,1)
 ROLLBACK TRAN
;


CREATE TRIGGER visit_result_pr_delete ON visit_result_pr 
FOR DELETE
AS
 RAISERROR ('you cannot delete any place,change the statu of the place P(passive)',16,1)
 ROLLBACK TRAN
;

