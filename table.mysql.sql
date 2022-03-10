DROP TABLE IF EXISTS participe;
DROP TABLE IF EXISTS epreuve;
DROP TABLE IF EXISTS nageur;

-- création des tables ------------

-- creation de la table nageur
CREATE TABLE IF NOT EXISTS nageur(
     id_nageur INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
     prenom_nageur VARCHAR(50) NOT NULL,
     nom_nageur VARCHAR(50) NOT NULL,
     pays_nageur VARCHAR(50) NOT NULL,
     sexe_nageur VARCHAR(50) NOT NULL CHECK (sexe_nageur IN ('Femme','Homme'))
);
-- creation de la table epreuve ----
CREATE TABLE IF NOT EXISTS epreuve(
     id_epreuve  INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
     nom_epreuve VARCHAR(50) NOT NULL CHECK (nom_epreuve IN('50m','100m','200m','400m','800m','1500m')),
     type_epreuve VARCHAR(50) NOT NULL CHECK (type_epreuve IN ('Papillon','Dos','Brasse','Nage_libre')),
     statut_epreuve VARCHAR(50) NOT NULL CHECK (statut_epreuve IN ('Finale','Demi_finale1','Demi_finale2','Series'))

);



-- creation de la table date ---
-- creation de la table participe
CREATE TABLE IF NOT EXISTS participe(
     id_nageur    INT NOT NULL REFERENCES nageur(id_nageur) ON DELETE CASCADE ON UPDATE CASCADE ,
     id_epreuve    INT NOT NULL REFERENCES epreuve(id_epreuve) ON DELETE CASCADE ON UPDATE CASCADE ,
     date_epreuve VARCHAR(30) NOT NULL,
      performance   DOUBLE DEFAULT NULL CHECK(performance>0),
     classement    INT NOT NULL, CHECK(classement>0),
     nom_medaille  VARCHAR(50) DEFAULT NULL CHECK (nom_medaille IN ('Or','Argent','Bronze')) ,

     PRIMARY KEY (id_epreuve, id_nageur,date_epreuve,classement)
);



-- insertion des tables -----

-- insertion de la table epreuve----
INSERT INTO epreuve(nom_epreuve, type_epreuve, statut_epreuve) VALUES
('50m','Nage_libre','Series'),
('50m','Nage_libre','Demi_finale1'),
('50m','Nage_libre','Demi_finale2'),
('50m','Nage_libre','Finale'),
('100m','Nage_libre','Series'),
('100m','Nage_libre','Demi_finale1'),
('100m','Nage_libre','Demi_finale2'),
('100m','Nage_libre','Finale'),
('200m','Nage_libre','Series'),
('200m','Nage_libre','Demi_finale1'),
('200m','Nage_libre','Demi_finale2'),
('1500m','Nage_libre','Demi_finale2'),
('1500m','Nage_libre','Demi_finale1'),
('400m','Nage_libre','Demi_finale1'),
 ('200m','Nage_libre','Finale'),
('400m','Nage_libre','Series'),
('400m','Nage_libre','Finale'),
('1500m','Nage_libre','Series'),
('1500m','Nage_libre','Finale'),
 ('800m','Nage_libre','Demi_finale1'),
('800m','Nage_libre','Demi_finale2'),
('100m','Dos','Series'),
('100m','Dos','Demi_finale1'),
('100m','Dos','Demi_finale2'),
('100m','Dos','Finale'),
('200m','Dos','Series'),
('200m','Dos','Demi_finale1'),
('200m','Dos','Demi_finale2'),
('200m','Dos','Finale'),
('100m','Brasse','Series'),
('100m','Brasse','Demi_finale1'),
('100m','Brasse','Demi_finale2'),
('100m','Brasse','Finale'),
('200m','Brasse','Series'),
('200m','Brasse','Demi_finale1'),
('200m','Brasse','Demi_finale2'),
('200m','Brasse','Finale'),
('100m','Papillon','Series'),
('100m','Papillon','Demi_finale1'),
('100m','Papillon','Demi_finale2'),
('200m','Papillon','Finale'),
('200m','Papillon','Series'),
('200m','Papillon','Demi_finale1'),
('200m','Papillon','Demi_finale2'),
('800m','Nage_libre','Series'),
('800m','Nage_libre','Finale'),
('400m','Nage_libre','Demi_finale2');


