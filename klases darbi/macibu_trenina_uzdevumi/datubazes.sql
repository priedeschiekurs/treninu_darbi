--==============================
--1. tabulu izveide
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
    --phpMyAdmin - ir TĪMEKĻA PĀRVALDĪBAS RĪKS, AR KURU VAR STRADAT  MySQL/MAria DB datubāzes.
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
    ('401'),
    ('402'),
    ('403'),
    ('404');

INSERT INTO skoleni (vards,	    uzvards,    vecums, epasts,                 grupas_id,      iestajas)       VALUES
                    ('Anna',    'Bērziņa',  18,     'anna@example.test',    1,              '2026-09-01'),
                    ('Jānis',   'Ozols',    19,     'janis@example.test',   1,              '2026-09-01'),
                    ('Līga',    'Kalniņa',  17,     NULL,                   1,              '2026-09-02'),
                    ('Martiņš', 'Liepa',    20,     'martins@example.test', 2,              '2026-09-01'),
                    ('Elīna',   'Liepa',    18,     'elina@example.test',   2,              '2026-09-02'),
                    ('Roberts', 'Siliņa',   19,     NULL,                   3,              '2026-09-01'),
                    ('Marta',   'Krūmiņa',  17,     'marta@example.test',   3,              '2026-09-01'),
                    ('Kārlis',  'Vītols',   21,     'karlis@example.test',  3,              '2026-09-03'),
                    ('Paula',   'Egle',     18,     'paula@example.test',   NULL,           '2026-09-01')

                    
INSERT INTO skoleni (vards,	    uzvards,    vecums, epasts,                 grupas_id,      iestajas)       VALUES
                    ('Dace',    'Lapa',     18,     null,                   1,              '2026-09-03');

-- =============================================================
-- 4. Datu apskate - SELECT (CRUD: READ)
-- =============================================================

-- SELECT - iegūst datus no tabulas.
-- Zveigznīte (*) niozīme "visas kolaonas"
SELECT * FROM skoleni;

-- Atlasam konkrētus datus
SELECT vards, uzvards, vecums FROM skoleni;

-- AS - piesķir rezultāta kolonnai citu, lasāmāku nosaukumu. (Tas NEMAINA īsto kolonnas nosaukumu datubāzē).
SELECT vards AS Vards, uzvards AS Uzvards
FROM skoleni;

-- DISTINCT - atgriež tikai atšķirīgās (neatkārtojošās) vērtības.
SELECT DISTINCT vecums FROM skoleni;

-- Apskatam grupas
SELECT * FROM grupas;

-- =============================================================
-- 5. Datu filtrēšana - WHERE
-- =============================================================
-- WHERE - atlasa tikai tos ierakstus, kas atbild nosacijumiem.
-- Salīdzināšanas operātori: =, <>, >, <, >=, <=.
SELECT * FROM skoleni WHERE vecums = 18;
SELECT * FROM skoleni WHERE vecums > 18;
SELECT * FROM skoleni WHERE vecums <> 18;

-- AND - jaizpildās ABIEM nosacijumiem.
SELECT * FROM skoleni
WHERE vecums >= 18 AND grupas_id = 1;

-- OR - pietiek, ja izpildās VISMAZ VIENS nosacijums.
SELECT * FROM skoleni
WHERE grupas_id = 1 OR grupas_id = 2;

-- NOT - noliedz nosacijumu.
SELECT * FROM skoleni
WHERE NOT (vecums < 18);

-- BETWEEN - diapazons, ieskaitot abas robežvērtības.
SELECT * FROM skoleni
WHERE vecums BETWEEN 18 AND 20;

-- IN - vērtība atbils kādām elementam dotajā sarakstā
SELECT * FROM skoleni
WHERE grupas_id IN (1, 3)

-- LIKE - teksta meklēšana pēc parauga.
-- % nozīmē jubkādu rastzīmju skaitu (arī neviena)
-- _ nozīmē tieši vienu rakstzīmi.
SELECT * FROM skoleni WHERE vards LIKE 'M%';
SELECT * FROM skoleni WHERE uzvards LIKE '%a';
SELECT * FROM skoleni WHERE uzvards LIKE '%p_';
-- NULL nozīmē, ka kolonnas vērtība nav zināma vai nav norādīta.
--NULL salīdzināsanai lieto IS, nevis =NULL.
SELECT * FROM skoleni WHERE epasts IS NULL;
SELECT * FROM skoleni WHERE epasts IS NOT NULL;

