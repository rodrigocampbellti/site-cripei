--  Apagar o banco de dados caso ele exista. 
-- CUIDADO! ATENÇÃO! PERIGO!
--  Este arquivo só deve ser usada em tempo de senvolvimento.
--  Quando o site estiver pronto, apague este arquivo.

-- apaga o banco de dados caso ele exista.
DROP DATABASE IF EXISTS cripei; 

-- Cria o banco de dados usando utf-8.
CREATE DATABASE cripei CHARACTER SET utf8 COLLATE utf8_general_ci; 
-- O "set" põe tudo como utf8. CI = case isensitive. utf8_bin: busca binára.

-- Seleciona o banco de dados:

USE  cripei;


--  Criar tabela de usuário:

CREATE TABLE users (

user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
user_name VARCHAR (255) NOT NULL,
user_email VARCHAR (255) NOT NULL,
user_password VARCHAR (255) NOT NULL,
user_avatar VARCHAR (255) NOT NULL,
user_birth DATE NOT NULL,
user_bio TEXT,
user_type ENUM('admin', 'author', 'moderator', 'user') DEFAULT 'user',
user_status ENUM ('on', 'off', 'deleted') DEFAULT 'on'
);

-- Cria tabela de artigos:

CREATE TABLE articles (
    art_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_title VARCHAR (255) NOT NULL,
    art_thumb VARCHAR (255) NOT NULL,
    art_intro VARCHAR (255) NOT NULL,
    art_author INT,
    art_content LONGTEXT NOT NULL,
    art_status ENUM ('on', 'off', 'deleted') DEFAULT 'on',
    art_counter INT DEFAULT 0,
    FOREIGN KEY (art_author) REFERENCES users(user_id)
);

-- CRIA TABELA DE COMENTÁRIOS: 
CREATE TABLE comments(
    cmt_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_author INT,
    cmt_article INT,
    cmt_content TEXT NOT NULL,
    cmt_status ENUM ('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_author) REFERENCES users(user_id),
    FOREIGN KEY (cmt_article) REFERENCES articles(art_id)
);

-- Cria tabela de contatos:
CREATE TABLE contacts(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    subject VARCHAR (255) NOT NULL,
    message TEXT NOT NULL,
    status ENUM ('on', 'off', 'deleted') DEFAULT 'on'
);

-- INSERE ALGUNS USUÁRIOS PARA TESTES:
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('Joca da Silva', 'joca@silva.com', SHA1('12345_Qw'), 'https://randomuser.me/api/portraits/men/58.jpg',
    '2000-04-10', 'comentador, organizador, enrolador e coach.', 'admin'
);
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('Fernanda da Silva', 'fernanda@silva.com', SHA1('12345_Qw'), 'https://randomuser.me/api/portraits/women/58.jpg',
    '1998-06-19', 'comentadora, organizadora, enroladora e coach.', 'admin'
);
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('João Paulo', 'joaop@jpaulo.com', SHA1('5462_Qw'), 'https://randomuser.me/api/portraits/men/58.jpg',
    '1999-06-01', 'Programador e gerente.', 'author'
);
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('Pedro Felipe', 'pedro@felipe.com', SHA1('12345_Qw'), 'https://randomuser.me/api/portraits/men/58.jpg',
    '1988-09-20', 'Curioso no tema.', 'author'
);
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('Joana Felipa', 'joana@felipa.com', SHA1('8989_Qw'), 'https://randomuser.me/api/portraits/women/58.jpg',
    '1990-01-23', 'Entendida do assunto', 'author'
);
INSERT INTO users(
    user_name,
    user_email, 
    user_password, 
    user_avatar,
    user_birth, 
    user_bio,
    user_type
) VALUES ('Maria Helena dos Santos', 'mhs@helenamhs.com', SHA1('30154568_Qw'), 'https://randomuser.me/api/portraits/women/58.jpg',
    '1995-03-15', 'Pesqusiadora do tema', 'author'
);

INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-7-02', 'Primeiro artigo', 'https://picsum.photos/200/300?grayscale',
'Como escrever um artigo para este site sem assunto','1', '<h2>Título</h2>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);

INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-06-10', 'Um tema interessante', 'https://picsum.photos/200/300','Um tema que vai contribuir para tua carreira',
'4', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);

INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'6', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);

INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'2', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'5', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'1', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-05-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'2', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'4', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um outro tema interessante', 'https://picsum.photos/200/301','Um tema que vai contribuir para tua carreira',
'3', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);
INSERT INTO articles(
    art_date ,
    art_title ,
    art_thumb ,
    art_intro ,
    art_author,
    art_content,
    art_status
) VALUES ('2022-03-01', 'Um novo tema  mais interessante', 'https://picsum.photos/200/301','Um novo assunto ainda mais interessante',
'3', '<h2>Título</h2> <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p>',
                'on' 
);

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-03-03', '3','3', 'Muito bom');

INSERT INTO comments(

    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content 
) VALUES ('2022-04-10', '1','1', 'Eu achei o artigo interessante, mas com algumas falhas');

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-05-01', '5','5', 'Muito ruim, eu não gostei. Eu achei o texto uma porcaria');

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-06-11', '4','4', 'O artigo deixou muitas questões em aberto');

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content

) VALUES ('2022-04-03', '6','6', 'Eu gostei');

INSERT INTO comments(
      
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-04-10', '1','1', 'Eu achei o artigo interessante, mas com algumas falhas');

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-07-9', '2','2', 'Eu achei o artigo interessante. Contribuiu muito para meu raciocínio no tema');

INSERT INTO comments(
    
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-06-15', '1','1', 'O artigo é interessante, mas não contribui em nada. ');

INSERT INTO comments(
    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
 
) VALUES ('2022-07-8', '3','3', 'Eu achei o artigo bom');

INSERT INTO comments(

    cmt_date ,
    cmt_author,
    cmt_article,
    cmt_content
) VALUES ('2022-06-30', '4','4', 'Eu já sei que não usarei esse artigo no meu trabalho');

