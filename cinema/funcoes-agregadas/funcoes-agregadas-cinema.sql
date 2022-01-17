/*
Nome: Victor Akio Domoto
RA: 150546
Turma: I
*/


/*1. Somando a idade dos atores*/
SELECT SUM(idade)
FROM ATOR
WHERE sexo='f';

/*2. Selecionando o nome e o numero de filmes que participou*/
SELECT personagem, COUNT(*)
FROM PERSONAGEM
GROUP BY personagem;

/*3. Para cada ator que não ganhou oscar, listar o seu nome, ano de seu filme mais antigo e do mais novo */
SELECT nomereal, ano 
FROM ATOR, FILME
WHERE num_oscar = 0
ORDER BY ano DESC;

/*4. Para cada filme listar: o nome do filme, média de cachês pagos por filme, cachê mais alto, cachê
mais baixo, e total dos cachês pagos; */
SELECT nomeart, AVG(cachePers), MAX(cachePers), MIN(cachePers), SUM(cachePers)
from ATOR, PERSONAGEM
GROUP BY nomeart;


/*5.O nome do artista e o número de filmes em que participou, para todo artista que participou de
no mínimo 2 filmes;*/
SELECT nomeart, COUNT(ATOR.coda)
FROM ATOR, PERSONAGEM
WHERE ATOR.coda=PERSONAGEM.coda
GROUP BY ATOR.nomeart
HAVING COUNT(ATOR.coda)>=2;

/*6.O número de caches distintos maiores do que 2000 pagos em cada filme, para todo filme onde
a soma dos cachês destes artistas foi inferior a 8000. ( use count (distinct cache) )*/
SELECT DISTINCT cachePers
FROM PERSONAGEM
WHERE cachePers>2000
GROUP BY cachePers
HAVING SUM(cachePers)>8000;