--==============================================================
-- 6. rezultātu kārtošana - ORDER BY/ LIMIT / OFFSET
--==============================================================
-- ORDER BY - SAKARTOT ATLASĪTĀS RINDAS.
-- ASC - augošā secībā (pēc noklusējuma)
-- DESC - dilstošā secībā
SELECT vards, uzvards, vecums
FROM skoleni
ORDER BY vecums ASC;

SELECT * FROM skoleni ORDER BY vecums ASC;
-- DESC - dilstošā secībā
SELECT * FROM skoleni ORDER BY vecums DESC;
-- var sakartot pēc vairākiem kritērijiem
SELECT * FROM skoleni ORDER BY vecums ASC, uzvards DESC;
--LIMIT - parāda ierobežoto rindu skaitu.
--ierobežo atgriežamo rindu skaitu.
--ieteicams norādīt ar ORDER BY,
-- lai iegūtu paredzamu rezultātu.
SELECT * FROM skoleni
ORDER BY id ASC
 LIMIT 3; 
--OFFSET - izlaist noteiktu rindu skaitu 
--no rezultāta.(piem. lapošanai).
-- Šeit izlaiž 3 pirmās rindas un parāda nakamās 3
SELECT * FROM skoleni
ORDER BY id ASC
 LIMIT 3 OFFSET 3;
--==============================================================
--7. datu atjaunošana - UPDATE (CRUD: UPDATE)
--==============================================================
UPDATE - maina esošos ierakstus tabulā.
SET - norāda, kuras kolonnas vērtības jāmaina.
WHERE - nosaka, kuri ieraksti jāmaina.    
--svarīgi, ja nav norādīts WHERE, tiks mainīti VISI ieraksti tabulā.
--piemērs: labojam tiesi skolēna ar id = 6.
SELECT * FROM skoleni WHERE id = 6;
UPDATE skoleni
SET UZVARDS = 'SILIŅŠ'
WHERE id = 6;
-- vienā UPDATE komandā drīkst labot arīvairākus laukus.
UPDATE skoleni
SET epasts = 'dace@example.test', grupas_id = 2
WHERE id = 10;
--rezultāta parbaude:
SELECT * FROM skoleni WHERE id = 10;

-- BĪSTAMS PIEMĒRS: 
-- Sī komanda visiem skolniekiem nomainītu vecumu uz 18.!
UPDATE skoleni SET vecums = 18;
--==============================================================
--8. datu dzēšana - DELETE (CRUD: DELETE)
--==============================================================
--DELETE FROM - dzēš vairākus ierakstus no tabulas.
--WHERE - nosaka, kuri ieraksti jādzēš.

--uzmanību !!! var tikt izdzēsti visi ieraksti,
-- ja nav norādīts WHERE.
DELETE FROM skoleni WHERE id = 6;
--pārbaude:
SELECT * FROM skoleni WHERE id = 6;
--BĪSTAMAIS PIEMĒRS:
--Šī komanda izdzēstu VISUS skolēnus no tabulas.
DELETE FROM skoleni;

--==============================================================
--9. tabulas struktūras maiņa- ALTER TABLE
--==============================================================
 --ALTER TABLE maina tabulas KOLONNAS vai IEROBEŽOJUMUS, 
 --nevis tikai datus.
--  ADD - pievieno jaunu kolonnu
ALTER TABLE skoleni 
ADD COLUMN telefons VARCHAR(20); NULL;
-- ievietojam vērtību jaunajā kolonnā
UPDATE skoleni
SET telefons = '+371 12345678'
WHERE id = 1;

-- CHANGE KOLUMN - PARDEVĒ KOLONNU (JĀNORADA ARĪ DATU TIPS)
ALTER TABLE skoleni
CHANGE COLUMN telefons talrunis VARCHAR(20) NULL;

-- MODIFY COLUMN - maina kolonnas datu tipu vai 
--ierobežojumus (atribūti).
ALTER TABLE skoleni
MODIFY COLUMN talrunis VARCHAR(20) NULL;

