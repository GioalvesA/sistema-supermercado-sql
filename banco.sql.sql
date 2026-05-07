create database db_mercadinho;

use db_mercadinho;


# USADO PARA CRIAR TABELA CLIENTE
create table tbl_cliente (
  id  int not null auto_increment primary key,
  nome varchar(50) not null,
  cpf varchar(11) not null unique,
  rg varchar(15) not null

);



create table tbl_telefone (
  id int auto_increment primary key,
  numero varchar(16) not null,
  id_cliente int not null,
  
  constraint fk_telefone_cliente
  foreign key (id_cliente)
  references tbl_cliente(id)
  
 );
 
 
 
 
 create table tbl_email (
  id int auto_increment primary key,
  email varchar (255) not null,
  id_cliente int not null,
  
  constraint fk_email_cliente
  foreign key (id_cliente)
  references tbl_cliente(id) 
  
  );
  
  
  
  
  create table tbl_endereco_cliente (
    id int auto_increment primary key,
    rua varchar(100) not null,
    cidade varchar(45) not null,
    numero varchar(10) not null,
    estado char(2) not null,
    cep varchar(20) not null,
    id_cliente int not null,
    
    constraint fk_endereco_cliente
    foreign key (id_cliente)
    references tbl_cliente(id)
    

  );
  
  
  
  
  
  create table tbl_colaborador (
   id int auto_increment primary key,
   nome varchar(45) not null,
   cpf varchar(11) not null,
   cargo varchar(20) not null
  
  );
  
  
  
  
  
  create table tbl_colaborador_telefone (
    id int auto_increment primary key,
    numero varchar(16) not null,
    id_colaborador int not null,
    
    constraint fk_telefone_colaborador
    foreign key (id_colaborador)
    references tbl_colaborador(id)
  
  );
  
  
  
  
  create table tbl_endereco_colaborador(
    id int auto_increment primary key,
    rua varchar(100) not null,
    cidade varchar(45) not null,
    cep varchar(20) not null,
    numero varchar(10) not null,
    estado char(2) not null,
    id_colaborador int not null,
  
  constraint fk_endereco_colaborador
  foreign key (id_colaborador)
  references tbl_colaborador(id)
  
  );
  
# PRODUTOS DO MERCADO

  create table tbl_produto (
  id int auto_increment primary key,
  categoria varchar(45) not null,
  estoque_atual int not null  default 0,
  valor_produto decimal(10,2) not null
  
  );
  
  
  # REGISTRO DE VENDA
  
  create table tbl_venda (
  id int auto_increment primary key,
  data_venda datetime not null,
  forma_pagamento varchar(45) not null,
  valor_total decimal(10,2) not null,
  
  id_colaborador int not null,
  id_cliente int not null,
  
  constraint fk_venda_colaborador
  foreign key (id_colaborador)
  references tbl_colaborador(id),
  
  constraint fk_venda_cliente
  foreign key (id_cliente)
  references tbl_cliente(id)
  
  );
  
  
  # ITENS DA VENDA, RELACIONAMENTO N:N 
  
  create table tbl_vendas_produtos(
  id int auto_increment primary key,
  
  id_produto int not null,
  id_venda int not null,
  
  qtde int not null,
  valor_uni decimal(10,2) not null,
  
  
  #FK PARA PRODUTO
  constraint fk_vp_produto
  foreign key(id_produto)
  references tbl_produto(id),
  
  #FK PARA VENDA
  constraint fk_vp_venda
  foreign key (id_produto)
  references tbl_venda(id)
  
  );
  




