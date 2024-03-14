create database DEEPBEAT;

use DEEPBEAT;

CREATE TABLE USUARIO (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT not null,
    NOME_USUARIO VARCHAR(60) not null,
    EMAIL_USUARIO VARCHAR(255) not null,
    SENHA_USUARIO VARCHAR(15) not null,
    DATA_SIGNUP DATETIME,
    NICKNAME_USUARIO VARCHAR(20),
    CPF_USUARIO CHAR(11)
);

CREATE TABLE FAIXA (
    ID_FAIXA INT PRIMARY KEY auto_increment,
    TITULO_FAIXA VARCHAR(150),
    DATA_POST_FAIXA DATE,
    DURACAO_FAIXA TIME,
    FK_REACAO_ID_REACAO INT
);

CREATE TABLE REACAO (
    ID_REACAO INT PRIMARY KEY auto_increment,
    TIPO_REACAO CHAR(1)
);

CREATE TABLE ALBUM (
    ID_ALBUM INT PRIMARY KEY AUTO_INCREMENT,
    TITULO_ALBUM VARCHAR(60) not null,
    DURACAO_ALBUM TIME,
    DATA_POST_ALBUM DATE,
    ID_REACAO INT,
	FOREIGN KEY (ID_REACAO)
    REFERENCES REACAO (ID_REACAO)
    ON DELETE CASCADE
);

CREATE TABLE FORMATO (
    ID_FORMATO INT PRIMARY KEY auto_increment,
    TIPO_FORMATO ENUM ('Reggae', 'Trap', 'Pop', 'Jazz', 'Blues', 'Rock', 'Funk', 'Phonk', 'Sertanejo', 'Metal', 'Indie', 'MPB', 'Clássico', 'R&B', 'Samba')
);

CREATE TABLE CONVERSAO (
    ID_CONVERSAO INT PRIMARY KEY auto_increment,
    TIPO_CONVERSAO CHAR(1),
    DATA_CONVERSAO DATETIME,
    ID_FORMATO INT,
	FOREIGN KEY (ID_FORMATO)
    REFERENCES FORMATO (ID_FORMATO)
    ON DELETE CASCADE
);

CREATE TABLE HISTORICO (
    ID_HISTORICO INT PRIMARY KEY auto_increment,
    DATA_HORA_ACAO DATETIME,
    DESC_ACAO VARCHAR(255),
    ID_USUARIO INT,
	FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO (ID_USUARIO)
    ON DELETE RESTRICT
);

CREATE TABLE PLANO (
    ID_PLANO INT PRIMARY KEY AUTO_INCREMENT,
    DESC_PLANO VARCHAR(40),
    NOME_PLANO VARCHAR(10),
    DATA_INICIO_PLANO DATETIME,
    DATA_TERMINO_PLANO DATETIME
);

CREATE TABLE usuario_plano (
    ID_usuario_plano int auto_increment not null primary key,
    ID_USUARIO int,
    ID_PLANO int,
	FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
	FOREIGN KEY (ID_PLANO) REFERENCES PLANO (ID_PLANO),
    FORMA_PGTO_PLANO ENUM ('Cartão de crédito', 'PIX', 'Boleto', 'Carteira digital')
);

CREATE TABLE GENERO (
    ID_GENERO int primary key auto_increment not null,
    TIPO_GENERO ENUM ('Reggae', 'Trap', 'Pop', 'Jazz', 'Blues', 'Rock', 'Funk', 'Phonk', 'Sertanejo', 'Metal', 'Indie', 'MPB', 'Clássico', 'R&B', 'Samba') not null,
	ID_FORMATO int,
    FOREIGN KEY (ID_FORMATO) REFERENCES FORMATO (ID_FORMATO)
);

CREATE TABLE genero_faixa (
 ID_genero_faixa int primary key auto_increment not null,
 ID_GENERO int, 
 ID_FAIXA int,
 FOREIGN KEY (ID_GENERO) REFERENCES GENERO (ID_GENERO),
 FOREIGN KEY (ID_FAIXA) REFERENCES FAIXA (ID_FAIXA)
);

CREATE TABLE album_faixa (
    ID_album_faixa int primary key auto_increment not null,
    ID_ALBUM int, 
    ID_FAIXA int,
	FOREIGN KEY (ID_ALBUM) REFERENCES ALBUM (ID_ALBUM),
    FOREIGN KEY (ID_FAIXA) REFERENCES FAIXA (ID_FAIXA)
);

CREATE TABLE FORMATO (
    ID_FORMATO INT PRIMARY KEY auto_increment,
    TIPO_FORMATO ENUM ('Reggae', 'Trap', 'Pop', 'Jazz', 'Blues', 'Rock', 'Funk', 'Phonk', 'Sertanejo', 'Metal', 'Indie', 'MPB', 'Clássico', 'R&B', 'Samba')
);

CREATE TABLE usuario_album (
    ID_usuario_album int primary key auto_increment not null,
    ID_USUARIO int,
    ID_ALBUM int,
    FOREIGN KEY (ID_ALBUM) REFERENCES ALBUM (ID_ALBUM),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO)
);

CREATE TABLE plano_conversao (
	ID_plano_conversao int primary key auto_increment not null,
    ID_PLANO int,
    ID_CONVERSAO int,
    FOREIGN KEY (ID_PLANO) REFERENCES PLANO (ID_PLANO),
    FOREIGN KEY (ID_CONVERSAO) REFERENCES CONVERSAO (ID_CONVERSAO)
);