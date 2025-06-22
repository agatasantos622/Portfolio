Create database Sistema_Faculdade
Use Sistema_Faculdade

Create table TBL_ALUNO (id int not null primary key auto_increment,
Nome varchar (100) not null,
Cpf varchar (45) not null,
Curso_Desejado varchar (45) not null);

Create table TBL_TELEFONE_ALUNO (id int not null primary key auto_increment,
Numero varchar (45) not null,
ID_Aluno int not null,
constraint fk_ALUNO_TELEFONE_ALUNO
foreign key (ID_Aluno)
references TBL_ALUNO (id));

Create table TBL_EMAIL_ALUNO (id int not null primary key auto_increment,
Email varchar (255) not null,
ID_Aluno int not null,
constraint fk_ALUNO_EMAIL_ALUNO 
foreign key (ID_Aluno)
references TBL_ALUNO (id));

Create table TBL_ENDERECO_ALUNO (id int not null primary key auto_increment,
Cep varchar (45) not null,
Logradouro varchar (45) not null,
Bairro varchar (45) not null,
Cidade varchar (45) not null,
Estado varchar (45) not null,
ID_Aluno int not null,
constraint fk_ALUNO_ENDERECO_ALUNO 
foreign key (ID_Aluno)
references TBL_ALUNO (id));

Create table TBL_TURMAS (id int not null primary key auto_increment,
Nome_Turma varchar (100) not null,
Status_Turma varchar (45) not null,
Numero_max_alunos varchar (45) not null,
Ano_Letivo varchar (45) not null);

Create table TBL_TURNO (id int not null primary key auto_increment,
Manha varchar (45) not null,
Tarde varchar (45) not null,
Noite varchar (45) not null,
Integral varchar (45) not null);

Create table TBL_TURMAS_TURNO (id int not null primary key auto_increment,
ID_Turmas int not null,
constraint fk_TURMAS_TURMAS_TURNO
foreign key (ID_Turmas)
references TBL_TURMAS (id),
ID_Turno int not null,
constraint fk_TURNO_TURMAS_TURNO
foreign key (ID_Turno)
references TBL_TURNO (id));

Create table TBL_HISTORICO_ESCOLAR (id int not null primary key auto_increment,
Ano_Letivo varchar (45) not null,
Data_Registro datetime not null,
Media_Final_Materia varchar (45) not null,
Situacao_Ano_letivo varchar (45) not null,
Total_faltas_Materia varchar (45) not null,
Situacao_Materia varchar (45) not null,
ID_Turmas int not null,
constraint fk_TURMAS_HISTORICO_ESCOLAR
foreign key (ID_Turmas)
references TBL_TURMAS (id),
ID_Aluno int not null,
constraint fk_ALUNO_HISTORICO_ESCOLAR 
foreign key (ID_Aluno)
references TBL_ALUNO (id));

Create table TBL_ALUNO_TURMAS (id int not null primary key auto_increment,
ID_Turmas int not null,
constraint fk_TURMAS_ALUNO_TURMAS
foreign key (ID_Turmas)
references TBL_TURMAS (id),
ID_Aluno int not null,
constraint fk_ALUNO_ALUNO_TURMAS 
foreign key (ID_Aluno)
references TBL_ALUNO (id));

Create table TBL_PROFESSORES (id int not null primary key auto_increment,
Nome varchar (100) not null,
Cpf varchar (45) not null,
Status_do_professor varchar (45) not null);

Create table TBL_TELEFONE_PROFESSOR (id int not null primary key auto_increment,
Numero varchar (45) not null,
ID_Professor int not null,
constraint fk_PROFESSORES_TELEFONE_PROFESSOR 
foreign key (ID_Professor)
references TBL_PROFESSORES (id));

Create table TBL_EMAIL_PROFESSOR (id int not null primary key auto_increment,
Email varchar (255) not null,
ID_Professor int not null,
constraint fk_PROFESSORES_EMAIL_PROFESSOR 
foreign key (ID_Professor)
references TBL_PROFESSORES (id));

