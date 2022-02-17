CREATE DATABASE NETFLIX;
USE NETFLIX;

#Plano (codPlano, nome, preco, qualidade, resolucao, disponibilidade);
CREATE TABLE Plano(codPlano integer, nome varchar(20), preco float, qualidade varchar(20), resolucao varchar(20), disponibilidade boolean,
PRIMARY KEY(codPlano)
) Engine=iNNODB;

#Forma-pagamento (codFormPag, tipo);
CREATE TABLE formaPagamento(codFormPag integer, tipo varchar(20),
PRIMARY KEY(codFormPag)
) Engine=iNNODB;

#Usuário (codUsuario, nome, sobrenome, email, senha, #codPlano, #codFormaPagamento);
CREATE TABLE Usuario(codUsuario integer, nome varchar(20), sobrenome varchar(20), email varchar(40), senha varchar(30), codPlano integer,
PRIMARY KEY(codUsuario),
FOREIGN KEY(codPlano) REFERENCES Plano(codPlano)
) Engine=iNNODB;

#CartaoCreditoDebito(#codFormPag, codCartaoCredDebito, nome, sobrenome, numCartao,dataValidade, codigoCVV);
CREATE TABLE CartaoCreditoDebito(codFormPag integer, codCartaoCredDebito integer, nome varchar(20), sobrenome varchar(20), numCartao varchar(20), dataValidade date, codigoCVV integer,
PRIMARY KEY(codCartaoCredDebito),
FOREIGN KEY (codFormPag) REFERENCES formaPagamento(codFormPag)
) Engine=iNNODB;

#CartaoPrePago (#codFormPag, codCartaoPrePago, PIN);
CREATE TABLE CartaoPrePago(codFormPag integer, codCartaoPrePago integer, PIN varchar(30),
PRIMARY KEY(codCartaoPrePago),
FOREIGN KEY (codFormPag) REFERENCES formaPagamento(codFormPag)
) Engine=iNNODB;

#Perfil (codPerfil, nome, classificacaoEtaria, iniciaEpisodioAutomaticamente, reproduzAutomaticamentePrevias);
CREATE TABLE Perfil(codPerfil integer, nome varchar(20), classEtaria integer, iniEpAuto boolean,
PRIMARY KEY(codPerfil)
) Engine=iNNODB;

#Conteúdo (codConteudo, nome, criacao, classificacao, relevancia, tipoConteudo);
CREATE TABLE Conteudo(codConteudo integer, nome varchar(30), criacao date, classEtaria integer, relevancia integer,
PRIMARY KEY(codConteudo)
) Engine=iNNODB;

#Gênero (codGenero, nome, descricao);
CREATE TABLE Genero(codGenero integer, nome varchar(20), descricao varchar(100),
PRIMARY KEY(codGenero)
) Engine=iNNODB;

#Cenas-momentos (codCenasMomentos, nome, descricao);
CREATE TABLE cenasMomentos(codCenasMomentos integer, nome varchar(20), descricao varchar(100),
PRIMARY KEY(codCenasMomentos)
) Engine=iNNODB;

#Serie (#codConteudo, quantTemporadas);
CREATE TABLE Serie(codConteudo integer, quantTemporadas integer,
PRIMARY KEY(codConteudo),
FOREIGN KEY (codConteudo) REFERENCES Conteudo(codConteudo)
) Engine=iNNODB;

#Filme (#codConteudo, tempoDuracao);
CREATE TABLE Filme(codConteudo integer, tempoDuracao time,
PRIMARY KEY(codConteudo),
FOREIGN KEY (codConteudo) REFERENCES Conteudo(codConteudo)
) Engine=iNNODB;

#Ator (codAtor, nome, sobrenome);
CREATE TABLE Ator(codAtor integer, nome varchar(20), sobrenome varchar(20),
PRIMARY KEY(codAtor)
) Engine=iNNODB;

#Personagem (codPersonagem, nome, sobrenome, #codConteudo, #codAtor).
CREATE TABLE Personagem(codPersonagem integer, nome varchar(20), sobrenome varchar(20), codConteudo integer, codAtor integer,
PRIMARY KEY (codPersonagem),
FOREIGN KEY (codConteudo) REFERENCES Conteudo(codConteudo),
FOREIGN KEY (codAtor) REFERENCES Ator(codAtor)
) Engine=iNNODB;

