CREATE SCHEMA jose_marlon_gastos;
USE jose_marlon_gastos;
CREATE TABLE IF NOT EXISTS compras (
	valor DOUBLE not null,
    data DATE NOT NULL,
    observacoes VARCHAR(200) NOT NULL, 
    recebida INT NOT NULL
);

select * from compras ;