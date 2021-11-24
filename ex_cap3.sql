create table mesas(
	id int not null primary key,
	mesa_codigo varchar(20),
	mesa_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);




create table funcionarios(
	id int not null primary key,
	funcionario_codigo varchar(20),
	funcionario_nome varchar(100),
	funcionario_situacao varchar(1) default 'A',
	funcionario_comissao real, 
	funcionario_cargo varchar(30),
	data_criacao timestamp,
	data_atualizacao timestamp
);

create table vendas(
	id int not null primary key,
	funcionario_id int REFERENCES funcionarios(id),
	mesa_id int REFERENCES mesas(id),
	venda_codigo varchar(20),
	venda_valor real, 
	venda_total real, 
	venda_desconto real,
	venda_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

create table produtos(
	id int not null primary key,
	produto_codigo varchar(20),
	produto_nome varchar(60),
	produto_valor real,
	produto_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

create table itens_vendas(
	id int not null primary key,
	produto_id int not null REFERENCES produtos(id),
	vendas_id int not null references vendas(id),
	item_valor real,
	item_quantidade int,
	item_total real, 
	data_criacao timestamp,
	data_atualizacao timestamp
);

create table comissoes(
	id int not null ,
	funcionario_id int ,
	comissao_valor real,
	comissao_situacao int,
	data_criacao timestamp,
	data_atualizacao timestamp
);

alter table comissoes add constraint comissoes_pkey primary key(id);
alter table comissoes add foreign key (funcionario_id) references funcionarios(id) ;

/* As sequences funcionam como PKs, porém não são exibidas em uma consulta ao banco*/
/* nomeDobanco_id_seq será o padrão das sequences*/

create sequence funcioanario_id_seq;
create sequence mesas_id_seq;
create sequence comissoes_id_seq;
create sequence itensVendas_id_seq;;
create sequence vendas_id_seq;
create sequence produtos_id_seq;

/* vincular as sequences as tabelas*/
alter table mesa alter id set default nextval('mesas_id_seq');
alter table funcionarios alter id set default nextval('funcioanario_id_seq');
alter table comissoes alter id set default nextval('comissoes_id_seq');
alter table itens_vendas alter id set default nextval(' itensVendas_id_seq');
alter table vendas alter id set default nextval('vendas_id_seq');
alter table produtos alter id set default nextval('produtos_id_seq');

/* podemos utilizar o comando drop sequence nome_sequence cascade(caso esteja associada a tabelas)*/

/*Para adicionarmos uma coluna em uma tabela*/
alter table comissoes add column data_pagamento int;

/*alterando data_pagamento para receber datas */
alter table comissoes add column data_pagamento_timestamp timestamp;
alter table comissoes alter column data_pagamento type timestamp 
using data_pagamento_timestamp;

alter table comissoes drop column data_pagamento_timestamp;