--COMENT- SAGLABĀ LAUKKA DEFINICIJAS SKAIDROJUMU.
ALTER TABLE skoleni
MODIFY COLUMN talrunis VARCHAR(20) 
NULL COMMENT 'Skolēna tālruņa numurs';
--PAGAIDU COLONNA
ALTER TABLE skoleni
ADD COLUMN ABC VARCHAR(50) NULL
--DROP COLUMN - dzēš kolonnu no tabulas. UN VISAS TAJĀ GLABATAS VĒRTĪBAS.
ALTER TABLE skoleni
DROP COLUMN ABC
--!!! KOLOMMAS VAI TABULAS NEVAR IZDZEST, 
--JA TAS IR PIESAISTITAS ATSLEGAI CITAI TABULAI.!!!

--RENAME COLUMN- pardēve kolonnu MySQL 8.0+ 
--vai MariaDB 10.5+ vidē.
ALTER TABLE skoleni RENAME COLUMN talrunis TO ABC
--RENAME TABLE - MAINA TABULAS NAOSAUKUMU
RENAME TABLE skoleni TO audzekni;
RENAME TABLE audzekni TO skoleni;

--==================================================
--10. tabulu sasaiste, primary key, unique, default
--==================================================
-- primary key (pk)- unikali identifice tabulas rindu.
--parasti tas ir ID 
--mūsu  tabula skolēni.id ir pk, un grupas.id ir pk.
-- piweraksta skoleni.id, pirmais skoleni ir tabulas nosaukums
-- un id ir tas tabulas kolonnas nosaukums.

--FOREIGE KEY (FK)- AREJĀ ATSLĒGA, 
--KURA NORĀDA UZ CITAS TABULAS (PK)
--skoleni.grupas_id -> grupas.id
--piemers: grupas_id = 2, ka skolens pieder grupai ar id =2

-- UNIQUE - neļauj atkārtotas nosaukumu vērtības,
-- tās kolonnas ietvaros.

-- DEFAULT- automatiska vertība, ja to nenorāda.
-- piemēram: CURRENT_TIMESTAMP.

