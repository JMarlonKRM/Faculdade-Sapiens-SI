									--- AVALIAÇÃO PARCIA
 --- 1. Selecione valor e observações de todas as compras cuja data seja maior-ou-igual que 15/12/2012.
select * from compras where data >= '2012-12-15';

--- 2. Qual o comando SQL para juntar duas condições diferentes? Por exemplo, SELECT * FROM TABELA WHERE campo > 1000 campo < 5000. Faça o teste e veja o resultado.

SELECT * FROM compras WHERE valor > 1000 AND valor < 5000;

--- 3. Vimos que todo texto é passado através de aspas simples. Posso passar aspas duplas no lugar?
--- não é o padrão usado normalmente mas o mysql suporta o uso de aspas duplas 

--- 4. Selecione todas as compras cuja data seja maior-ou-igual que 15/12/2012 e menor do que 15/12/2014.

SELECT * FROM compras WHERE data >= '2012-12-15' AND data < '2014-12-15';

--- 5. Selecione todas as compras cujo valor esteja entre R$15,00 e R$35,00 e a observação comece com a palavra 'Lanchonete'.

SELECT * FROM compras WHERE valor BETWEEN 15 AND 35 AND observacoes LIKE 'Lanchonete%';

--- 6. Selecione todas as compras que já foram recebidas.

SELECT * FROM compras WHERE recebida = 1;

--- 7. Selecione todas as compras que ainda não foram recebidas.

SELECT * FROM compras WHERE recebida = 0;

--- 8. Vimos que para guardar o valor VERDADEIRO para a coluna recebida, devemos passar o valor 1. Para FALSO, devemos passar o valor 0. E quanto às palavras já conhecidas para verdadeiro e falso: TRUE e FALSE. Elas funcionam? Ou seja: INSERT INTO compras (valor, data, observacoes, recebida) VALUES (100.0, '2015-09-08', 'COMIDA', TRUE); Funciona? Faça o teste.

INSERT INTO compras (valor, data, observacoes, recebida) VALUES (100.0, '2015-09-08', 'COMIDA', TRUE);
select * from compras;

--- 9. Selecione todas as compras com valor maior que 5.000,00 ou que já foram recebidas.

SELECT * FROM compras WHERE valor >= 5000 OR recebida = true;

--- 10. Selecione todas as compras que o valor esteja entre 1.000,00 e 3.000,00 ou seja maior que 5.000,00.

SELECT * FROM compras WHERE valor BETWEEN 1000 AND 3000 OR valor > 5000;