#tabela PlanoPagto
CREATE TABLE PlanoPagto(codPlano integer, codFormPag integer,
PRIMARY KEY(codPlano,codFormPag),
FOREIGN KEY(codPlano) REFERENCES Plano(codPlano),
FOREIGN KEY(codFormPag) REFERENCES formaPagamento(codFormPag)
) Engine=iNNODB;

#tabela  ConteudoGeneroCenasMomentos
CREATE TABLE conteudoGeneroCenasMomentos(codConteudo integer, codGenero integer, codCenasMomentos integer,
PRIMARY KEY(codConteudo, codGenero, codCenasMomentos),
FOREIGN KEY(codConteudo) REFERENCES Conteudo(codConteudo),
FOREIGN KEY(codGenero) REFERENCES Genero(codGenero),
FOREIGN KEY(codCenasMomentos) REFERENCES cenasMomentos(codCenasMomentos)
) Engine=iNNODB;

INSERT INTO Plano VALUES (1, 'Básico', '25.90', 'Boa', '480p', True);
INSERT INTO Plano VALUES (2, 'Padrão', '39.90', 'Melhor', '1080p', True);
INSERT INTO Plano VALUES (3, 'Premium', '55.90', 'Superior ', '4K+HDR', True);

INSERT INTO formaPagamento VALUES (1, 'CartaoCreditoDebito');
INSERT INTO formaPagamento VALUES (2, 'CartaoPrePago');

INSERT INTO Usuario VALUES(1, 'Yuri', 'Araujo', 'yuri.araujo@unifesp.br', '1234', '3');
INSERT INTO Usuario VALUES(2, 'Victor', 'Akio', 'victor.domoto@unifesp.br', '4321', '2');
INSERT INTO Usuario VALUES(3, 'Henrique', 'Andrade', 'Henrique.Andrade@unifesp.br', '2424', '1');
INSERT INTO Usuario VALUES(4, 'Ana', 'Santos', 'ana.santos@unifesp.br', '5469', '2');
INSERT INTO Usuario VALUES(5, 'Maria', 'Silva', 'maria.silva@unifesp.br', '7896', '3');


INSERT INTO CartaoCreditoDebito VALUES(1, 1, 'Yuri', 'Araujo', '0000 1111 2222 3333', '2026-02-09', 199);
INSERT INTO CartaoCreditoDebito VALUES(1, 2, 'Victor', 'Domoto', '1111 1111 2222 3333', '2026-03-10', 299);
INSERT INTO CartaoCreditoDebito VALUES(1, 3, 'Henrique', 'Andrade', '2222 1111 2222 3333', '2026-04-11', 399);
INSERT INTO CartaoCreditoDebito VALUES(1, 4, 'Ana', 'Santos', '3333 1111 4444 7777', '2025-07-12', 156);
INSERT INTO CartaoCreditoDebito VALUES(1, 5, 'Maria', 'Silva', '4444 7896 1254 6532', '2022-11-12', 986);
INSERT INTO CartaoCreditoDebito VALUES(2, 6, 'João', 'Pedro', '5555 6589 8759 9832', '2029-10-02', 986);


INSERT INTO Perfil VALUES (1, 'Yuri', 18, false);
INSERT INTO Perfil VALUES (2, 'Victor', 18, false);
INSERT INTO Perfil VALUES (3, 'Julio', 14, true);
INSERT INTO Perfil VALUES (4, 'Ana', 16, false);
INSERT INTO Perfil VALUES (5, 'Maria', 10, true);

INSERT INTO Conteudo VALUES (1, 'The Witcher', '2019-12-20', 18, 99);
INSERT INTO Conteudo VALUES (2, 'Peaky Blinders', '2013-09-12', 18, 94);
INSERT INTO Conteudo VALUES (3, 'Arcane', '2021-09-06', 14, 100);
INSERT INTO Conteudo VALUES (4, 'Breaking Bad', '2008-01-20', 18, 98);
INSERT INTO Conteudo VALUES (5, 'Suits', '2011-07-23', 14, 98);