Create table TBL_PERFIL_ACADEMICO_PROFESSOR (id int not null primary key auto_increment,
Titulacao varchar (45) not null,
Formacao_Principal varchar (45) not null,
Disciplinas_aptas_a_lecionar varchar (45) not null,
experiencia_Docente varchar (45) not null,
ID_Professor int not null,
constraint fk_PROFESSORES_PERFIL_ACADEMICO_PROFESSOR 
foreign key (ID_Professor)
references TBL_PROFESSORES (id));

Create table TBL_TURMAS_PROFESSORES (id int not null primary key auto_increment,
ID_Professor int not null,
constraint fk_PROFESSORES_TURMAS_PROFESSORES 
foreign key (ID_Professor)
references TBL_PROFESSORES (id),
ID_Turmas int not null,
constraint fk_TURMAS_TURMAS_PROFESSORES
foreign key (ID_Turmas)
references TBL_TURMAS (id));

Create table TBL_MATERIA (id int not null primary key auto_increment,
Nome_Materia varchar(100) not null,
Descricao text(100),
Carga_Horaria decimal(5,1),
ID_Professor int not null,
constraint fk_PROFESSORES_MATERIA
foreign key (ID_Professor)
references TBL_PROFESSORES (id));

Create table TBL_MATERIAL (id int not null primary key auto_increment,
Livros varchar(300) not null,
Artigos_Cientificos varchar(300) not null,
Links_Videos varchar(300) not null,
Documentos varchar(300) not null,
ID_Materia int not null,
constraint fk_MATERIA_MATERIAL
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_MATERIA_PROFESSORES (id int not null primary key auto_increment,
ID_Professor int not null,
constraint fk_PROFESSORES_MATERIA_PROFESSORES 
foreign key (ID_Professor)
references TBL_PROFESSORES (id),
ID_Materia int not null,
constraint fk_MATERIA_MATERIA_PROFESSORES
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_MATERIA_TURMAS (id int not null primary key auto_increment,
ID_Turmas int not null,
constraint fk_TURMAS_MATERIA_TURMAS
foreign key (ID_Turmas)
references TBL_TURMAS (id),
ID_Materia int not null,
constraint fk_MATERIA_MATERIA_TURMAS
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_CURSOS (id int not null primary key auto_increment,
Nome_Curso varchar(100) not null,
Nivel_Ensino varchar(45) not null,
Status_Curso varchar(45) not null,
Carga_horaria_total decimal(5,1) not null);

Create table TBL_CURSOS_MATERIA (id int not null primary key auto_increment,
ID_Curso int not null,
constraint fk_CURSOS_CURSOS_MATERIA
foreign key (ID_Curso)
references TBL_CURSOS (id),
ID_Materia int not null,
constraint fk_MATERIA_CURSOS_MATERIA
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_CURSOS_TURMAS (id int not null primary key auto_increment,
ID_Turmas int not null,
constraint fk_TURMAS_CURSOS_TURMAS
foreign key (ID_Turmas)
references TBL_TURMAS (id),
ID_Materia int not null,
constraint fk_MATERIA_CURSOS_TURMAS
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_HISTORICO_ESCOLAR_MATERIA (id int not null primary key auto_increment,
Media_Final decimal(4,2) not null,
Situacao varchar(45) not null,
Total_Faltas decimal(3,0) Not null,
Situacao_Materia varchar(45) not null,
ID_Historico_Escolar int not null,
constraint fk_HISTORICO_ESCOLAR_HISTORICO_ESCOLAR_MATERIA
foreign key (ID_Historico_Escolar)
references TBL_HISTORICO_ESCOLAR (id),
ID_Materia int not null,
constraint fk_MATERIA_HISTORICO_ESCOLAR_MATERIA
foreign key (ID_Materia)
references TBL_MATERIA (id));

Create table TBL_AVALIACAO (id int not null primary key auto_increment,
Peso_avaliacao decimal(3,2) not null,
Valor_nota decimal(3,2) not null,
Data_avaliacao datetime Not null,
Tipo_avaliacao varchar(45) not null,
Observacao_Professor text(500),
Periodo_avaliacao varchar(45) not null,
ID_Aluno int not null,
constraint fk_ALUNO_AVALIACAO 
foreign key (ID_Aluno)
references TBL_ALUNO (id),
ID_Materia int not null,
constraint fk_MATERIA_AVALIACAO 
foreign key (ID_Materia)
references TBL_MATERIA (id));