-- insertion de la table nageur ----
INSERT INTO nageur (prenom_nageur,nom_nageur,pays_nageur,sexe_nageur ) values
('Izaak','BASTIAN','Bahamas','Homme'),
('Joanna','EVANS','Bahamas','Femme'),
('Junayna','AHMED','bangladesh','Femme'),
('Md Ariful','ISLAM','bangladesh','Homme'),
('Alex','SOBERS','Barbade','Homme'),
('Danielle','TITUS','Barbade','Femme'),
('Belly-Cresus','GANIRA','Burundi','Homme'),
('Odrina','KAZE','Burundi','Femme'),
('Louis','CROENEN','Belgique','Homme'),
('Fanny','LECLUYSE','Belgique','Femme'),
('Marc Pascal Pierre','DANSOU','Bénin','Homme'),
('Nafissath','RADJI','Bénin','Femme'),
('Sangay','TENZIN',' Bhoutan ','Homme'),
('Emir','MURATOVIC','Bosnie-Herzégovine','Homme'),
('Lana','PUDAR','Bosnie-Herzégovine','Femme'),
('Nastassia','KARAKOUSKAYA','Biélorussie','Femme'),
('Anastasiya','KULIASHOVA','Biélorussie','Femme'),
('Artsiom','MACHEKIN','Biélorussie','Homme'),
('Anastasiya','SHKURDAI','Biélorussie','Femme'),
('Ilya','SHYMANOVICH','Biélorussie','Homme'),
('Mikita','TSMYH','Biélorussie','Homme'),
('Yauhen','TSURKIN','Biélorussie','Homme'),
('Alina','ZMUSHKA','Biélorussie','Femme'),
('Gabriel','CASTILLO','Bolivie','Homme'),
('Karen','TORREZ','Bolivie','Femme'),
('James','FREEMAN','Botswana','Homme'),
('Stephanie','BALDUCCINI',' Brésil','Homme'),
('Guilherme','BASSETO','Brésil','Homme'),
('Marcelo','CHIERIGHINI','Brésil','Homme'),
('Breno','CORREIA','Brésil','Homme'),
('Guilherme','COSTA','Brésil','Homme'),
('Leonardo','DE DEUS','Brésil','Homme'),
('Beatriz Pimentel','DIZOTTI','Brésil','Femme'),
('Bruno','FRATUS','Brésil','Homme'),
('Matheus','GONCHE','Brésil','Homme'),
('Guilherme','GUIDO','Brésil','Homme'),
('Viviane','JUNGBLUT','Brésil','Femme'),
('Vinicius','LANZA','Brésil','Homme'),
('Felipe','LIMA','Brésil','Homme'),
('Etiene','MEDEIROS','Brésil','Homme'),
('Luiz Altamir','MELO','Brésil','Homme'),
('Larissa','OLIVEIRA','Brésil','Homme'),
('Caio','PUMPUTIS','Brésil','Homme'),
('Aline','RODRIGUES','Brésil','Homme'),
('Gabrielle','RONCATTO','Brésil','Homme'),
('Gabriel','SANTOS','Brésil','Homme'),
('Fernando','SCHEFFER','Brésil','Homme'),
('Murilo','SETIN SARTORI','Brésil','Homme'),
('Nathalia','SIQUEIRA ALMEIDA','Brésil','Femme'),
('Pedro','SPAJARI','Brésil','Homme'),
('Giovanna','TOMANIK DIAMANTE','Brésil','Femme'),
('Ana Carolina','VIEIRA','Brésil','Femme'),
('Abdulla Essa','AHMED ALI YUSUF','Bahreïn','Homme'),
('Noor','YUSUF ABDULLA','Bahreïn','Femme'),
('Muhammad Isa','AHMAD','Brunei','Homme'),
('Lyubomir','EPITROPOV','Bulgarie ','Homme'),
('Antani','IVANOV','Bulgarie','Homme'),
('Kaloyan','LEVTEROV','Bulgarie','Homme'),
('Josif','MILADINOV','Bulgarie','Homme'),
('Diana','PETKOVA','Bulgarie','Femme'),
('Adama','OUEDRAOGO','Burkina Faso','Homme'),
('Angelika',' OUEDRAOGO ','Burkina Faso','Femme'),
('Yanhan','AI','Chine','Femme'),
('Jie','CHEN','Chine','Femme'),
('Yujie','CHENG','Chine','Homme'),
('Long','CHENG','Chine','Homme'),
('Jie','DONG','Chine','Homme'),
('Junyi','HE','Chine','Homme'),
('Jinquan','HONG','Chine','Homme'),
('Xinjie','JI','Chine','Homme'),
('Yaxin','LIU','Chine','Femme'),
('Xuwei','PENG','Chine','Femme'),
('Jiajun','SUN','Chine','Homme'),
('Muhan','TANG','Chine','Femme'),
('Qianting','TANG','Chine','Femme'),
('Jianjiahe','WANG','Chine','Femme'),
('Zibei','YAN','Chine','Homme'),
('Mireia','BELMONTE','Espagne','Femme'),
('Nicolas','GARCIA SAIZ ','Espagne','Homme'),
('Marina','GARCIA URZAINQUI ','Espagne','Femme'),
('Hugo','GONZALEZ','Espagne','Homme'),
('Ole','BRAUNSCHWEIG','Allemagne','Homme'),
('Annika','BRUHN','Allemagne','Femme'),
('Christian','DIENER','Allemagne','Homme'),
('Anna','ELENDT','Allemagne','Femme'),
('Christoph','FILDEBRANDT','Allemagne','Homme'),
('Jan Eric','FRIESE','Allemagne','Homme'),
('Franziska','HENTKE','Allemagne','Femme'),
('Lena','HENTSCHEL','Allemagne','Femme'),
('Lisa ','HOPINK','Allemagne','Femme'),
('Marco','KOCH','Allemagne','Homme'),
('Marius','KUSCH','Allemagne','Homme'),
('Leonie Marlen','KULLMANN','Allemagne','Femme'),
('Lucas Joachim','MATZERATH','Allemagne','Homme'),
('David','THOMASBERGER','Allemagne','Homme'),
('Poul','ZELLMANN','Allemagne','Homme'),
('Diana','DURAES ','Portugal ','Femme'),
('Ayoub','Ahmed','Tunisie','Homme'),
('Jack Alan','McLoughlin','Australie','Homme'),
('Kieran','Smith','Etats Unis','Homme'),
('Henning Bennet','Muhlleitner','Allemagne','Homme'),
('Felix','Auböck ','Autriche ','Homme'),
('Gabriele','Detti','Italie','Homme'),
('Elijah','Winnington','Australie','Homme'),
('Jake','Mitchell ','Etats Unis ','Homme'),
-- 100m brasse --
('Adam','Peaty','Angleterre','Homme'),
('Arno','Kamminga','Pays-bas','Homme'),
('Nicolo','Martinenghi','Italie','Homme'),
('James','Wilby','Angleterre','Homme'),
('Michael','Andrew','Etats Unis','Homme'),
-- 100 m dos Hommes - 27 Juillet 2021 - 03:59
('Evgeny','Rylov','Russie','Homme'),
('Kliment','Kliment','Russie','Homme'),
('Thomas','Ceccon','Italie','Homme'),
('Jiayu','Xu','Chine','Homme'),
('Mitchell','Larkin','Australie','Homme'),
('Robert','Glinta','Roumanie','Homme'),
-- 200 m papillon
('Kristof','Milak','Hongrie','Homme'),
('Tomoru','Honda','Japan','Homme'),
('Federico','Burdisso','Italie','Homme'),
('Tamas','Kenderesi','Hongrie','Homme'),
('Chad Guy Dertrand','Le Clos','Afrique du Sud','Homme'),
('Gunnar','Bentz','Etats Unis','Homme'),
('Krzysztof','Chmielewski','Pologne','Homme'),
 -- 800 m nage libre Hommes - 29 Juillet 2021 - 03:30
('Robert','Finke','Etats Unis','Homme'),
('Gregorio','Paltrinieri','Italie','Homme'),
('Florian','Wellbrock','Allemagne','Homme'),
('Sergiy','Frolov','Ukraine','Homme'),
--  200 m dos Hommes - 30 Juillet 2021 - 03:50
('Ryan','Murphy','Etats Unis','Homme'),
('Luke','Greenbank','France','Homme'),
('Bryce','Mefford ','Etat Unis','Homme'),
('Adam','Telegdy','Hongrie','Homme'),
('Radoslaw','Kawecki ','Pologne','Homme'),
('Ryosuke','Irie ','Japon','Homme'),
('Nicolas','Saiz','Espagne','Homme'),
-- 1500 m nage libre Hommes - 1er Août 2021 - 03:44
('Mykhailo','Romanchuk','Ukraine','Homme'),
('Daniel','Jervis','Pays de Galles','Homme'),
('Kirill','Martynychev','Russie ','Homme'),
('Bingjie','Li','Chine','Femme'),
('Summer','McIntosh','Canada','Femme'),
('Isabel','Marie Gose','Allemagne','Femme'),
('Paige','Madden','Etats Unis ','Femme'),
('Erika','Fairweather','Nouvelle-Zélande','Femme'),
-- 100 m dos femme
('Rhyan','White','Etats Unis','Femme'),
('Kathleen','Dawson','Ecosse','Femme'),
('Kira','Toussaint','Pays-Bas','Femme'),
('Anastasia','Gorbenko','Israël','Femme'),
-- 100 m beasse Femme
('Lydia','Jacoby','Etats Unis','Femme'),
('Tatjana ','Schoenmaker','Afrique du Sud','Femme'),
('ULilly','King','Etats Unis','Femme'),
('Evgeniia','Chikunova','Russie','Femme'),
('Yuliya','Hansson','Russie','Femme'),
('AMartina','Carraro','Italie','Femme'),
('Mona','McSharry','Irlande','Femme'),
-- 200 m nage libre Femme
('Ariarne','Titmus','Australie','Femme'),
('Penny','Oleksiak','Canada','Femme'),
('Junxuan','Yang','Chine','Femme'),
('Barbora','Seemanova','République Tchèque','Femme'),
('Federica','Pellegrini','Italie','Femme'),
('Madison','Wilson','Australie','Femme'),
-- 1500 m nage libre Femme
('Erica','UErica','Etats Unis','Femme'),
('Sarah','Kohler','Allemagne','Femme'),
('Jianjiahe','Wang','Chine','Femme'),
('Kiah','Melverton','Australie','Femme'),
('Anastasiia','Kirpichnikova','Russie','Femme'),
('Maddy','Gough','Australie','Femme'),
-- 200 m papillon Femme
('Yufei','Zhang','Chine','Femme'),
('Regan','Smith','Etats Unis','Femme'),
('Hali','Flickinger','Etats Unis','Femme'),
('Boglarka','Kapas','Etats Unis','Femme'),
('Svetlana','Chimrova','Russie ','Femme'),
('Liyan','Yu','Chine','Femme'),
('Alys','Thomas','Pays de Galles','Femme'),
('Brianna ','Throssell','Australie','Femme'),
-- 100 m nage libre Femme
('Siobhan','Haughey','Hong-KongHong-Kong -','Femme'),
('Cate','Campbell','Australie','Femme'),
('Sarah','Sjoestroem','Suède','Femme'),
('Femke','Heemskerk','Pays-Bas','Femme'),
('Anna','Hopkin','Angleterre','Femme'),
('Abbey','Weitzeil','Etats Unis','Femme'),
-- 800 m nage libre Femme
('Katie','Ledecky','Etats Unis','Femme'),
('Simona','Quadarella','Italie ','Femme'),
('Katie','Grimes','Etats Unis','Femme'),
('Jianjiah','Wang','Chine','Femme'),
('Anastasiia','Kirpichnikova ','Russie','Femme'),
-- 200 m dos Femme
('Kaylee','Rochelle McKeown','Australie','Femme'),
('Kylie','Masse','Canada','Femme'),
('Emily','Jane Seebohm','Australie','Femme'),
('Phoebe','Bacon','Etats Unis','Femme'),
('Taylor','Ruck','Canada','Femme'),
('Xuwe','Peng','Chine','Femme'),
-- 50 m nage libre Femme
('Emma','McKeon','Australie','Femme'),
('Pernille','Blume','Danemark','Femme'),
('Ranomi','Kromowidjojo','Pays-Bas','Femme'),
('Katarzyna','Wasick','Pologne','Femme'),
('Qingfeng','Wu','Chine','Femme')