INSERT INTO Ator VALUES (1, 'Tom', 'Hanks');
INSERT INTO Ator VALUES (2, 'Will', 'Smith');
INSERT INTO Ator VALUES (3, 'Meryl', 'Streep');
INSERT INTO Ator VALUES (4, 'Tom', 'Crise');
INSERT INTO Ator VALUES (5, 'Camila', 'Queiroz');
INSERT INTO Ator VALUES (6, 'Henry', 'Cavill');
INSERT INTO Ator VALUES (7, 'Cillian', 'Murphy');
INSERT INTO Ator VALUES (8, 'Ella', 'Purnell');
INSERT INTO Ator VALUES (9, 'Bryan', 'Cranston');
INSERT INTO Ator VALUES (10, 'Gabriel', 'Macht');


INSERT INTO CartaoPrePago VALUES (2, 1, 'a123bc');
INSERT INTO CartaoPrePago VALUES (2, 2, '5a6s5e');
INSERT INTO CartaoPrePago VALUES (2, 3, '9a8e7r');
INSERT INTO CartaoPrePago VALUES (2, 4, '2a5w62');
INSERT INTO CartaoPrePago VALUES (2, 5, '85a2e1');

INSERT INTO cenasMomentos VALUES (1, 'Violência', 'Contém cenas com violencia');
INSERT INTO cenasMomentos VALUES (2, 'Empolgantes', 'Contém cenas empolgantes');
INSERT INTO cenasMomentos VALUES (3, 'Irreverentes', 'Contém cenas irreverentes');
INSERT INTO cenasMomentos VALUES (4, 'Suspense no ar', 'Contém cenas com suspense');
INSERT INTO cenasMomentos VALUES (5, 'Humor seco', 'Contém cenas com humor seco');


INSERT INTO Genero VALUES (1, 'Anime', 'contém animação');
INSERT INTO Genero VALUES (2, 'Ação', 'contém ação');
INSERT INTO Genero VALUES (3, 'Drama', 'contém drama');
INSERT INTO Genero VALUES (4, 'Comédia', 'contém comédia');
INSERT INTO Genero VALUES (5, 'Aventura', 'contém aventura');

INSERT INTO conteudoGeneroCenasMomentos VALUES (1, 5, 2);
INSERT INTO conteudoGeneroCenasMomentos VALUES (2, 3, 1);
INSERT INTO conteudoGeneroCenasMomentos VALUES (3, 4, 3);
INSERT INTO conteudoGeneroCenasMomentos VALUES (4, 2, 2);
INSERT INTO conteudoGeneroCenasMomentos VALUES (5, 1, 4);

INSERT INTO Conteudo VALUES (6, 'Ilha do Medo', '2010-05-16', 16, 92);
INSERT INTO Conteudo VALUES (7, 'El Camino', '2019-08-13', 16, 90);
INSERT INTO Conteudo VALUES (8, 'Arcane', '2021-09-06', 14, 100);
INSERT INTO Conteudo VALUES (9, 'Scarface', '1983-02-23', 18, 89);
INSERT INTO Conteudo VALUES (10, 'Fuja', '2021-04-07', 16, 91);

INSERT INTO Filme VALUES(6,'02:56:00');
INSERT INTO Filme VALUES(7,'01:40:50');
INSERT INTO Filme VALUES(8,'00:59:45');
INSERT INTO Filme VALUES(9,'03:01:52');
INSERT INTO Filme VALUES(10,'01:25:48');

INSERT INTO Personagem VALUES (1,'Geralt', 'Rivia', 1, 6);
INSERT INTO Personagem VALUES (2,'Tommy', 'Shelby', 2, 7);
INSERT INTO Personagem VALUES (3,'Jinx', 'Powder', 3, 8);
INSERT INTO Personagem VALUES (4,'Walter', 'White', 4, 9);
INSERT INTO Personagem VALUES (5,'Harvey', 'Specter', 5, 10);


