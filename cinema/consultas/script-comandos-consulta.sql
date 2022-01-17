/*	Nome: Victor Akio Domoto
	RA: 150546		
    Turma: I 
*/

/*1) */
SELECT nomeart, nomereal, nacionalidade, sexo, indicacoesoscar, num_oscar
FROM ATOR	
WHERE sexo='f';

/*2)*/
SELECT nomeart, sexo
FROM ATOR;

/*3) */  
SELECT nomeart, indicacoesoscar, num_oscar
FROM ATOR
WHERE indicacoesoscar>num_oscar*2;  

/*4)Como o nome da coluna codf tava dando problema de ambiguidade, foi necessario alterar o nome*/
ALTER TABLE PERSONAGEM CHANGE codf codef integer NOT NULL;
/*Selecionando de fato o que foi pedido: */
SELECT codf
FROM FILME, PERSONAGEM
WHERE FILME.codf=PERSONAGEM.codef AND cachePers<1000;

/*5) */
SELECT personagem
FROM PERSONAGEM, ATOR
WHERE PERSONAGEM.coda=ATOR.coda AND nomeart='DemiMoore';

/*6) */
SELECT nome
FROM FILME, ATOR, PERSONAGEM
WHERE PERSONAGEM.codef=FILME.codf AND PERSONAGEM.coda=ATOR.coda AND nomeart='DemiMoore';

/*7) */
SELECT nomereal
FROM ATOR
WHERE sexo='f' AND nomeart like 'J%';

/*8)*/
SELECT nomeart
FROM ATOR
WHERE indicacoesoscar>2*num_oscar;

/*9)*/
SELECT nomeart
FROM ATOR
ORDER BY nomeart;

/*10)*/
SELECT personagem
FROM ATOR, PERSONAGEM
WHERE ATOR.sexo='f' AND PERSONAGEM.coda=ATOR.coda;

/*11)*/
SELECT COUNT(*) AS "personagem"
FROM PERSONAGEM, ATOR
WHERE PERSONAGEM.coda=ATOR.coda AND ATOR.sexo='m';

/*12)*/
SELECT SUM(orcamento)
FROM FILME;