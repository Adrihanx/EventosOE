create database OE;
use OE;
create table Admin(
	idAdmin int
	,nombre varchar(50)
	,pass varchar(50)
	,status tinyint(1)
	,primary key(idAdmin)
);
<--- Activo 1 / Inactivo 0 ----->
insert into Admin values
	(1,'root',sha1('toor'),1);
create table Area(
	idArea int
	,nombreArea varchar(60)
	,primary key(idArea)
);

create table ProgramaEducativo(
	idPE int
	,nombreCarrera varchar(50)
	,Area int
	,primary key(idPE)
	,foreign key(Area) references Area(idArea)
);
insert into ProgramaEducativo values
	(1,'Ingeniería en Mecatrónica',1),
	(2,'Ingeniería en Telemática',1),
	(3,'Ingeniería en Sistemas Computacionales',1),
	(4,'Licenciatura en Admiinistración y Gestión de PyMES',2),
	(5,'Ingeniería en Tecnologías de Manufactura',1),
	(6,'Licenciatura en Negocios Internacionales',2),
	(7,'Ingeniería en Tecnología Automotriz',2),
create table Asistente(
	idAsistente int
	,Matricula int
	,Nombre varchar(20)
	,aPaterno varchar(20)
	,aMaterno varchar(20)
	,PE int
	,primary key(idAsistente)
	,foreign key(PE) references ProgramaEducativo(idPE)
);
create table Evento(
	idEvento int
	,FechaEvento datetime
	,nombreEvento varchar(50)
	,primary key(idEvento)
);
create table Asistencia(
	idAsistencia int
	,asistente int
	,evento int
	,entrada time
	,primary key(idAsistencia)
	,foreign key(asistente) references Asistente(idAsistente)
	,foreign key(evento) references Evento(idEvento)
);