INSERT INTO PlanoPagto VALUES (1, 1);
INSERT INTO PlanoPagto VALUES (2, 1);
INSERT INTO PlanoPagto VALUES (2, 2);
INSERT INTO PlanoPagto VALUES (3, 2);
INSERT INTO PlanoPagto VALUES (3, 1);

INSERT INTO Serie VALUES (1, 2);
INSERT INTO Serie VALUES (2, 4);
INSERT INTO Serie VALUES (3, 1);
INSERT INTO Serie VALUES (4, 5);
INSERT INTO Serie VALUES (5, 5);


#Consultas nas tabelas
#1. Selecionando os conteúdos no qual a relevância é maior ou igual a 99
SELECT Conteudo.nome
FROM Conteudo, conteudoGeneroCenasMomentos
WHERE Conteudo.codConteudo=conteudoGeneroCenasMomentos.codConteudo AND Conteudo.relevancia>=99;


#2. Selecionando os conteúdos no qual o filme foi criado após 2020
SELECT Conteudo.nome
FROM Conteudo, conteudoGeneroCenasMomentos
WHERE Conteudo.codConteudo=conteudoGeneroCenasMomentos.codConteudo AND Conteudo.criacao>'2020-01-01';

#3. Selecionado o conteudo no qual CenasMomentos sejam 'Empolgantes'
SELECT Conteudo.nome
FROM Conteudo, conteudoGeneroCenasMomentos, cenasMomentos
WHERE Conteudo.codConteudo=conteudoGeneroCenasMomentos.codConteudo AND cenasMomentos.nome='Empolgantes' AND cenasMomentos.codCenasMomentos=conteudoGeneroCenasMomentos.codCenasMomentos;

#4. Selecionado as pessoas cuja forma de pagamento é cartao pre pago
SELECT CartaoCreditoDebito.nome, CartaoCreditoDebito.sobrenome
FROM CartaoCreditoDebito, formaPagamento
WHERE formaPagamento.codFormPag=2 AND CartaoCreditoDebito.codFormPag = formaPagamento.codFormPag;

#5. Selecionando os planos cujo valor é inferior a R$ 26.00
SELECT Plano.nome
FROM Plano, PlanoPagto
WHERE Plano.preco<=26 AND Plano.codPlano=PlanoPagto.codPlano;


#Consultando com JOIN LEFT
#1. Selecionando todos conteudos e qualquer conteudo que tiver
SELECT Conteudo.nome, Conteudo.codConteudo
FROM Conteudo
LEFT JOIN Filme
ON Conteudo.codConteudo = Filme.codConteudo;

#2. Selecionando os registros da tabela esquerda e os correspondentes da tabela direita
SELECT * FROM CartaoCreditoDebito
AS C LEFT JOIN formaPagamento
AS F ON C.codFormPag = F.codFormPag;

#Consultas com os operadores (AVG, SUM) usando ORDER BY, HAVING e GROUP BY:
#1. Selecionando os filmes em ordem de tempo de duracao
SELECT Conteudo.nome, Filme.tempoDuracao
FROM Conteudo, Filme
WHERE Conteudo.classEtaria>0 AND Conteudo.codConteudo = Filme.codConteudo
ORDER BY Filme.tempoDuracao;

#2. Somando a idade de todos perfis
SELECT SUM(Perfil.classEtaria)
FROM Perfil
WHERE Perfil.codPerfil!=0;

#3. Selecionado os nomes e quantidade de temporada das series em ordem descrescente da quantidade de temporadas
SELECT Conteudo.nome, Serie.quantTemporadas
FROM Conteudo, Serie
WHERE Conteudo.codConteudo!=0 AND Conteudo.codConteudo = Serie.codConteudo
ORDER BY Serie.quantTemporadas DESC;

#4. Selecionando o preço dos planos em ordem decrescente
SELECT (preco)
FROM Plano
WHERE preco>0
ORDER BY preco DESC;

#5 Selecionando os personagems em ordem
SELECT Personagem.nome
FROM Personagem, Ator
WHERE Personagem.codAtor = Ator.codAtor
GROUP BY Personagem.nome
ORDER BY Personagem.nome;
