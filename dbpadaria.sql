-- apagando banco de dados se existir
drop database dbpadaria;

-- criando banco de dados 
create database dbpadaria;

-- acessar o banco de dados
use dbpadaria; 

--criando as tabelas no banco de dados
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
primary key(codForn));

create table tbClientes(
codCli int not null auto_increment,
nome varchar (100) not null,
cpf char(14) not null unique,
email varchar(100) unique,
primary key(codCli));

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc));



create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));

create table tbVendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quantidade decimal (9,2) default 0 check(quantidade >=0),
valor decimal  (9,2) default 0 check(valor >=0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVend),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli));

-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbGenero;
desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbVendas;
desc tbClientes;
desc tbProdutos;

--inserindo registros nas tabelas

--tbClientes
insert into tbClientes(nome,cpf,email)
	values('Nauan Dev1','12345678912', 'nauanDev1@gmail.com');

insert into tbClientes(nome,cpf,email)	
	values('Mauro Alves','98765432198', 'mauro@gmail.com');

--tbFuncionarios
insert into tbFuncionarios(nome,email,telCel,dataNasc, salario, sexo);
	values('Vitu da Mecanica', 'vitu@mecaninca.com.br', '11972348920', '2005-03-15', 500.00, 'M');

--Fornecedores
insert into tbFornecedores(nome, email, telCel);
	values('coronapack', 'coronapack@corana.com.br', '40028922');

insert into tbFornecedores(nome, email, telCel);
	values('therma', 'therma@therma.com.br', '525252989');	

--tbUsuarios
insert into tbUsuarios(nome, senha, codFunc),
	values('Igor das Tias', '2212', 1);

--visualizando registros nas tabelas

select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbUsuarios;	