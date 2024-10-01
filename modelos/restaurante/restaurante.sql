CREATE SCHEMA Restaurante;
USE Restaurante;

CREATE TABLE atendente(
	idAtendente smallint unsigned not null PRIMARY KEY check (idAtendente between 001 and 999),
    nome varchar(55) not null,
    telefone varchar(12) not null,
    salario smallint unsigned not null
);

CREATE TABLE cliente(
    CPF smallint zerofill unique,
    nome varchar(55),
    endereco varchar(255),
    fk_mesa smallint not null primary key,
    foreign key (fk_mesa) references pedido(mesa)
);


CREATE TABLE pedido(
	mesa SMALLINT PRIMARY KEY CHECK (mesa between 01 and 99),
    inicio time not null,
    fim time not null,
    valorTotal smallint unsigned not null,
    fk_idAtendente smallint unsigned not null,
    foreign key (fk_idAtendente) references atendente(idAtendente),
	fk_codigoItem smallint not null auto_increment,
    foreign key (fk_codigoItem) references item(codigo)
);


CREATE TABLE item_pedido(
	id_itemPedido SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	item_codigo SMALLINT NOT NULL,
    foreign key (item_codigo) references item(codigo),
    pedido_mesa SMALLINT NOT NULL,
    foreign key (pedido_mesa) references pedido(mesa)
);

CREATE TABLE item(
	codigo smallint not null primary key auto_increment,
    nomeItem varchar(55) not null,
    precoItem smallint unsigned not null
);