;
INSERT INTO participe(id_nageur,id_epreuve,date_epreuve,performance, classement, nom_medaille) VALUES

((select id_nageur from nageur where prenom_nageur='Izaak'  and nom_nageur ='BASTIAN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,30,10,NULL),

((select id_nageur from nageur where prenom_nageur='Joanna'  and nom_nageur ='EVANS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210802,33,12,NULL),


((select id_nageur from nageur where prenom_nageur='Junayna'  and nom_nageur ='AHMED'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210802,34,13,NULL),

((select id_nageur from nageur where prenom_nageur='Md Ariful'  and nom_nageur ='ISLAM'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,40,17,NULL),


((select id_nageur from nageur where prenom_nageur='Alex'  and nom_nageur ='SOBERS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,42,13,NULL),


((select id_nageur from nageur where prenom_nageur='Danielle'  and nom_nageur ='TITUS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210802,47,11,NULL),


((select id_nageur from nageur where prenom_nageur='Belly-Cresus'  and nom_nageur ='GANIRA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210802,59,20,NULL),


((select id_nageur from nageur where prenom_nageur='Odrina'  and nom_nageur ='KAZE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,50,21,NULL),


((select id_nageur from nageur where prenom_nageur='Louis'  and nom_nageur ='CROENEN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210805,50,14,NULL),




((select id_nageur from nageur where prenom_nageur='Fanny'  and nom_nageur ='LECLUYSE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,50,19,NULL),



((select id_nageur from nageur where prenom_nageur='Marc Pascal Pierre'  and nom_nageur ='DANSOU'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,57,8,NULL),

((select id_nageur from nageur where prenom_nageur='Nafissath'  and nom_nageur ='RADJI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,57,8,NULL),


((select id_nageur from nageur where prenom_nageur='Sangay'  and nom_nageur ='TENZIN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,53,9,NULL),



((select id_nageur from nageur where prenom_nageur='Emir'  and nom_nageur ='MURATOVIC'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,60,15,NULL),



((select id_nageur from nageur where prenom_nageur='Lana'  and nom_nageur ='PUDAR'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,60,15,NULL),



((select id_nageur from nageur where prenom_nageur='Nastassia'  and nom_nageur ='KARAKOUSKAYA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210811,63,18,NULL),


((select id_nageur from nageur where prenom_nageur='Anastasiya'  and nom_nageur ='KULIASHOVA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210812,66,21,NULL),




((select id_nageur from nageur where prenom_nageur='Artsiom'  and nom_nageur ='MACHEKIN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210812,66,21,NULL),





((select id_nageur from nageur where prenom_nageur='Anastasiya'  and nom_nageur ='SHKURDAI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210813,57,23,NULL),



((select id_nageur from nageur where prenom_nageur='Ilya'  and nom_nageur ='SHYMANOVICH'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210813,57,23,NULL),





((select id_nageur from nageur where prenom_nageur='Mikita'  and nom_nageur ='TSMYH'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210813,43,18,NULL),




((select id_nageur from nageur where prenom_nageur='Yauhen'  and nom_nageur ='TSURKIN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210813,60,25,NULL),




((select id_nageur from nageur where prenom_nageur='Alina'  and nom_nageur ='ZMUSHKA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210812,34,12,NULL),



((select id_nageur from nageur where prenom_nageur='Gabriel'  and nom_nageur ='CASTILLO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,80,16,NULL),




((select id_nageur from nageur where prenom_nageur='Karen'  and nom_nageur ='TORREZ'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,81,21,NULL),





((select id_nageur from nageur where prenom_nageur='James'  and nom_nageur ='FREEMAN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,82,22,NULL),






((select id_nageur from nageur where prenom_nageur='Stephanie'  and nom_nageur ='BALDUCCINI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,82,22,NULL),






((select id_nageur from nageur where prenom_nageur='Guilherme'  and nom_nageur ='BASSETO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,83,22,NULL),








((select id_nageur from nageur where prenom_nageur='Marcelo'  and nom_nageur ='CHIERIGHINI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,84,24,NULL),








((select id_nageur from nageur where prenom_nageur='Breno'  and nom_nageur ='CORREIA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210815,81,21,NULL),






((select id_nageur from nageur where prenom_nageur='Guilherme'  and nom_nageur ='COSTA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,87,25,NULL),









((select id_nageur from nageur where prenom_nageur='Beatriz Pimentel'  and nom_nageur ='DIZOTTI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210815,90,42,NULL),






((select id_nageur from nageur where prenom_nageur='Bruno'  and nom_nageur ='FRATUS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,89,29,NULL),




((select id_nageur from nageur where prenom_nageur='Matheus'  and nom_nageur ='GONCHE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,90,45,NULL),







((select id_nageur from nageur where prenom_nageur='Guilherme'  and nom_nageur ='GUIDO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210814,81,21,NULL),







((select id_nageur from nageur where prenom_nageur='Viviane'  and nom_nageur ='JUNGBLUT'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,88,50,NULL),





((select id_nageur from nageur where prenom_nageur='Vinicius'  and nom_nageur ='LANZA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210817,60,33,NULL),





((select id_nageur from nageur where prenom_nageur='Felipe'  and nom_nageur ='LIMA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210817,90,50,NULL),





((select id_nageur from nageur where prenom_nageur='Etiene'  and nom_nageur ='MEDEIROS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210818,88,45,NULL),




((select id_nageur from nageur where prenom_nageur='Luiz Altamir'  and nom_nageur ='MELO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210818,69,50,NULL),




((select id_nageur from nageur where prenom_nageur='Larissa'  and nom_nageur ='OLIVEIRA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210820,70,50,NULL),



((select id_nageur from nageur where prenom_nageur='Caio'  and nom_nageur ='PUMPUTIS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210820,71,51,NULL),



((select id_nageur from nageur where prenom_nageur='Aline'  and nom_nageur ='RODRIGUES'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210820,72,52,NULL),




((select id_nageur from nageur where prenom_nageur='Gabrielle'  and nom_nageur ='RONCATTO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210821,75,58,NULL),



((select id_nageur from nageur where prenom_nageur='Gabriel'  and nom_nageur ='SANTOS'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210821,75,58,NULL),






((select id_nageur from nageur where prenom_nageur='Fernando'  and nom_nageur ='SCHEFFER'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210821,60,45,NULL),




((select id_nageur from nageur where prenom_nageur='Murilo'  and nom_nageur ='SETIN SARTORI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,61,47,NULL),



((select id_nageur from nageur where prenom_nageur='Nathalia'  and nom_nageur ='SIQUEIRA ALMEIDA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,63,49,NULL),




((select id_nageur from nageur where prenom_nageur='Pedro'  and nom_nageur ='SPAJARI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,64,55,NULL),



((select id_nageur from nageur where prenom_nageur='Giovanna'  and nom_nageur ='TOMANIK DIAMANTE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,70,58,NULL),




((select id_nageur from nageur where prenom_nageur='Ana Carolina'  and nom_nageur ='VIEIRA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,73,78,NULL),




((select id_nageur from nageur where prenom_nageur='Abdulla Essa'  and nom_nageur ='AHMED ALI YUSUF'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,73,78,NULL),



((select id_nageur from nageur where prenom_nageur='Noor'  and nom_nageur ='YUSUF ABDULLA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,73,78,NULL),



((select id_nageur from nageur where prenom_nageur='Muhammad Isa'  and nom_nageur ='AHMAD'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,73,58,NULL),



((select id_nageur from nageur where prenom_nageur='Lyubomir'  and nom_nageur ='EPITROPOV'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,4,58,NULL),



((select id_nageur from nageur where prenom_nageur='Antani'  and nom_nageur ='IVANOV'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,4,58,NULL),



((select id_nageur from nageur where prenom_nageur='Kaloyan'  and nom_nageur ='LEVTEROV'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,48,58,NULL),



((select id_nageur from nageur where prenom_nageur='Josif'  and nom_nageur ='MILADINOV'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210825,48,58,NULL),



((select id_nageur from nageur where prenom_nageur='Diana'  and nom_nageur ='PETKOVA'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,48,58,NULL),



((select id_nageur from nageur where prenom_nageur='Adama'  and nom_nageur ='OUEDRAOGO'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,65,40,NULL),



((select id_nageur from nageur where prenom_nageur='Yanhan'  and nom_nageur ='AI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210825,45,41,NULL),



((select id_nageur from nageur where prenom_nageur='Jie'  and nom_nageur ='CHEN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,55,67,NULL),



((select id_nageur from nageur where prenom_nageur='Yujie'  and nom_nageur ='CHENG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,57,56,NULL),



((select id_nageur from nageur where prenom_nageur='Long'  and nom_nageur ='CHENG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,52,66,NULL),



((select id_nageur from nageur where prenom_nageur='Jie'  and nom_nageur ='DONG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,43,43,NULL),





((select id_nageur from nageur where prenom_nageur='Junyi'  and nom_nageur ='HE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,33,23,NULL),



((select id_nageur from nageur where prenom_nageur='Jinquan'  and nom_nageur ='HONG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,34,25,NULL),




((select id_nageur from nageur where prenom_nageur='Bingjie'  and nom_nageur ='LI'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,36,28,NULL),




((select id_nageur from nageur where prenom_nageur='Yaxin'  and nom_nageur ='LIU'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,37,29,NULL),


((select id_nageur from nageur where prenom_nageur='Xuwei'  and nom_nageur ='PENG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,38,30,NULL),



((select id_nageur from nageur where prenom_nageur='Jiajun'  and nom_nageur ='SUN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,32,32,NULL),



((select id_nageur from nageur where prenom_nageur='Muhan'  and nom_nageur ='TANG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,33,34,NULL),



((select id_nageur from nageur where prenom_nageur='Muhan'  and nom_nageur ='TANG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,36,38,NULL),



((select id_nageur from nageur where prenom_nageur='Qianting'  and nom_nageur ='TANG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,37,39,NULL),





((select id_nageur from nageur where prenom_nageur='Mireia'  and nom_nageur ='BELMONTE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,49,41,NULL),



((select id_nageur from nageur where prenom_nageur='Nicolas'  and nom_nageur ='GARCIA SAIZ '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,50,42,NULL),



((select id_nageur from nageur where prenom_nageur='Hugo'  and nom_nageur ='GONZALEZ'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,55,43,NULL),



((select id_nageur from nageur where prenom_nageur='Ole'  and nom_nageur ='BRAUNSCHWEIG'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,56,45,NULL),




((select id_nageur from nageur where prenom_nageur='Annika'  and nom_nageur ='BRUHN'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,57,46,NULL),




((select id_nageur from nageur where prenom_nageur='Christian'  and nom_nageur ='DIENER'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,58,49,NULL),





((select id_nageur from nageur where prenom_nageur='Christoph'  and nom_nageur ='FILDEBRANDT'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,59,50,NULL),




((select id_nageur from nageur where prenom_nageur='Lena'  and nom_nageur ='HENTSCHEL'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210823,40,52,NULL),










((select id_nageur from nageur where prenom_nageur ='Ayoub' and nom_nageur ='Ahmed'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,43,1,'Or'),




((select id_nageur from nageur where prenom_nageur='Jack Alan'  and nom_nageur ='McLoughlin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,19,2,'Argent'),



((select id_nageur from nageur where prenom_nageur='Kieran'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,19,3,'Bronze'),



((select id_nageur from nageur where prenom_nageur='Henning Bennet'  and nom_nageur ='Muhlleitner'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,45,4,NULL),


((select id_nageur from nageur where prenom_nageur='Felix'  and nom_nageur ='Auböck '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,45,5,NULL),





((select id_nageur from nageur where prenom_nageur='Gabriele'  and nom_nageur ='Detti'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,46,6,NULL),




((select id_nageur from nageur where prenom_nageur='Elijah' and nom_nageur ='Winnington'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,48,7,NULL),


((select id_nageur from nageur where prenom_nageur='Jake' and nom_nageur ='Mitchell '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,49,8,NULL),


-- 100m brasse


((select id_nageur from nageur where prenom_nageur='Adam' and nom_nageur ='Peaty'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Finale'),20210816,46,1,'Or'),



((select id_nageur from nageur where prenom_nageur='Arno'  and nom_nageur ='Kamminga'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Finale'),20210816,47,2,'Argent'),




((select id_nageur from nageur where prenom_nageur='Nicolo'  and nom_nageur ='Martinenghi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Finale'),20210816,48,3,'Bronze'),




((select id_nageur from nageur where prenom_nageur='Michael'  and nom_nageur ='Andrew'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Finale'),20210816,50,4, NULL),






-- 100 m dos



((select id_nageur from nageur where prenom_nageur='Evgeny'  and nom_nageur ='Rylov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,48,1, 'Or'),



((select id_nageur from nageur where prenom_nageur='Kliment'  and nom_nageur ='Kliment'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,50,2,'Argent'),





((select id_nageur from nageur where prenom_nageur='Thomas'  and nom_nageur ='Ceccon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,54,4,NULL ),



((select id_nageur from nageur where prenom_nageur='Jiayu'  and nom_nageur ='Xu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,55,5, NULL),





((select id_nageur from nageur where prenom_nageur='Mitchell'  and nom_nageur ='Larkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,59,7, NULL),




((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Glinta'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210816,61,8, NULL),






((select id_nageur from nageur where prenom_nageur='Tomoru'  and nom_nageur ='Honda'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210816,49,2, 'Bronze'),



((select id_nageur from nageur where prenom_nageur='Federico'  and nom_nageur ='Burdisso'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon'and statut_epreuve='Finale'),20210816,51,3,'Argent'),



((select id_nageur from nageur where prenom_nageur='Tamas' and nom_nageur ='Kenderesi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210816,54,4,NULL),




((select id_nageur from nageur where prenom_nageur='Chad Guy Dertrand'  and nom_nageur ='Le Clos'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210816,56,5, NULL),





((select id_nageur from nageur where prenom_nageur='Gunnar'  and nom_nageur ='Bentz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210816,60,7, NULL),



((select id_nageur from nageur where prenom_nageur='Krzysztof'  and nom_nageur ='Chmielewski'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210816,64,8, NULL),

-- 800 m nage libre



((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Finke'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,51,1,'Or'),




((select id_nageur from nageur where prenom_nageur='Gregorio'  and nom_nageur ='Paltrinieri'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,53,2,'Argent'),





((select id_nageur from nageur where prenom_nageur='Florian'and nom_nageur ='Wellbrock'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210816,57,4,NULL),






((select id_nageur from nageur where prenom_nageur='Sergiy'  and nom_nageur ='Frolov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryan'  and nom_nageur ='Murphy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,2,'Argent'),




((select id_nageur from nageur where prenom_nageur='Luke'  and nom_nageur ='Greenbank'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,3,'bronze'),



((select id_nageur from nageur where prenom_nageur='Bryce'  and nom_nageur ='Mefford '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,4,NULL),



((select id_nageur from nageur where prenom_nageur='Adam'  and nom_nageur ='Telegdy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,5,NULL),



((select id_nageur from nageur where prenom_nageur='Radoslaw'  and nom_nageur ='Kawecki '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryosuke'  and nom_nageur ='Irie '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,7,NULL),





((select id_nageur from nageur where prenom_nageur='Nicolas'  and nom_nageur ='Saiz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,8,NULL),



((select id_nageur from nageur where prenom_nageur='Mykhailo'  and nom_nageur ='Romanchuk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,1,'Or'),




((select id_nageur from nageur where prenom_nageur='Daniel'  and nom_nageur ='Jervis'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,2,'Argent'),




((select id_nageur from nageur where prenom_nageur='Kirill'  and nom_nageur ='Martynychev'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Finale'),20210816,60,3,'Bronze'),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,38,1,'Or'),



((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,39,2,'Argent'),



((select id_nageur from nageur where prenom_nageur='Bingjie'  and nom_nageur ='Li'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,42,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Summer'  and nom_nageur ='McIntosh'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,45,4,NULL),

((select id_nageur from nageur where prenom_nageur='Muhan'  and nom_nageur ='Tang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,46,5,NULL),

((select id_nageur from nageur where prenom_nageur='Isabel'  and nom_nageur ='Marie GOSE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,48,6,NULL),

((select id_nageur from nageur where prenom_nageur='Paige'  and nom_nageur ='Madden'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,49,7,NULL),

((select id_nageur from nageur where prenom_nageur='Erika'  and nom_nageur ='Fairweather'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210801,49,8,NULL),







((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,35,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,38,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,39,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kathleen'  and nom_nageur ='Dawson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Kira'  and nom_nageur ='Toussaint'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,45,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasia'  and nom_nageur ='Gorbenko'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,46,8,NULL),


((select id_nageur from nageur where prenom_nageur='Lydia'  and nom_nageur ='Jacoby'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,37,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Tatjana '  and nom_nageur ='Schoenmaker'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,38,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='ULilly'  and nom_nageur ='King'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,39,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Evgeniia'  and nom_nageur ='Chikunova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Yuliya'  and nom_nageur ='Hansson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Amartina'  and nom_nageur ='Carraro'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Mona'  and nom_nageur ='McSharry'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210802,46,7,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,28,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,32,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,35,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Junxuan'  and nom_nageur ='Yang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,37,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Barbora'  and nom_nageur ='Seemanova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,43,6,NULL),

((select id_nageur from nageur where prenom_nageur='Federica'  and nom_nageur ='Pellegrini'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Madison'  and nom_nageur ='Wilson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210803,46,8,NULL),




((select id_nageur from nageur where prenom_nageur='Yufei'  and nom_nageur ='Zhang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,29,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,35,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Hali'  and nom_nageur ='Flickinger'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,40,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Boglarka'  and nom_nageur ='Kapas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Svetlana'  and nom_nageur ='Chimrova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,41,5,NULL),

((select id_nageur from nageur where prenom_nageur='Liyan'  and nom_nageur ='Yu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Alys'  and nom_nageur ='Thomas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Brianna '  and nom_nageur ='Throssell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Finale'),20210805,46,8,NULL),




((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,30,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,31,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,32,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,35,4,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Femke'  and nom_nageur ='Heemskerk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Anna'  and nom_nageur ='Hopkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,45,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210806,46,8,NULL),





((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,35,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,37,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Simona'  and nom_nageur ='Quadarella'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,38,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Grimes'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Jianjiah'  and nom_nageur ='Wang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kiah'  and nom_nageur ='Melverton'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Kohler'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasiia'  and nom_nageur ='Kirpichnikova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210807,46,8,NULL),




((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,26,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,29,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,35,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,38,4,NULL),

((select id_nageur from nageur where prenom_nageur='Phoebe'  and nom_nageur ='Bacon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Taylor'  and nom_nageur ='Ruck'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,46,6,NULL),

((select id_nageur from nageur where prenom_nageur='Xuwe'  and nom_nageur ='Peng'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,48,7,NULL),

((select id_nageur from nageur where prenom_nageur='Yaxin'  and nom_nageur ='Liu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Finale'),20210807,49,8,NULL),





((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,17,1,'Or'),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,18,2,'Argent'),

((select id_nageur from nageur where prenom_nageur='Pernille'  and nom_nageur ='Blume'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,20,3,'Bronze'),

((select id_nageur from nageur where prenom_nageur='Ranomi'  and nom_nageur ='Kromowidjojo'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,22,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katarzyna'  and nom_nageur ='Wasick'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,25,5,NULL),

((select id_nageur from nageur where prenom_nageur='Qingfeng'  and nom_nageur ='Wu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,30,6,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,35,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Finale'),20210808,46,8,NULL),



-- demi finale --



((select id_nageur from nageur where prenom_nageur ='Ayoub' and nom_nageur ='Ahmed'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,43,1,NULL),




((select id_nageur from nageur where prenom_nageur='Jack Alan'  and nom_nageur ='McLoughlin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,19,2,NULL),



((select id_nageur from nageur where prenom_nageur='Kieran'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,19,3,NULL),

((select id_nageur from nageur where prenom_nageur='Henning Bennet'  and nom_nageur ='Muhlleitner'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,33,4,NULL),


((select id_nageur from nageur where prenom_nageur='Felix'  and nom_nageur ='Auböck '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,33,5,NULL),





((select id_nageur from nageur where prenom_nageur='Gabriele'  and nom_nageur ='Detti'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,42,6,NULL),




((select id_nageur from nageur where prenom_nageur='Elijah' and nom_nageur ='Winnington'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,39,7,NULL),


((select id_nageur from nageur where prenom_nageur='Jake' and nom_nageur ='Mitchell '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,49,8,NULL),

((select id_nageur from nageur where prenom_nageur='Adam' and nom_nageur ='Peaty'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Series'),20210816,42,1,NULL),



((select id_nageur from nageur where prenom_nageur='Arno'  and nom_nageur ='Kamminga'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Series'),20210816,47,2,NULL),




((select id_nageur from nageur where prenom_nageur='Nicolo'  and nom_nageur ='Martinenghi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Series'),20210816,39,3,NULL),




((select id_nageur from nageur where prenom_nageur='Michael'  and nom_nageur ='Andrew'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Series'),20210816,50,4, NULL),





((select id_nageur from nageur where prenom_nageur='Evgeny'  and nom_nageur ='Rylov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,39,1, NULL),



((select id_nageur from nageur where prenom_nageur='Kliment'  and nom_nageur ='Kliment'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,50,2,NULL),





((select id_nageur from nageur where prenom_nageur='Thomas'  and nom_nageur ='Ceccon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,54,4,NULL ),



((select id_nageur from nageur where prenom_nageur='Jiayu'  and nom_nageur ='Xu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,55,5, NULL),





((select id_nageur from nageur where prenom_nageur='Mitchell'  and nom_nageur ='Larkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,59,7, NULL),




((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Glinta'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210816,61,8, NULL),







((select id_nageur from nageur where prenom_nageur='Tomoru'  and nom_nageur ='Honda'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210816,49,2, NULL),



((select id_nageur from nageur where prenom_nageur='Federico'  and nom_nageur ='Burdisso'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon'and statut_epreuve='Series'),20210816,51,3,NULL),



((select id_nageur from nageur where prenom_nageur='Tamas' and nom_nageur ='Kenderesi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210816,54,4,NULL),




((select id_nageur from nageur where prenom_nageur='Chad Guy Dertrand'  and nom_nageur ='Le Clos'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210816,56,5, NULL),





((select id_nageur from nageur where prenom_nageur='Gunnar'  and nom_nageur ='Bentz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210816,60,7, NULL),



((select id_nageur from nageur where prenom_nageur='Krzysztof'  and nom_nageur ='Chmielewski'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210816,64,8, NULL),

-- 800 m nage libre



((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Finke'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,51,1,NULL),




((select id_nageur from nageur where prenom_nageur='Gregorio'  and nom_nageur ='Paltrinieri'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,53,2,NULL),





((select id_nageur from nageur where prenom_nageur='Florian'and nom_nageur ='Wellbrock'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210816,57,4,NULL),






((select id_nageur from nageur where prenom_nageur='Sergiy'  and nom_nageur ='Frolov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryan'  and nom_nageur ='Murphy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Luke'  and nom_nageur ='Greenbank'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Bryce'  and nom_nageur ='Mefford '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,4,NULL),



((select id_nageur from nageur where prenom_nageur='Adam'  and nom_nageur ='Telegdy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,5,NULL),



((select id_nageur from nageur where prenom_nageur='Radoslaw'  and nom_nageur ='Kawecki '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryosuke'  and nom_nageur ='Irie '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,7,NULL),





((select id_nageur from nageur where prenom_nageur='Nicolas'  and nom_nageur ='Saiz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,8,NULL),



((select id_nageur from nageur where prenom_nageur='Mykhailo'  and nom_nageur ='Romanchuk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,1,NULL),




((select id_nageur from nageur where prenom_nageur='Daniel'  and nom_nageur ='Jervis'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Kirill'  and nom_nageur ='Martynychev'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Series'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,39,1,NULL),



((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,41,2,NULL),




((select id_nageur from nageur where prenom_nageur='Summer'  and nom_nageur ='McIntosh'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,33,4,NULL),


((select id_nageur from nageur where prenom_nageur='Isabel'  and nom_nageur ='Marie GOSE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,39,6,NULL),

((select id_nageur from nageur where prenom_nageur='Paige'  and nom_nageur ='Madden'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,49,7,NULL),

((select id_nageur from nageur where prenom_nageur='Erika'  and nom_nageur ='Fairweather'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210801,49,8,NULL),







((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,32,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,39,2,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,41,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kathleen'  and nom_nageur ='Dawson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Kira'  and nom_nageur ='Toussaint'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasia'  and nom_nageur ='Gorbenko'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,42,8,NULL),


((select id_nageur from nageur where prenom_nageur='Lydia'  and nom_nageur ='Jacoby'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,37,1,NULL),

((select id_nageur from nageur where prenom_nageur='Tatjana '  and nom_nageur ='Schoenmaker'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,39,2,NULL),

((select id_nageur from nageur where prenom_nageur='ULilly'  and nom_nageur ='King'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,41,3,NULL),

((select id_nageur from nageur where prenom_nageur='Evgeniia'  and nom_nageur ='Chikunova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Yuliya'  and nom_nageur ='Hansson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Amartina'  and nom_nageur ='Carraro'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Mona'  and nom_nageur ='McSharry'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Series'),20210802,42,7,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,39,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,32,2,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,32,3,NULL),

((select id_nageur from nageur where prenom_nageur='Junxuan'  and nom_nageur ='Yang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,37,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Barbora'  and nom_nageur ='Seemanova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,43,6,NULL),

((select id_nageur from nageur where prenom_nageur='Federica'  and nom_nageur ='Pellegrini'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Madison'  and nom_nageur ='Wilson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210803,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Yufei'  and nom_nageur ='Zhang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,32,1,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,32,2,NULL),

((select id_nageur from nageur where prenom_nageur='Hali'  and nom_nageur ='Flickinger'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,40,3,NULL),

((select id_nageur from nageur where prenom_nageur='Boglarka'  and nom_nageur ='Kapas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Svetlana'  and nom_nageur ='Chimrova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,41,5,NULL),

((select id_nageur from nageur where prenom_nageur='Liyan'  and nom_nageur ='Yu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Alys'  and nom_nageur ='Thomas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Brianna '  and nom_nageur ='Throssell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Series'),20210805,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,30,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,31,2,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,32,3,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,32,4,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Femke'  and nom_nageur ='Heemskerk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Anna'  and nom_nageur ='Hopkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210806,42,8,NULL),





((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,32,1,NULL),

((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,37,2,NULL),

((select id_nageur from nageur where prenom_nageur='Simona'  and nom_nageur ='Quadarella'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,39,3,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Grimes'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Jianjiah'  and nom_nageur ='Wang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kiah'  and nom_nageur ='Melverton'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Kohler'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasiia'  and nom_nageur ='Kirpichnikova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210807,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,26,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,32,2,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,32,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,39,4,NULL),

((select id_nageur from nageur where prenom_nageur='Phoebe'  and nom_nageur ='Bacon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Taylor'  and nom_nageur ='Ruck'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Xuwe'  and nom_nageur ='Peng'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,39,7,NULL),

((select id_nageur from nageur where prenom_nageur='Yaxin'  and nom_nageur ='Liu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Series'),20210807,49,8,NULL),





((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,17,1,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,18,2,NULL),

((select id_nageur from nageur where prenom_nageur='Pernille'  and nom_nageur ='Blume'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,20,3,NULL),

((select id_nageur from nageur where prenom_nageur='Ranomi'  and nom_nageur ='Kromowidjojo'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,22,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katarzyna'  and nom_nageur ='Wasick'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,25,5,NULL),

((select id_nageur from nageur where prenom_nageur='Qingfeng'  and nom_nageur ='Wu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,30,6,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,32,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Series'),20210808,42,8,NULL),


-- demi finale


((select id_nageur from nageur where prenom_nageur ='Ayoub' and nom_nageur ='Ahmed'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,43,1,NULL),




((select id_nageur from nageur where prenom_nageur='Jack Alan'  and nom_nageur ='McLoughlin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,19,2,NULL),



((select id_nageur from nageur where prenom_nageur='Kieran'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,19,3,NULL),



((select id_nageur from nageur where prenom_nageur='Henning Bennet'  and nom_nageur ='Muhlleitner'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,33,4,NULL),


((select id_nageur from nageur where prenom_nageur='Felix'  and nom_nageur ='Auböck '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,33,5,NULL),





((select id_nageur from nageur where prenom_nageur='Gabriele'  and nom_nageur ='Detti'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,45,6,NULL),




((select id_nageur from nageur where prenom_nageur='Elijah' and nom_nageur ='Winnington'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,48,7,NULL),


((select id_nageur from nageur where prenom_nageur='Jake' and nom_nageur ='Mitchell '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,49,8,NULL),


-- 100m brasse


((select id_nageur from nageur where prenom_nageur='Adam' and nom_nageur ='Peaty'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale2'),20210816,45,1,NULL),



((select id_nageur from nageur where prenom_nageur='Arno'  and nom_nageur ='Kamminga'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale2'),20210816,47,2,NULL),




((select id_nageur from nageur where prenom_nageur='Nicolo'  and nom_nageur ='Martinenghi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale2'),20210816,48,3,NULL),




((select id_nageur from nageur where prenom_nageur='Michael'  and nom_nageur ='Andrew'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale2'),20210816,50,4, NULL),






-- 100 m dos



((select id_nageur from nageur where prenom_nageur='Evgeny'  and nom_nageur ='Rylov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,48,1, NULL),



((select id_nageur from nageur where prenom_nageur='Kliment'  and nom_nageur ='Kliment'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,50,2,NULL),





((select id_nageur from nageur where prenom_nageur='Thomas'  and nom_nageur ='Ceccon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,54,4,NULL ),



((select id_nageur from nageur where prenom_nageur='Jiayu'  and nom_nageur ='Xu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,55,5, NULL),





((select id_nageur from nageur where prenom_nageur='Mitchell'  and nom_nageur ='Larkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,59,7, NULL),




((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Glinta'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210816,61,8, NULL),

-- 200m papillon







((select id_nageur from nageur where prenom_nageur='Tomoru'  and nom_nageur ='Honda'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210816,49,2, NULL),



((select id_nageur from nageur where prenom_nageur='Federico'  and nom_nageur ='Burdisso'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon'and statut_epreuve='Demi_finale2'),20210816,51,3,NULL),



((select id_nageur from nageur where prenom_nageur='Tamas' and nom_nageur ='Kenderesi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210816,54,4,NULL),




((select id_nageur from nageur where prenom_nageur='Chad Guy Dertrand'  and nom_nageur ='Le Clos'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210816,56,5, NULL),





((select id_nageur from nageur where prenom_nageur='Gunnar'  and nom_nageur ='Bentz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210816,60,7, NULL),



((select id_nageur from nageur where prenom_nageur='Krzysztof'  and nom_nageur ='Chmielewski'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210816,64,8, NULL),
((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Finke'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,51,1,NULL),




((select id_nageur from nageur where prenom_nageur='Gregorio'  and nom_nageur ='Paltrinieri'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,53,2,NULL),





((select id_nageur from nageur where prenom_nageur='Florian'and nom_nageur ='Wellbrock'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210816,57,4,NULL),






((select id_nageur from nageur where prenom_nageur='Sergiy'  and nom_nageur ='Frolov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryan'  and nom_nageur ='Murphy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Luke'  and nom_nageur ='Greenbank'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Bryce'  and nom_nageur ='Mefford '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,4,NULL),



((select id_nageur from nageur where prenom_nageur='Adam'  and nom_nageur ='Telegdy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,5,NULL),



((select id_nageur from nageur where prenom_nageur='Radoslaw'  and nom_nageur ='Kawecki '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryosuke'  and nom_nageur ='Irie '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,7,NULL),





((select id_nageur from nageur where prenom_nageur='Nicolas'  and nom_nageur ='Saiz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,8,NULL),



((select id_nageur from nageur where prenom_nageur='Mykhailo'  and nom_nageur ='Romanchuk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,1,NULL),




((select id_nageur from nageur where prenom_nageur='Daniel'  and nom_nageur ='Jervis'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Kirill'  and nom_nageur ='Martynychev'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale2'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,38,1,NULL),



((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,41,2,NULL),



((select id_nageur from nageur where prenom_nageur='Bingjie'  and nom_nageur ='Li'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,45,3,NULL),

((select id_nageur from nageur where prenom_nageur='Summer'  and nom_nageur ='McIntosh'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,33,4,NULL),

((select id_nageur from nageur where prenom_nageur='Muhan'  and nom_nageur ='Tang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,45,5,NULL),

((select id_nageur from nageur where prenom_nageur='Isabel'  and nom_nageur ='Marie GOSE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,48,6,NULL),

((select id_nageur from nageur where prenom_nageur='Paige'  and nom_nageur ='Madden'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,49,7,NULL),

((select id_nageur from nageur where prenom_nageur='Erika'  and nom_nageur ='Fairweather'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210801,49,8,NULL),

((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,38,2,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,41,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kathleen'  and nom_nageur ='Dawson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,45,6,NULL),

((select id_nageur from nageur where prenom_nageur='Kira'  and nom_nageur ='Toussaint'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasia'  and nom_nageur ='Gorbenko'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,45,8,NULL),


((select id_nageur from nageur where prenom_nageur='Lydia'  and nom_nageur ='Jacoby'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,37,1,NULL),

((select id_nageur from nageur where prenom_nageur='Tatjana '  and nom_nageur ='Schoenmaker'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,38,2,NULL),

((select id_nageur from nageur where prenom_nageur='ULilly'  and nom_nageur ='King'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,41,3,NULL),

((select id_nageur from nageur where prenom_nageur='Evgeniia'  and nom_nageur ='Chikunova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Yuliya'  and nom_nageur ='Hansson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,45,5,NULL),

((select id_nageur from nageur where prenom_nageur='Amartina'  and nom_nageur ='Carraro'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Mona'  and nom_nageur ='McSharry'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210802,45,7,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,38,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,32,2,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,29,3,NULL),

((select id_nageur from nageur where prenom_nageur='Junxuan'  and nom_nageur ='Yang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,37,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Barbora'  and nom_nageur ='Seemanova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,43,6,NULL),

((select id_nageur from nageur where prenom_nageur='Federica'  and nom_nageur ='Pellegrini'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Madison'  and nom_nageur ='Wilson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210803,45,8,NULL),




((select id_nageur from nageur where prenom_nageur='Yufei'  and nom_nageur ='Zhang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,29,2,NULL),

((select id_nageur from nageur where prenom_nageur='Hali'  and nom_nageur ='Flickinger'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,40,3,NULL),

((select id_nageur from nageur where prenom_nageur='Boglarka'  and nom_nageur ='Kapas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Svetlana'  and nom_nageur ='Chimrova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,41,5,NULL),

((select id_nageur from nageur where prenom_nageur='Liyan'  and nom_nageur ='Yu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,45,6,NULL),

((select id_nageur from nageur where prenom_nageur='Alys'  and nom_nageur ='Thomas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Brianna '  and nom_nageur ='Throssell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale2'),20210805,45,8,NULL),




((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,30,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,31,2,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,32,3,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,29,4,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Femke'  and nom_nageur ='Heemskerk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Anna'  and nom_nageur ='Hopkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210806,45,8,NULL),





((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,37,2,NULL),

((select id_nageur from nageur where prenom_nageur='Simona'  and nom_nageur ='Quadarella'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,38,3,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Grimes'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Jianjiah'  and nom_nageur ='Wang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,45,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kiah'  and nom_nageur ='Melverton'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Kohler'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasiia'  and nom_nageur ='Kirpichnikova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210807,45,8,NULL),




((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,26,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,29,2,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,29,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,38,4,NULL),

((select id_nageur from nageur where prenom_nageur='Phoebe'  and nom_nageur ='Bacon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Taylor'  and nom_nageur ='Ruck'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,45,6,NULL),

((select id_nageur from nageur where prenom_nageur='Xuwe'  and nom_nageur ='Peng'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,48,7,NULL),

((select id_nageur from nageur where prenom_nageur='Yaxin'  and nom_nageur ='Liu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale2'),20210807,49,8,NULL),





((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,17,1,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,18,2,NULL),

((select id_nageur from nageur where prenom_nageur='Pernille'  and nom_nageur ='Blume'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,20,3,NULL),

((select id_nageur from nageur where prenom_nageur='Ranomi'  and nom_nageur ='Kromowidjojo'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,22,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katarzyna'  and nom_nageur ='Wasick'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,25,5,NULL),

((select id_nageur from nageur where prenom_nageur='Qingfeng'  and nom_nageur ='Wu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,30,6,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,29,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale2'),20210808,45,8,NULL),



((select id_nageur from nageur where prenom_nageur ='Ayoub' and nom_nageur ='Ahmed'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,43,1,NULL),




((select id_nageur from nageur where prenom_nageur='Jack Alan'  and nom_nageur ='McLoughlin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,19,2,NULL),



((select id_nageur from nageur where prenom_nageur='Kieran'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,19,3,NULL),



((select id_nageur from nageur where prenom_nageur='Henning Bennet'  and nom_nageur ='Muhlleitner'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,33,4,NULL),


((select id_nageur from nageur where prenom_nageur='Felix'  and nom_nageur ='Auböck '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,33,5,NULL),





((select id_nageur from nageur where prenom_nageur='Gabriele'  and nom_nageur ='Detti'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,42,6,NULL),




((select id_nageur from nageur where prenom_nageur='Elijah' and nom_nageur ='Winnington'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,48,7,NULL),


((select id_nageur from nageur where prenom_nageur='Jake' and nom_nageur ='Mitchell '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,49,8,NULL),


-- 100m brasse


((select id_nageur from nageur where prenom_nageur='Adam' and nom_nageur ='Peaty'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale1'),20210816,42,1,NULL),



((select id_nageur from nageur where prenom_nageur='Arno'  and nom_nageur ='Kamminga'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale1'),20210816,47,2,NULL),




((select id_nageur from nageur where prenom_nageur='Nicolo'  and nom_nageur ='Martinenghi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale1'),20210816,48,3,NULL),




((select id_nageur from nageur where prenom_nageur='Michael'  and nom_nageur ='Andrew'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Brasse' and statut_epreuve='Demi_finale1'),20210816,50,4, NULL),






-- 100 m dos



((select id_nageur from nageur where prenom_nageur='Evgeny'  and nom_nageur ='Rylov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,48,1, NULL),



((select id_nageur from nageur where prenom_nageur='Kliment'  and nom_nageur ='Kliment'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,50,2,NULL),





((select id_nageur from nageur where prenom_nageur='Thomas'  and nom_nageur ='Ceccon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,54,4,NULL ),



((select id_nageur from nageur where prenom_nageur='Jiayu'  and nom_nageur ='Xu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,55,5, NULL),





((select id_nageur from nageur where prenom_nageur='Mitchell'  and nom_nageur ='Larkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,59,7, NULL),




((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Glinta'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210816,61,8, NULL),








((select id_nageur from nageur where prenom_nageur='Tomoru'  and nom_nageur ='Honda'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210816,49,2, NULL),



((select id_nageur from nageur where prenom_nageur='Federico'  and nom_nageur ='Burdisso'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon'and statut_epreuve='Demi_finale1'),20210816,51,3,NULL),



((select id_nageur from nageur where prenom_nageur='Tamas' and nom_nageur ='Kenderesi'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210816,54,4,NULL),




((select id_nageur from nageur where prenom_nageur='Chad Guy Dertrand'  and nom_nageur ='Le Clos'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210816,56,5, NULL),





((select id_nageur from nageur where prenom_nageur='Gunnar'  and nom_nageur ='Bentz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210816,60,7, NULL),



((select id_nageur from nageur where prenom_nageur='Krzysztof'  and nom_nageur ='Chmielewski'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210816,64,8, NULL),

-- 800 m nage libre



((select id_nageur from nageur where prenom_nageur='Robert'  and nom_nageur ='Finke'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,51,1,NULL),




((select id_nageur from nageur where prenom_nageur='Gregorio'  and nom_nageur ='Paltrinieri'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,53,2,NULL),





((select id_nageur from nageur where prenom_nageur='Florian'and nom_nageur ='Wellbrock'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210816,57,4,NULL),






((select id_nageur from nageur where prenom_nageur='Sergiy'  and nom_nageur ='Frolov'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryan'  and nom_nageur ='Murphy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Luke'  and nom_nageur ='Greenbank'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Bryce'  and nom_nageur ='Mefford '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,4,NULL),



((select id_nageur from nageur where prenom_nageur='Adam'  and nom_nageur ='Telegdy'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,5,NULL),



((select id_nageur from nageur where prenom_nageur='Radoslaw'  and nom_nageur ='Kawecki '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,6,NULL),




((select id_nageur from nageur where prenom_nageur='Ryosuke'  and nom_nageur ='Irie '),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,7,NULL),





((select id_nageur from nageur where prenom_nageur='Nicolas'  and nom_nageur ='Saiz'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,8,NULL),



((select id_nageur from nageur where prenom_nageur='Mykhailo'  and nom_nageur ='Romanchuk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,1,NULL),




((select id_nageur from nageur where prenom_nageur='Daniel'  and nom_nageur ='Jervis'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,2,NULL),




((select id_nageur from nageur where prenom_nageur='Kirill'  and nom_nageur ='Martynychev'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='1500m' and type_epreuve='Nage_libre' and statut_epreuve ='Demi_finale1'),20210816,60,3,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,28,1,NULL),



((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,39,2,NULL),



((select id_nageur from nageur where prenom_nageur='Bingjie'  and nom_nageur ='Li'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,42,3,NULL),

((select id_nageur from nageur where prenom_nageur='Summer'  and nom_nageur ='McIntosh'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,33,4,NULL),

((select id_nageur from nageur where prenom_nageur='Muhan'  and nom_nageur ='Tang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Isabel'  and nom_nageur ='Marie GOSE'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,48,6,NULL),

((select id_nageur from nageur where prenom_nageur='Paige'  and nom_nageur ='Madden'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,49,7,NULL),

((select id_nageur from nageur where prenom_nageur='Erika'  and nom_nageur ='Fairweather'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='400m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210801,49,8,NULL),







((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,28,2,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,39,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kathleen'  and nom_nageur ='Dawson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Kira'  and nom_nageur ='Toussaint'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasia'  and nom_nageur ='Gorbenko'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,42,8,NULL),


((select id_nageur from nageur where prenom_nageur='Lydia'  and nom_nageur ='Jacoby'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,37,1,NULL),

((select id_nageur from nageur where prenom_nageur='Tatjana '  and nom_nageur ='Schoenmaker'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,28,2,NULL),

((select id_nageur from nageur where prenom_nageur='ULilly'  and nom_nageur ='King'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,39,3,NULL),

((select id_nageur from nageur where prenom_nageur='Evgeniia'  and nom_nageur ='Chikunova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Yuliya'  and nom_nageur ='Hansson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Amartina'  and nom_nageur ='Carraro'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Mona'  and nom_nageur ='McSharry'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210802,42,7,NULL),



((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,28,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,32,2,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,29,3,NULL),

((select id_nageur from nageur where prenom_nageur='Junxuan'  and nom_nageur ='Yang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,37,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Barbora'  and nom_nageur ='Seemanova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,43,6,NULL),

((select id_nageur from nageur where prenom_nageur='Federica'  and nom_nageur ='Pellegrini'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Madison'  and nom_nageur ='Wilson'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210803,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Yufei'  and nom_nageur ='Zhang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Regan'  and nom_nageur ='Smith'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,29,2,NULL),

((select id_nageur from nageur where prenom_nageur='Hali'  and nom_nageur ='Flickinger'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,40,3,NULL),

((select id_nageur from nageur where prenom_nageur='Boglarka'  and nom_nageur ='Kapas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Svetlana'  and nom_nageur ='Chimrova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,39,5,NULL),

((select id_nageur from nageur where prenom_nageur='Liyan'  and nom_nageur ='Yu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Alys'  and nom_nageur ='Thomas'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Brianna '  and nom_nageur ='Throssell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Papillon' and statut_epreuve='Demi_finale1'),20210805,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,30,1,NULL),

((select id_nageur from nageur where prenom_nageur='Siobhan'  and nom_nageur ='Haughey'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,31,2,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,32,3,NULL),

((select id_nageur from nageur where prenom_nageur='Penny'  and nom_nageur ='Oleksiak'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,29,4,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Femke'  and nom_nageur ='Heemskerk'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Anna'  and nom_nageur ='Hopkin'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,33,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='100m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210806,42,8,NULL),





((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Ledecky'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,29,1,NULL),

((select id_nageur from nageur where prenom_nageur='Ariarne'  and nom_nageur ='Titmus'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,37,2,NULL),

((select id_nageur from nageur where prenom_nageur='Simona'  and nom_nageur ='Quadarella'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,28,3,NULL),

((select id_nageur from nageur where prenom_nageur='Katie'  and nom_nageur ='Grimes'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,40,4,NULL),

((select id_nageur from nageur where prenom_nageur='Jianjiah'  and nom_nageur ='Wang'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,42,5,NULL),

((select id_nageur from nageur where prenom_nageur='Kiah'  and nom_nageur ='Melverton'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,44,6,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Kohler'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,44,7,NULL),

((select id_nageur from nageur where prenom_nageur='Anastasiia'  and nom_nageur ='Kirpichnikova'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='800m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210807,42,8,NULL),




((select id_nageur from nageur where prenom_nageur='Kaylee'  and nom_nageur ='Rochelle McKeown'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,26,1,NULL),

((select id_nageur from nageur where prenom_nageur='Kylie'  and nom_nageur ='Masse'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,29,2,NULL),

((select id_nageur from nageur where prenom_nageur='Emily'  and nom_nageur ='Jane Seebohm'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,29,3,NULL),

((select id_nageur from nageur where prenom_nageur='Rhyan'  and nom_nageur ='White'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,28,4,NULL),

((select id_nageur from nageur where prenom_nageur='Phoebe'  and nom_nageur ='Bacon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,40,5,NULL),

((select id_nageur from nageur where prenom_nageur='Taylor'  and nom_nageur ='Ruck'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,42,6,NULL),

((select id_nageur from nageur where prenom_nageur='Xuwe'  and nom_nageur ='Peng'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,48,7,NULL),

((select id_nageur from nageur where prenom_nageur='Yaxin'  and nom_nageur ='Liu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='200m' and type_epreuve='Dos' and statut_epreuve='Demi_finale1'),20210807,49,8,NULL),





((select id_nageur from nageur where prenom_nageur='Emma'  and nom_nageur ='McKeon'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,17,1,NULL),

((select id_nageur from nageur where prenom_nageur='Sarah'  and nom_nageur ='Sjoestroem'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,18,2,NULL),

((select id_nageur from nageur where prenom_nageur='Pernille'  and nom_nageur ='Blume'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,20,3,NULL),

((select id_nageur from nageur where prenom_nageur='Ranomi'  and nom_nageur ='Kromowidjojo'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,22,4,NULL),

((select id_nageur from nageur where prenom_nageur='Katarzyna'  and nom_nageur ='Wasick'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,25,5,NULL),

((select id_nageur from nageur where prenom_nageur='Qingfeng'  and nom_nageur ='Wu'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,30,6,NULL),

((select id_nageur from nageur where prenom_nageur='Cate'  and nom_nageur ='Campbell'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,29,7,NULL),

((select id_nageur from nageur where prenom_nageur='Abbey'  and nom_nageur ='Weitzeil'),
(select epreuve.id_epreuve from epreuve where nom_epreuve='50m' and type_epreuve='Nage_libre' and statut_epreuve='Demi_finale1'),20210808,42,8,NULL);



