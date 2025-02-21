-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados

create table tbGenero(
codGen int not null auto_increment,
nome varchar(100),
primary key(codGen));

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
email varchar(100),
primary key(codCli));

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
codGen int not null,
primary key(codFunc),
foreign key(codGen)references tbGenero(codGen));

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