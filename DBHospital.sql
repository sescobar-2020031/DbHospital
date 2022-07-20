/*
	NOMBRE DEL PROGRAMADOR: Samuel Isaac Escobar Vásquez
    CÓDIGO TÉCNICO: IN5AV
    CARNÉ: 2020031
    FECHA DE CREACIÓN:
		6/02/2021
    MODIFICACIONES:
		7/02/2021
        8/02/2021
        9/02/2021
        10/02/2021
  */
/*=========CREANDO Y USANDO DATABASE=========*/
drop database if exists DBHospitalInfectologia2020031;
create database DBHospitalInfectologia2020031;
use DBHospitalInfectologia2020031;
/*=========CREANDO TABLAS=========*/
create table Pacientes(
	codigoPaciente int not null auto_increment,
    DPI VARCHAR(20) not null,
    apellidos varchar(100) not null,
    nombres varchar(100) not null,
    fechaDeNacimiento DATE not null,
    edad int,
    direccion varchar(150) not null,
    ocupacion varchar(50) not null,
    sexo varchar(15) not null,
    primary key Pk_codigoPaciente(codigoPaciente)
);
create table ContactoUrgencia(
	codigoContactoUrgencia int not null auto_increment,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    numeroContacto varchar(10) not null,
    codigoPaciente int not null,
    primary key Pk_codigoContactoUrgencia(codigoContactoUrgencia),
    constraint FK_contactoUrgencia_pacientes
		foreign key(codigoPaciente) references Pacientes(codigoPaciente)
);
create table Areas(
	codigoArea int not null auto_increment,
    nombreArea varchar(45) not null,
    primary key Pk_codigoArea(codigoArea)
);
create table Cargos(
    codigoCargo INT NOT NULL AUTO_INCREMENT,
    nombreCargo VARCHAR(45) NOT NULL,
    PRIMARY KEY Pk_codigoCargo(codigoCargo)
);
create table ResponsableTurno(
    codigoResponsableTurno INT NOT NULL AUTO_INCREMENT,
    nombreResponsable VARCHAR(75) NOT NULL,
    apellidoResponsable VARCHAR(45) NOT NULL,
    telefonoPersonal VARCHAR(10) NOT NULL,
    codigoArea int NOT NULL,
    codigoCargo int NOT NULL,
    PRIMARY KEY Pk_codigoResponsableTurno(codigoResponsableTurno),
	constraint FK_responsableTurno_areas
		foreign key(codigoArea) references Areas(codigoArea),
	constraint FK_responsableTurno_cargos
		foreign key(codigoCargo) references Cargos(codigoCargo)
);
create table Medicos(
    codigoMedico INT NOT NULL AUTO_INCREMENT,
    licenciaMedica INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    horaEntrada DATETIME NOT NULL,
    horaSalida DATETIME NOT NULL,
    turnoMaximo INT NOT NULL,
    sexo varchar(20) NOT NULL,
    PRIMARY KEY Pk_codigoMedico(codigoMedico)
);
create table TelefonoMedico(
    codigoTelefonoMedico INT NOT NULL AUTO_INCREMENT,
    telefonoPersonal Varchar(15) NOT NULL,
    telefonoTrabajo Varchar(15),
    codigoMedico INT NOT NULL,
    PRIMARY KEY Pk_codigoTelefonoMedico(codigoTelefonoMedico),
    constraint FK_telefonosMedico_medicos
		foreign key(codigoMedico) references Medicos(codigoMedico)
);
create table Especialidades(
    codigoEspecialidad INT NOT NULL AUTO_INCREMENT,
    nombreEspecialidad Varchar(45) NOT NULL,
    primary key pkEspecilidades(codigoEspecialidad)
);	
create table Horarios(
    codigoHorario INT NOT NULL AUTO_INCREMENT,
    horaInicio datetime NOT NULL,
    horaSalida datetime NOT NULL,
    lunes boolean,
    martes boolean,
    miercoles boolean,
    jueves boolean,
    viernes boolean,
	primary key pkHorarios(codigoHorario)
);	
create table Medico_Especialidad(
    codigoMedicoEspecialidad INT NOT NULL AUTO_INCREMENT,
    codigoMedico INT NOT NULL,
    codigoEspecialidad INT NOT NULL,
    codigoHorario INT NOT NULL,
	primary key pkMedico_Especialidad(codigoMedicoEspecialidad),
    constraint FK_medicoEspecialidad_especialidades
		foreign key(codigoEspecialidad) references Especialidades(codigoEspecialidad),
	constraint FK_medicoEspecialidad_horarios
		foreign key(codigoHorario) references Horarios(codigoHorario),
	constraint FK_medicoEspecialidad_medicos
		foreign key(codigoMedico) references Medicos(codigoMedico)
);	
create table Turno(
    codigoTurno INT NOT NULL AUTO_INCREMENT,
    fechaTurno date NULL,
    fechaCita date NULL,
    valorCita decimal(10,2) NULL,
    codigoMedicoEspecialidad INT NOT NULL,
    codigoTurnoResponsable INT NOT NULL,
	codigoPaciente INT NOT NULL,
	primary key pkTurno(codigoTurno),
    constraint FK_turno_responsableTurno
		foreign key(codigoTurnoResponsable) references ResponsableTurno(codigoResponsableTurno),
	constraint FK_turno_pacientes
		foreign key(codigoPaciente) references Pacientes(codigoPaciente),
	constraint FK_turno_medicoEspecialidadd
		foreign key(codigoMedicoEspecialidad) references Medico_Especialidad(codigoMedicoEspecialidad)
);	
/*/////////////////AGREGANDO REGISTROS/////////////////*/
/*=================PACIENTES===================*/
/*------INGRESANDO PACIENTES------*/
insert into pacientes(DPI, nombres, apellidos, fechaDeNacimiento, edad, direccion, ocupacion, sexo) values(2320556340103,'Samuel Isaac','Fernández Gomez', '2004-10-4', 16 ,'4tava Avenida 1-87 ZONA 1 Guateamala', 'Informatica', 'HOMBRE');
insert into pacientes(DPI, nombres, apellidos, fechaDeNacimiento, edad, direccion, ocupacion, sexo) values(4268425456165,'Jonatan Jouse','Escobar Vasquez', '1997-12-6', 23 ,'9tava Avenida 8-97 ZONA 8 Guateamala', 'Informatico', 'HOMBRE');
insert into pacientes(DPI, nombres, apellidos, fechaDeNacimiento, edad, direccion, ocupacion, sexo) values(7858624035123,'Ana Gabriela','Guzman Rodriguez', '2000-11-21', 20 ,'7tava Avenida 2-12 ZONA 6 Guateamala', 'Doctora', 'MUJER');
insert into pacientes(DPI, nombres, apellidos, fechaDeNacimiento, edad, direccion, ocupacion, sexo) values(6482545038889,'Elí Jonathan','Vega Dominguez', '1998-8-28', 22 ,'1ra Avenida 0-1 ZONA 4 Guateamala', 'Aduanas', 'HOMBRE');
insert into pacientes(DPI, nombres, apellidos, fechaDeNacimiento, edad, direccion, ocupacion, sexo) values(7922740203542,'Angelica Mária','Rios Moreno', '1970-11-28', 50 ,'8tava Avenida 6-27 ZONA 1 Guateamala', 'Ama de casa', 'MUJER');
/*==============CONTACTO URGENCIA===================*/
/*----INGRESANDO LAS CONTACTOS DE URGENCIA DE PACIENTE------*/
insert into contactourgencia(nombres, apellidos, numeroContacto, codigoPaciente) values('Mynor','Lopez', 48652568, 1);
insert into contactourgencia(nombres, apellidos, numeroContacto, codigoPaciente) values('Javier','Linares', 51296874, 2);
insert into contactourgencia(nombres, apellidos, numeroContacto, codigoPaciente) values('Sheny','Vasquez', 56369452, 3);
insert into contactourgencia(nombres, apellidos, numeroContacto, codigoPaciente) values('Astrid','Mendez', 48790450, 4);
insert into contactourgencia(nombres, apellidos, numeroContacto, codigoPaciente) values('Daniela','Salazar', 51047565, 5);
/*------INGRESANDO LAS AREAS------*/
insert into areas(nombreArea) values('LABORATORIOS CLÍNICOS');
insert into areas(nombreArea) values('RADIODIAGNÓSTICO');
insert into areas(nombreArea) values('ANESTESIOLOGÍA');
insert into areas(nombreArea) values('MEDICINA INTERNA');
insert into areas(nombreArea) values('URGENCIAS');
/*================Cargos===================*/
/*------INGRESANDO LAS CARGOS------*/
insert into cargos(nombreCargo) values('Doctor');
insert into cargos(nombreCargo) values('Enfermero');
insert into cargos(nombreCargo) values('Jefe');
insert into cargos(nombreCargo) values('Enfermero');
insert into cargos(nombreCargo) values('Doctor');
/*=================RESPONSABLE TURNO===================*/
/*------INGRESANDO EL RESPONSABLE DEL TURNO------*/
insert into responsableturno(nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo) values('Alvaro','Alvarez',48956412,1,1);
insert into responsableturno(nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo) values('Raul','Maeda',41602563,2,2);
insert into responsableturno(nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo) values('Pedro','Medina',47898562,3,3);
insert into responsableturno(nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo) values('Juan','Gonzales',40102585,4,4);
insert into responsableturno(nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo) values('Mario','Ródriguez',41805020,5,5);
/*=================MEDICOS===================*/
/*------INGRESANDO DATOS DEL MEDICOS------*/
insert into medicos(licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo) values(2000703,'William','Osler','2021-02-10 7:17:24','2021-02-10 20:18:41',4,'Hombre');
insert into medicos(licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo) values(20048791,'Ignaz','Semmelweis','2021-02-10 8:3:20','2021-02-10 21:18:29',4,'Hombre');
insert into medicos(licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo) values(19974859,'Joseph','Lister','2021-02-10 7:30:56','2021-02-10 23:18:54',4,'Hombre');
insert into medicos(licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo) values(19924718,'Sigmund','Freud','2021-02-10 7:20:48','2021-02-11 7:15:34',3,'Hombre');
insert into medicos(licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo) values(19503764,'Gabriela','Escobar','2021-02-10 8:00:45','2021-02-11 6:02:36',5,'Mujer');
/*=================TELEFONO MEDICO===================*/
/*------INGRESANDO TELEFONOS DEL MEDICO------*/
insert into telefonomedico(telefonoPersonal, telefonoTrabajo, codigoMedico) values(58567416,49873645,1);
insert into telefonomedico(telefonoPersonal, telefonoTrabajo, codigoMedico) values(47851635,51642031,2);
insert into telefonomedico(telefonoPersonal, telefonoTrabajo, codigoMedico) values(47895462,47896431,3);
insert into telefonomedico(telefonoPersonal, telefonoTrabajo, codigoMedico) values(51254869,49603125,4);
insert into telefonomedico(telefonoPersonal, telefonoTrabajo, codigoMedico) values(42803645,51289746,5);
/*=================ESPECIALIDADES===================*/
/*------INGRESANDO LAS ESPECIALIDADES------*/
insert into especialidades(nombreEspecialidad) values('Medicina intensiva');
insert into especialidades(nombreEspecialidad) values('Radiólogo');
insert into especialidades(nombreEspecialidad) values('Anestesiología');
insert into especialidades(nombreEspecialidad) values('Medicina interna');
insert into especialidades(nombreEspecialidad) values('Medicina de emergencia');
/*=================HORARIOS===================*/
/*------INGRESANDO LOS HORARIOS------*/
insert into horarios(horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes) values('2021-02-10 7:00:00','2021-02-10 20:00:00',TRUE,TRUE,FALSE,TRUE,TRUE);
insert into horarios(horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes) values('2021-02-10 7:00:00','2021-02-10 21:00:00',TRUE,TRUE,TRUE,TRUE,FALSE);
insert into horarios(horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes) values('2021-02-10 7:00:00','2021-02-10 22:00:00',FALSE,TRUE,TRUE,TRUE,TRUE);
insert into horarios(horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes) values('2021-02-10 7:00:00','2021-02-10 21:00:00',FALSE,TRUE,TRUE,TRUE,FALSE);
insert into horarios(horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes) values('2021-02-10 00:00:00','2021-02-10 23:59:59',TRUE,TRUE,TRUE,TRUE,TRUE);
/*=================MEDICO_ESPECIALIDAD===================*/
/*------INGRESANDO LA ESPECIALIDAD DEL MEDICO------*/
insert into medico_especialidad(codigoMedico, codigoEspecialidad, codigoHorario) values(1,1,1);
insert into medico_especialidad(codigoMedico, codigoEspecialidad, codigoHorario) values(2,2,2);
insert into medico_especialidad(codigoMedico, codigoEspecialidad, codigoHorario) values(3,3,3);
insert into medico_especialidad(codigoMedico, codigoEspecialidad, codigoHorario) values(4,4,4);
insert into medico_especialidad(codigoMedico, codigoEspecialidad, codigoHorario) values(5,5,5);
/*=================TURNO===================*/
/*------INGRESANDO LOS TURNOS------*/
insert into turno(fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente) values('2021-02-10','2021-02-10',100.50,1,1,1);
insert into turno(fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente) values('2021-02-10','2021-02-10',100.50,2,2,2);
insert into turno(fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente) values('2021-02-10','2021-02-11',100.50,3,3,3);
insert into turno(fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente) values('2021-02-10','2021-02-11',100.50,4,4,4);
insert into turno(fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente) values('2021-02-10','2021-02-12',100.50,5,5,5);
/*/////////////////DROPS/////////////////*/
/*==============TelefonoMedico=================*/
Drop table telefonoMedico;
/*==================Turnos=====================*/
Drop table turno;
/*===========ResponsableDeTurno================*/
Drop table responsableTurno;
/*============MedicoEspecialidad===============*/
Drop table medico_Especialidad;
/*============ContactosDeUrgencia==============*/
Drop table contactoUrgencia;
/*==================Medico=====================*/
Drop table medicos;
/*=================Horarios====================*/
Drop table horarios;
/*==============Especialidades=================*/
Drop table especialidades;
/*=================Pacientes===================*/
Drop table Pacientes;
/*===================Areas=====================*/
Drop table areas;
/*==================Cargos=====================*/
Drop table cargos;
/*/////////////////UPDATE/////////////////*/
/*=================Pacientes===================*/
update Pacientes set DPI = 6288445456165, apellidos = 'Mendez Ovalle', nombres= 'Paula Isabella', fechaDeNacimiento = '2000/10/12', edad = 20, direccion = 'Boca del monte zona 2', ocupacion = 'Bombera' , sexo= 'Mujer'
	where codigoPaciente = 1;
