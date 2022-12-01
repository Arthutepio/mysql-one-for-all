DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista(
        id_artista INT PRIMARY KEY AUTO_INCREMENT,
        nome_artista VARCHAR(50) NOT NULL
    ) engine = InnoDB;
    
    
    CREATE TABLE album(
        id_album INT PRIMARY KEY AUTO_INCREMENT,
        nome_album VARCHAR(50) NOT NULL,
		id_artista INT NOT NULL,
        FOREIGN KEY (id_artista) REFERENCES artista (id_artista)
    ) engine = InnoDB;
    

    CREATE TABLE cancao(
        id_cancao INT PRIMARY KEY AUTO_INCREMENT,
        nome_cancao VARCHAR(50) NOT NULL,
        duracao_segundo INT NOT NULL,
        ano_lancamento YEAR NOT NULL,
		id_album INT NOT NULL,
        FOREIGN KEY (id_album) REFERENCES album (id_album)
    ) engine = InnoDB;
    
	
    CREATE TABLE plano(
		id_plano INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	    tipo_plano VARCHAR(45) NOT NULL,
 	    valor DECIMAL(5,2) NOT NULL
	) engine = InnoDB;
    
           
	CREATE TABLE usuario(
		id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		nome_usuario VARCHAR(45) NOT NULL,
        idade INT NOT NULL,
        data_assinatura DATE NOT NULL,
        id_plano INT NOT NULL,
        FOREIGN KEY (id_plano) REFERENCES plano (id_plano)
	) engine = InnoDB;
    
	

     CREATE TABLE historico(
        data_reproducao DATETIME NOT NULL,
		    id_cancao INT,
        id_usuario INT,
        PRIMARY KEY (id_cancao, id_usuario),
        FOREIGN KEY (id_cancao) REFERENCES cancao (id_cancao),
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
     ) engine = InnoDB;
     
           
	CREATE TABLE seguindo_artista(
		    id_usuario INT NOT NULL,
        id_artista INT NOT NULL,
        PRIMARY KEY (id_usuario, id_artista), 
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
        FOREIGN KEY (id_artista) REFERENCES artista (id_artista)
	) engine = InnoDB;
    
    
    INSERT INTO artista(nome_artista)
    VALUES('Beyoncé'),
		  ('Queen'),
		  ('Elis Regina'),
		  ('Baco Exu do Blues'),
		  ('Blind Guardian'),
		  ('Nina Simone');
    
    INSERT INTO album(nome_album, id_artista)
    VALUES('Renaissance', 1),
		  ('Jazz', 2),
		  ('Hot Space', 2),
		  ('Falso Brilhante', 3),
		  ('Vento de Maio', 3),
		  ('QVVJFA?', 4),
		  ('Somewhere Far Beyond', 5),
		  ('I Put A Spell On You', 6);
    
    INSERT INTO cancao(nome_cancao, duracao_segundo, ano_lancamento, id_album)
    VALUES ("BREAK MY SOUL", 279, 2022, 1),
		   ("VIRGO’S GROOVE", 369, 2022, 1),
       ("ALIEN SUPERSTAR", 116, 2022, 1),
		   ("Don’t Stop Me Now", 203,1978, 2),
		   ("Under Pressure", 152, 1982, 3),
		   ("Como Nossos Pais", 105, 1998, 4),
		   ("O Medo de Amar é o Medo de Ser Livre", 207, 2001, 5),
		   ("Samba em Paris", 267, 2003, 6),
		   ("The Bard’s Song", 244, 2007, 7),
		   ("Feeling Good", 100, 2012, 8);
    
    INSERT INTO plano(tipo_plano, valor)
    VALUES ('gratuito', 0.00),
		       ('familiar', 7.99),
           ('universitario', 5.99),
           ('pessoal', 6.99);
    
    INSERT INTO usuario(
		nome_usuario,
		idade,
		data_assinatura,
    id_plano)
    VALUES('Barbara Liskov', 82, '2019-10-20', 1),
		  ('Robert Cecil Martin', 58, '2017-01-06', 1),
		  ('Ada Lovelace', 37, '2017-12-30', 2),
		  ('Martin Fowler', 46, '2017-01-17', 2),
		  ('Sandi Metz', 58, '2018-04-29', 2),
		  ('Paulo Freire', 19, '2018-02-14', 3),        
		  ('Bell Hooks', 26, '2018-01-05', 3),
	  	('Christopher Alexander', 85,'2019-06-05', 4),
		  ('Judith Butler', 45, '2020-05-13', 4),
		  ('Jorge Amado', 58, '2017-02-17', 4);
     
     INSERT INTO historico(data_reproducao, id_cancao, id_usuario)
     VALUE ("2022-02-28 10:45:55", 8, 1),
		       ("2020-05-02 05:30:35", 2, 1),
           ("2020-03-06 11:22:33", 10, 1),
           ("2022-08-05 08:05:17", 10, 2),
           ("2020-01-02 07:40:33", 7, 2),
           ("2020-11-13 16:55:13", 10, 3),
           ("2020-12-05 18:38:30", 2, 3),
           ("2021-08-15 17:10:10", 8, 4),
           ("2022-01-09 01:44:33", 8, 5),
           ("2020-08-06 15:23:43", 5, 5),
           ("2017-01-24 00:31:17", 7, 6),
           ("2017-10-12 12:35:20", 1, 6),
           ("2011-12-15 22:30:49", 4, 7),
           ("2012-03-17 14:56:41", 4, 8),
           ("2022-02-24 21:14:22", 9, 9),
           ("2015-12-13 08:30:22", 3, 10);
    
    INSERT INTO seguindo_artista(id_usuario, id_artista)
    VALUES (1, 1),
		       (1, 2),
           (1, 3),
           (2, 1),
           (2, 3),
           (3, 2),
           (4, 4),
           (5, 5),
           (5, 6),
           (6, 1),
           (6, 6),
           (7, 6),
           (9, 3),
           (10, 2);
