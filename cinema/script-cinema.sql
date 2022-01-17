/* Nome: Victor Akio Domoto
   RA: 150546	Turma: I
 */

CREATE DATABASE cinema;	

CREATE TABLE ATOR(
			 coda integer NOT NULL,
                        nomeart varchar(25) NOT NULL,
                        nomereal varchar(25) NOT NULL,
                        nacionalidade varchar(25) NOT NULL,
                        sexo varchar(1) NOT NULL,
                        indicacoesoscar integer NOT NULL,
                        num_oscar integer NOT NULL,
	PRIMARY KEY(coda));
    
CREATE TABLE FILME(
		     codf integer NOT NULL,
                    nome varchar(20) NOT NULL,
                    ano date NOT NULL,
                    orcamento float NOT NULL,
                    tempo float NOT NULL,
	PRIMARY KEY (codf));
    
CREATE TABLE PERSONAGEM (
			     coda integer NOT NULL,
                            codf integer NOT NULL,
                            personagem varchar(25) NOT NULL,
                            cachePers float NOT NULL,
	PRIMARY KEY (coda, codf), 
    FOREIGN KEY (coda) REFERENCES ATOR(coda),
    FOREIGN KEY (codf) REFERENCES FILME(codf));
    

INSERT INTO ATOR (coda, nomeart, nomereal, nacionalidade, sexo, indicacoesoscar, num_oscar)
VALUES  (1, 'DemiMoore', 'MariadaSilva', 'USA', 'f', 0, 0),
		(2, 'BradPitt', 'JoaoPaulo', 'USA', 'f', 1, 0),
        (3, 'DustinHoffman', 'DustinHoffman', 'USA', 'm', 2, 0),
        (4, 'JessicaLange', 'JessicaLange', 'USA', 'f', 4, 2),
        (5, 'SoniaBraga', 'SoniaBraga', 'Brasil', 'f', 0, 0);
        
INSERT INTO FILME (codf, nome, ano, orcamento, tempo)
VALUES  (1, 'Ajurada', 19960101, 1000000, 18),
		(2, 'A Letra Escarlate', 19950101, 1000000, 24),
        (3, 'Seven', 19950101, 1500000, 20),
        (4, 'Tootsie', 19820101, 500000, 16),
        (5, 'Tieta', 19950101, 2000000, 18);
        
INSERT INTO PERSONAGEM (coda, codf, personagem, cachePers)
VALUES (1, 1, 'Mary', 3000),
		(1, 2, 'Sandy', 5000),
        (2, 3, 'John', 5000),
        (3, 4, 'Mary', 1000),
        (4, 4, 'Tootsie', 2000),
        (5, 5, 'Tieta', 500);
        
        
/*1) Alterando o SEXO do ator Brad Pitt*/
UPDATE ATOR
SET sexo = 'm' 
WHERE nomeart = 'BradPitt';

/*2) Alternado o cache dos personagems */
UPDATE PERSONAGEM 
SET cachePers = (cachePers+(cachePers*0.10)) 
WHERE cachepers!=0;



/*4) Tentando excluir personagem Tootsie */
DELETE FROM PERSONAGEM
WHERE personagem = 'Tootsie';
/*Eh possivel apagar este personagem porque nenhuma tabela a tem como chave estrangeira */

/*3) Tentando apagar o filme Tieta */
DELETE FROM FILME 
WHERE  nome = 'Tieta';
/* Nao eh possivel apagar esse filme porque ele eh chave estrangeira da tabela PERSONAGEM (esta sendo usada) */ 



    
    