-- ALTER TABLE skoleni
ADD CONSTRAINT fk_skoleni_grupas
FOREIGN KEY(grupas_id)
REFERENCES grupas (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

--ON DELETE RESTRICT- liedz izdzēst grupu, kura vēl ir (skoleni).
--ON UPDATE CASCADE - mainot grupas PK, FK vērtības tiktu pielāgotas.
-- parasti PK mainīt nav ieteicams.

CREATE TABLE atzimes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skolen_id INT NOT NULL,
    prieksmets VARCHAR (60) NOT NULL,
    atzime TINYINT NOT NULL,
    datums DATE NOT NULL,
    CONSTRAINT fk_atzimes_skoleni
        FOREIGN KEY (skolena_id)
        REFERENCES skoleni (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
--ON DELETE CASCADE - ja izdzesis (skoleni), 
--automatiski izdzesisies ari (atzime).
--šo noteikumun drīks lietot tikai tad, 
--ja šaāda rīcība atbilst sistemas prasībam.
--realās sistemās bieži vajag arhivēšanu, nevis dzēšanu.

INSERT INTO atzimes (skolena_id, prieksmets, atzime, datums,)
VALUES
     (1, 'sql', 9, '2026-10-01'),
     (1, 'sql', 10, '2026-10-01'),
     (2, 'sql', 9, '2026-10-01'),
     (2, 'sql', 9, '2026-10-01'),
     (3, 'sql', 9, '2026-10-01'),
     (4, 'sql', 9, '2026-10-01'),
     (5, 'sql', 9, '2026-10-01'),
     (6, 'sql', 9, '2026-10-01'),
     (7, 'sql', 9, '2026-10-01'),
     (8, 'sql', 9, '2026-10-01')

SELECT * FROM atzimes;
--bistamais piemers: 
 INSERT INTO atzimes (skolena_id, prieksmets, atzime, datums,)
VALUES
     (999, 'sql', 9, '2026-10-01')
     --pieprasit skolena id, kurs neeksiste skolena tabula.
-- DELITE FROM grupas WHERE ID = 1;
--JO NEVAR IZDZEST GRUPU, KURAI PIESDAISTITI SKOLENI (CITI DATI TABULA).
--=============================================
--11. JOIN- DATU IEGŪŠANA NO VAIRĀKAM TABULĀM,
--IZMANTOJKOT SAISTĪTOS LAUKUS.
--=============================================
-- JOIN SASAISTA RINDAS NO VAIRAKAM TABULĀM,
--IZMANTOJOT SASAISTĪTOS LAUKUS.
-- AS - PIELIETOJAM, LAI DABŪTU ĪSĀKUS NOSAUKUMUS (PSEIDONĪMI).

--INNER JOIN- PARADA TIKAI TOS IERAKSTUS,
-- KURIEM IR ATBILSTĪBA ABAS TABULĀS.

ALTER TABLE grupas
CHANGE COLUMN nosaukus nosaukums VARCHAR (20) NULL;
-- IZLABOJAM TABULAS NOSAUKUMA KLUDU

 SELECT skoleni.vards, skoleni.uzvards, grupas.nosaukums
 FROM skoleni
 INNER JOIN grupas ON skoleni.grupas_id = grupas.id
  -- AR AS
  SELECT S.VARDS, S.UZVARDS, G.NOSAUKUMS AS GRUPA
  FROM SKOLENI AS S
  INNER JOIN GRUPAS AS G ON S.GRUPAS_ID = G.ID
  -- STARDA ARI AR CAPS LOCK GAN AR MAZIEM BURTIEM.
  SELECT ABC.VARDS, ABC.UZVARDS, ABC.NOSAUKUMS AS GRUPA
  FROM SKOLENI AS ABC
  INNER JOIN GRUPAS AS G ON ABC.GRUPAS_ID = G.ID
   
   SELECT SK.VARDS, SK.UZVARDS, SK.NOSAUKUMS AS GRUPA
  FROM SKOLENI AS SK
  INNER JOIN GRUPAS AS G ON SK.GRUPAS_ID = G.ID
  --ISLAICIGI PARVERS GAROS NOSAUKUMUS SAISINAJUMOS.
  -- VAR IZMANTOT JEBKADU SAISINAJUMU.

  --LEFT JOIN parādīs visus skolēnus,
  -- arī tos, kuriem nav grupas.
  SELECT s.vards, s.uzvards, g.nosacijums AS grupa.
  FROM skoleni AS s
  LEFT JOIN grupas AS g ON  s.grupas_id = g.id;

  --RIGHT JOIN parārīs visas grupas, arī grupu 404 bez skoleniem.
   SELECT s.vards, s.uzvards, g.nosacijums AS grupa.
  FROM skoleni AS s
 RIGHT JOIN grupas AS g ON  s.grupas_id = g.id;
 -- DIVI JOIN vienā vaicājuma.
 SELECT s.vards, s.uzvards, AS Uzvards g.nosacijums AS grupa,
 a.prieksmets, a.atzime
 FROM skoleni AS s
 LEFT JOIN grupas AS g ON  s.grupas_id = g.id;
 LEFT JOIN atzimes AS a ON a.skolena_id = s.id
 ORDER BY s.id, a.datums;

 --=================================================
 --12. DATU APKOPOŠANA- COUNT, SUM, AVG, 
--MIN, MAX, GROUP BY,M HAVING.
 --=================================================
SELECT COUNT (*) AS Skolenu_skaits FROM skoleni
--caount(epasts) -skaita tikai rindas,. kuras epasts nav NULL.
SELECT COUNT(epasts) AS SKOLENI_AR_EPASTU FROM SKOLENI;

--MIN/MAX - MAZAKA/ LIELĀKĀ VĒRTĪBA.
SELECT MIN (VECUMS) AS JAUNAKAIS, MAX (VECUMS) AS VECAKAIS
FROM SKOLENI;

--AVG- VIDĒJĀ VERTIBA; SUM -VĒRTĪBU SUMMA.
SELECT AVG (ATZĪME) AS VIDĒJĀ_ATZĪME,
 SUM(ATZĪME) AS ATZĪMJU_SUMMA
 FROM ATZĪMES;

 --GROUP BY - sadala rezultātu grupās,
 --lai katrai veiktu aprēķinus.
 SELECT grupas_id, AS 'GRUPAS ID', COUNT(*) AS 'skolēnu skaits' 
 from  skoleni
 group by grupas_id;

 --grupas nosaukums+ skolenu skaits. (IESKAITOT TUKŠU GRUPU).
 --COUNT (s.id), nevis COUNT(*),
 --LEFT JOIN tukšai grupai atgriez NULL skolēnu.
  SELECT g.nosaukums, AS 'Grupa', COUNT(s.id) AS 'Skolēnu skaits' 
 FROM grupas as g
 LEFT JOIN skoleni AS s ON s.grupas_id=g.id
 group by g.id, g.nosaukums
 ORDER BY g.nosaukums;

--HAVING- atlasa GRUPAS pēc apkopošanas rezultāta.
--WHERE filtrē  rindas pirms grupēšanas, HAVING pēc tās.