/*============ContactosDeUrgencia==============*/
update contactourgencia set nombres = 'Pedro Isaac', apellidos = 'Armas Muñoz', numeroContacto = 42694599
	where codigoContactoUrgencia= 1;
/*===================Areas=====================*/
update Areas set nombreArea = 'Odontologia' where codigoArea = 1;
/*==================Cargos=====================*/
update Cargos set nombreCargo='Enfermero'	where codigoCargo = 1;
/*===========ResponsableDeTurno================*/
update responsableturno set nombreResponsable = 'Jonatan Emanuel', apellidoResponsable = 'Escobar Vasquez', telefonoPersonal = 48956412 where codigoResponsableTurno = 1;
/*==================Medico=====================*/
update Medicos set licenciaMedica = 19844578, nombres = 'Joselin', apellidos = 'Rodriguez', horaEntrada = '2021/02/10 7:00:00', horaSalida = '2021/02/10 20:00:00', turnoMaximo = 4, sexo = 'Mujer'
	where codigoMedico = 1;
/*==============TelefonoMedico=================*/
update TelefonoMedico set telefonoPersonal = 54120261, telefonoTrabajo = 45264524 where codigoTelefonoMedico = 1;
/*==============Especialidades=================*/
update Especialidades set nombreEspecialidad='Cardiologia' where codigoEspecialidad = 1;
/*=================Horarios====================*/
update Horarios set horaInicio = '2021/10/1 09:00:00', horaSalida = '2021/10/1 20:00:00', lunes = TRUE, martes = FALSE, miercoles = TRUE, jueves = TRUE, viernes = TRUE where codigoHorario = 1;
/*============MedicoEspecialidad===============*/
/*NO SE PUEDE HACER NINGUN UPDATE PORQUE TODOS LOS ATRIBUTOS SON LLAVES FORANEAS Y UNA LLAVE PRIMARIA*/
/*==================Turnos=====================*/
update Turno set fechaTurno = '2021-02-10', fechaCita = '2021-02-12', valorCita = 100 where codigoTurno = 1;
/*/////////////////DELETE/////////////////*/
/*==================Turnos=====================*/
DELETE FROM Turno Where codigoTurno = 1;
/*===========ResponsableDeTurno================*/
DELETE FROM responsableturno Where codigoResponsableTurno = 1;
/*============MedicoEspecialidad===============*/
DELETE FROM medico_especialidad Where codigoMedicoEspecialidad = 1;
/*============ContactosDeUrgencia==============*/
DELETE FROM contactourgencia Where codigoContactoUrgencia = 1;
/*=================Horarios====================*/
DELETE FROM Horarios Where codigoHorario = 1;
/*==============Especialidades=================*/
DELETE FROM Especialidades Where codigoEspecialidad = 1;
/*=================Pacientes===================*/
DELETE FROM pacientes Where codigoPaciente = 1;	
/*==============TelefonoMedico=================*/
DELETE FROM TelefonoMedico Where codigoPaciente = 1;
/*===================Areas=====================*/
DELETE FROM Areas Where codigoArea = 1;
/*==================Cargos=====================*/
DELETE FROM Cargos Where codigoCargo = 1;
/*==================Medico=====================*/
DELETE FROM Medicos Where codigoMedico = 1;
/*/////////////////SELECTS/////////////////*/
/*=================Pacientes===================*/
SELECT codigoPaciente, DPI, apellidos, nombres, fechaDeNacimiento, edad, direccion, ocupacion, sexo From Pacientes;
/*============ContactosDeUrgencia==============*/
SELECT codigoContactoUrgencia, nombres, apellidos, numeroContacto, codigoPaciente From contactourgencia;
/*===================Areas=====================*/
SELECT codigoArea, nombreArea From Areas;
/*==================Cargos=====================*/
SELECT codigoCargo, nombreCargo From Cargos;
/*===========ResponsableDeTurno================*/
SELECT codigoResponsableTurno, nombreResponsable, apellidoResponsable, telefonoPersonal, codigoArea, codigoCargo From responsableturno;
/*==================Medico=====================*/
SELECT codigoMedico, licenciaMedica, nombres, apellidos, horaEntrada, horaSalida, turnoMaximo, sexo From Medicos;
/*==============TelefonoMedico=================*/
SELECT codigoTelefonoMedico, telefonoPersonal, telefonoTrabajo, codigoMedico From TelefonoMedico;
/*==============Especialidades=================*/
SELECT codigoEspecialidad, nombreEspecialidad From Especialidades;
/*=================Horarios====================*/
SELECT codigoHorario, horaInicio, horaSalida, lunes, martes, miercoles, jueves, viernes From Horarios;
/*============MedicoEspecialidad===============*/
SELECT codigoMedicoEspecialidad, codigoMedico, codigoEspecialidad, codigoHorario From medico_especialidad;
/*==================Turnos=====================*/
SELECT codigoTurno, fechaTurno, fechaCita, valorCita, codigoMedicoEspecialidad, codigoTurnoResponsable, codigoPaciente From Turno;