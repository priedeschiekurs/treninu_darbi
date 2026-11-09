--==============================
--2. tabulu izveide
--==============================

--datubaze- organizeta datu kratuve
--DBVS(DATUBAZES VERTIBAS SISSTEMA) -programma, kas pārvalda datubazes.
    --piemers MysQl, MarinDB, PostgreSQL, SQLite.
    --datubazau veidi (vienkarsoti)
   -- realizacijas datu bazazes:dati tasbula, kas saistitas ar atslegam.
    -- piemers: MysQl, MarinDB,PostgreSQL, SQLite.
    --dokumentu datubazes:dati dokumentu veida piemers: MongoDB.
    --atslegas -vertibas datu bazes: atslegas un tai pievienotas vertiba, piem., Redis.
    -- Grafu DB: attiecības pret objektiem, piem., NEo4j.

--SQL komandas grupē šādi:
    --DDL: CREATE, ALTER, DROP -IZVEIDO VAI MAIN ADATUBAŽU STRUKTURU.
    --DML: INSERT, UPDATE, DELETE - maina datus.
    --DQL: SELECT - lasa datus.

    --SQL (Structured Query Language)- strukturēta vaicājuma valoda.
    --phpMyAdmin - ir TĪMEKĻA PĀRVALDĪBAS RĪKS, ARN KURU VAR STRADAT  MySQL/MAria DB datubāzes.
    --phpMyAdmin NAV atsevišķā datubāze un NAV SQL valoda.

    -- CREATE DATUBASE- izvedo datubazi.
    --IF NOT EXISTS- NEIZVADA KLUDU, JA DATUBAZE JAU EKSISTE. 
    --CHARACTER SET utf8mb4- nodrosina plasu  rakstzīmju atbalstu.
    CREATE DATABASE IF NOT EXISTS skola_sql_piemeri
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci; 

    --USE - norāda datubāzi, ar kuru turpmak strādāsim.
    USE skola_sql_piemeri;

    --SHOW DATABASE - parāda datubāzes, kas ir pieejamas.
    SHOW DATABASES;

    --SELECT DATABASE()- parāda paslaik izvelēto datubāzi.
    SELECT DATABASE ();

    -- AS asociatīvs nosaukums izvadei.
    SELECT DATABASE () AS paslaik_izveleta_datubaze;
    
    -- DROP - izdzēš gan tabulas, datubāzes.
DROP DATABASE tests;
DROP DATABASE IF EXISTS tests;

DROP TABLE atzimes;
DROP TABLE IF EXISTS atzimes;

--==============================
--2. tabulu izveide
--==============================
-- TABULA satāvb no kolonām - 
-- (laukiem) un rindām (ierakstiem).

--BIEZI LIETOTIE DATU TIPI;
--INT               -(intiger- veseli skaitli (piem.  ID, daudzumi))
--TINYINT           -MAZS VESELS SKAITLIS (PIEM, VECUMS, ATZIME)
--varchar (225)     - teksts lidz 225 atzimem.

--text - garaks teksts.
--DECIMAL (10,20)   -datums, piemeram, ''2026-09-01''.
--DATETIME          - datums un laiks, piem., ''2026-09-01 12:00:00''.
--timestamp         -datums/ laika vertiba, bieži tiek izmantots,
-- lai izsekotu, kad ieraksts tika izveidots vai pēdējo reizi atjaunināts.
--BOOLEAN           -patiesi/aplami (MySQL glaba kā TINYINT (10)).

-- BIEŽI LIETOTI IEROBEZOJUMI:

-- PRIMARY KEY   -unikali identifice ierakstu- pirma atslega.
                    -- kolona ir galvenā atslēga.
--AUTO_INCREMENT     -KATRAM NAKAMAJAM IERAKSTAM PIESKIR NAKAMO ID. 
                   -- kolona automātiski palielinās par 1,
                 -- kad tiek pievienots jauns ieraksts.
-- NOT NULL       - kolona nevar būt tukša. 
                --saja laukaobligati jabut ierakstam.
--NULL          - kolona var būt tukša.
                --saja lauka vertiba var nebut zinama vai noradita.
-- UNIQUE -      kolona must būt unikāla.
--DEFAULT -       nelauj atkartot ne NULL vertibas. 
--FOREIGN KEY -   kolona ir ārējā atslēga.
            -- LIETO, LAI SAVIENOTU  DIVU TABULU DATUS.

CREATE TABLE grupas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nosaukums VARCHAR(20) NOT NULL UNIQUE,
);
CREATE TABLE skoleni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vards VARCHAR(50) NOT NULL,
    uzvards VARCHAR(50) NOT NULL,
    vecums TINYINT NOT NULL,
    epasts VARCHAR(100) NULL,
    grupa_id DATE NOT NULL,
    iestajas DATE NOT NULL,
    izveidots TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);
--SHOW TABLES- parāda  datubāzes, kas ir pieejamas.
SHOW TABLES;
--DESCRIBE tabulas_nosaukums- parāda tabulas struktūru.
describe skoleni;
-- SHOW CREATE SKOLENI- parāda tabulas kolonnas, datu tipus un atslegas.
SHOW CREATE TABLE skoleni;



--===================================
--3. datu pievienošanas- INSERT INTO
--===================================
--CRUD- IR ČETUR PAMATDARBĪBU KOPUMS
    --C - CREATE: izveidot jaunu ierakstu.(INSERT INTO)
    --R -READ: apskatit ierakstus  (SELECT)
    --U - UPDATE: atjaunot ierakstu (UPDATE)
    --D - DELETE: dzēst ierakstu (DELETE)
    --PIEZĪME: CRUD ''creaate'' attiecas uz datu ierakstu pievienošanu.
    --CREATE TABLE/CREATE DATABASE VEIDO DATABAZES STRUKTURU.

    --INSERT INTO- pievieno jaunu/US ierakstus tabulā.
    --AUTO_INCREMENT- LAUKAM id VERTIBA NAV NORADĪTA.
    INSERT INTO grupas (nosaukums) VALUES
    ('1. grupa'),
    ('2. grupa'),
    ('3. grupa');