create database arvore;
use arvore;

create table pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    fkpai int,
    constraint fkpai foreign key (fkpai) references pessoa(idPessoa),
    fkmae int, 
    constraint fkmae foreign key (fkmae) references pessoa(idPessoa)
);

select * from pessoa;

insert into pessoa (idPessoa, nome, fkpai, fkmae) values
(default, 'joao', null, null),
(default, 'dita', null, null),
(default, 'zulmiro', null, null),
(default, 'claudenir', null, null),
(default, 'cica', null, null),
(default, 'regina', null, null),
(default, 'andre', null, null);

insert into pessoa values(default, 'lucas', 5,6);

update pessoa set fkpai = 1 where idPessoa = 5;
update pessoa set fkmae = 2 where idPessoa = 5;
update pessoa set fkpai = 3 where idPessoa = 6;
update pessoa set fkmae = 4 where idPessoa = 6;
update pessoa set fkpai = 5 where idPessoa = 7;
update pessoa set fkmae = 6 where idPessoa = 7;

update pessoa set fkpai = 14 where idPessoa = 3;
update pessoa set fkmae = 13 where idPessoa = 3;

insert into pessoa values
(default, 'angela', null, null),
(default, 'alexandre', null, null);

insert into pessoa values
(default, 'clementina', null, null),
(default, 'Serafim', null, null);


select p.nome,  ifnull(tblpai.nome, 'pessoa nao inserida') as 'pai', ifnull(tblmae.nome, 'pessoa nao inserida')  as 'mae', ifnull(tblvomaterna.nome, 'pessoa nao inserida') as 'avó materna', ifnull(tblavomaterno.nome, 'pessoa nao inserida') as 'avô materno', ifnull(tblvopaterna.nome, 'pessoa nao inserida') as 'vó materna', ifnull(tblavopaterna.nome, 'pessoa nao inserida') as 'avô paterno' 
from pessoa as p
 join pessoa as tblpai on tblpai.idPessoa = p.fkPai
 join pessoa as tblmae on tblmae.idPessoa = p.fkmae
 join pessoa as tblvomaterna on tblvomaterna.idPessoa = tblmae.fkmae
 join pessoa as tblavomaterno on tblavomaterno.idPessoa = tblmae.fkpai
 join pessoa as tblvopaterna on tblvopaterna.idPessoa = tblpai.fkmae
 join pessoa as tblavopaterna on tblavopaterna.idPessoa = tblpai.fkpai;
 
SELECT * FROM pessoa;

select p.nome,  p.fkpai as 'pai', p.fkmae as 'mae' from pessoa as p;


select * from pessoa;