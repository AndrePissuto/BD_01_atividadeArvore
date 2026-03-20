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

insert into pessoa values
(default, 'joao', null, null),
(default, 'dita', null, null),
(default, 'zulmiro', null, null),
(default, 'claudenir', null, null),
(default, 'cica', null, null),
(default, 'regina', null, null),
(default, 'andre', null, null);


update pessoa set fkpai = 1 where idPessoa = 5;
update pessoa set fkmae = 2 where idPessoa = 5;
update pessoa set fkpai = 3 where idPessoa = 6;
update pessoa set fkmae = 4 where idPessoa = 6;
update pessoa set fkpai = 5 where idPessoa = 7;
update pessoa set fkmae = 6 where idPessoa = 7;



select p.nome,  tblpai.nome as 'pai', tblmae.nome as 'mae', tblvomaterna.nome as 'avó materna', tblavomaterno.nome as 'avô materno', tblvopaterna.nome as 'vó materna', tblavopaterna.nome as 'avô paterno' 
from pessoa as p
 join pessoa as tblpai on tblpai.idPessoa = p.fkPai
 join pessoa as tblmae on tblmae.idPessoa = p.fkmae
 join pessoa as tblvomaterna on tblvomaterna.idPessoa = tblmae.fkmae
 join pessoa as tblavomaterno on tblavomaterno.idPessoa = tblmae.fkpai
 join pessoa as tblvopaterna on tblvopaterna.idPessoa = tblpai.fkmae
 join pessoa as tblavopaterna on tblavopaterna.idPessoa = tblpai.fkpai;

select p.nome,  p.fkpai as 'pai', p.fkmae as 'mae' from pessoa as p;


select * from pessoa;