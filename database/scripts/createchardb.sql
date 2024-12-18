create table t_characters (
	id numeric(4) not null,
	class varchar(25) not null,
	job varchar(50) not null,
	origin varchar(25) not null,
	description text,
	constraint PK_ID primary key (id)
);

create table t_classes (
	id_class numeric(4) not null,
	name varchar(25) not null,
	specialization varchar(25) not null,
	overclass_first numeric(4),
	overclass_second numeric(4),
	constraint PK_IDCLASS primary key (id_class)
);

create table t_overclasses (
	id_overclass numeric(4) not null,
	name varchar(25) not null,
	specialization varchar(25) not null,
	underclass numeric(4) not null,
	constraint PK_IDOVERCLASS primary key (id_overclass)
);

alter table t_classes
	add constraint FK_OVERCLASSFIRST foreign key (overclass_first) references t_overclasses (id_overclass) on delete restrict on update restrict;

alter table t_classes
	add constraint FK_OVERCLASSSECOND foreign key (overclass_second) references t_overclasses (id_overclass) on delete restrict on update restrict;

alter table t_overclasses
	add constraint FK_CLASS foreign key (underclass) references t_classes (id_class) on delete restrict on update restrict;

create table t_jobs (
	id_job numeric(4) not null,
	name varchar(25) not null,
	specialization varchar(25) not null,
	constraint PK_IDJOB primary key (id_job)
);

create table origins (
	id_origin numeric(4) not null,
	continent varchar(25) not null,
	land varchar(25) not null,
	city varchar(25) not null,
	constraint PK_ORIGIN primary key (id_origin)
)