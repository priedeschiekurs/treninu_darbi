-- =============================================================
-- 1. DATUBAZES
-- =============================================================
-- Datubaze - organizeta datu krātuve
-- DBVS(datubāzes vadības sistēma) - Programas kas pārvalda datubāzes.
    -- Piemers MySQL, MariaDB, PostgreSQL, SQLite.
-- Datubazu veidi (vienkaršoti):
    -- Relāciju datubāzes: dati tabulās, kas saistītas ar atslēgām.
        -- Piemers MySQL, MariaDB, PostgreSQL, SQLite
    --  Dokumentu datubāzes: dati dokumentu veidā, piem., MongoDB
    --  Atslēgas-vērtības datubāzes: atslēgas un tai pievienota vētība, piem., Redis.
    --  Grafu DB: attiecības pret objektiem, piem., Neo4j.

-- SQL komandas grupē šādi:
    -- DDL: CREATE, ALTER, DROP - izveido vai maina datubāžu struktūru.
    -- DML: INSERT, UPDATE, DELETE - maina datus.
    -- DQL: SELECT - lasa datus.

-- SQL (Structured Query Language) - strukturēta vaicājumu valoda.
-- phpMyAdmin ir TĪMEKĻA RĪKS, ar kuru var stradāt ar MySQL/MariaDB
    -- phpMyAdmin NAV atsevišķa datubāze un NAV SQL valoda.

-- CREATE DATABASE - izveido datubāzi.
-- IF NOT EXISTS - nezvada kļūdu, ja datubāze jau eksistē.
-- CHARACTER SET utf8mb4 - nodrošina plašu rakstzīmju atbalstu.
CREATE DATABASE IF NOT EXISTS skola_sql_piemeri
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- USE - norāda datubāzi, ar kuru turpmak strādāsim.
USE skola_sql_piemeri;

-- SHOW DATABASE - parāda pieejamās datubāzes.
SHOW DATABASES;

-- SELECT DATABASE() - parāda pašlaik izvēleto datubāzi.
SELECT DATABASE();

-- AS - Asocatīvs nosaukums.
SELECT DATABASE() AS paslaik_izveleta_datubaze; 

-- DROP - izdzēš gan tabulas, datubāzes.
DROP DATABASE tests;
DROP DATABASE IF EXISTS tests;

DROP TABLE atzimes;
DROP TABLE IF EXISTS atzimes;

-- =============================================================
-- 2. Tabulu izveide - CREATE TABLE
-- =============================================================
-- Tabula sastāv no kolonām (laukiem) un rindām (ierakstiem). 

-- BIEŽI LIETOTIE DATU TIPI:
-- INT                  - vesels slaitlis (piem., ID, daudzumi) 
-- TINYINT              - mazs vesals slaitlis (piem, vecums, atzīme)
-- VARCHAR(255)         - tekts līdz 255 rakstzīmēm.
-- TEXT                 - garāks tekts.
-- DECIMAL (10,2)       - precīzs skaitlis ar 2 zīmēm aiz komata (cena).
-- DATE                 - datums, piemēram, '2026-09-01'.
-- DATETIME             - datums un laiks.
-- TIMESTAMP            - datums/laika vērtība, bieži izmanto izveides laikam. 
-- BOOLEAN              - patiesi/aplami (MySQL glabā ka TINYINT(1)).

-- Bieži lietoti ierobežojumi:
-- PRIMARY KEY          - primārā atslēga: unikāli idenficē ierakstu.
-- AUTO_INCREMENT       - katram jaunam ierakstam piešķir nakamo ID.
-- NOT NULL             - šaja laukā obligāti jabūt vērtībai.
-- NULL                 - šaja laukā vertība var nebūt zināma / norādīta.
-- UNIQUE               - neatļauj atkārtotas ne-NULL vērtības.
-- DEFAULT              - noklusētā vērtība, ja to nenorāda.

CREATE DATABASE IF NOT EXISTS skola_sql_piemeri

USE skola_sql_piemeri;

CREATE TABLE grupas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nosaukus VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE skoleni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vards VARCHAR(50) NOT NULL,
    uzvards VARCHAR(50) NOT NULL,
    vecums TINYINT NOT NULL,
    epasts VARCHAR(100) NULL,
    grupas_id INT NULL,
    iestajas DATE NOT NULL,
    izveidots TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- SHOW TABLES - parāda datubāzes tabulas.
SHOW TABLES;

-- DESCRIBE - parada tabulas kolonas, datu tipus un atslēgas.
DESCRIBE skoleni;

-- SHOW CREATE TABLE - parāda SQL, ar kuru izveidota tabula.
SHOW CREATE TABLE skoleni;


-- =============================================================
-- 3. Datu pievienošana - INSERT INTO
-- =============================================================
-- CRUD ir četur pamatdarbību kopums:
    -- C - Create: Izveido ierakstu (INSERT INTO).
    -- R - Read: apskatīt ierakstus (SELECT).
    -- U - Update: labot ierakstus (UPDATE).
    -- D - Delete: dzest ierakstus (DELETE).
-- Piezīme: CRUD "Create" attiecās uz datu ierakstu pievienošanu. 
-- CREATE TABLE /CREATE DATABASE veido datubāzes struktūru.

-- INSERT INTO - pievieno jaunu ierakstu (vai vairakus ierakstus).
-- AUTO_INCREMENT laukam id vertību nav jānorāda.

INSERT INTO grupas (nosaukus) VALUES
    ('401'),
    ('402'),
    ('403'),
    ('404');

-- Pievienojam vairakus skolenus vienā komandā.
-- Vertību secībai jasakrīt ar kolonnu secību iekavās.
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

-- NULL nozīmē "vertības nav norādīta".
-- Null salīdzināšanai lieto IS , nevis = NULL.
SELECT * FROM skoleni WHERE epasts IS NULL;
SELECT * FROM skoleni WHERE grupas_id IS NOT NULL;

-- =============================================================
-- 6. Rezultātu kārtošana - ORDER BY / LIMIT / OFFSET
-- =============================================================
-- ORDER BY - sakārtos atlasītās rindas.
-- ASC -augošā secībā (pēc noklusejuma), DESC - dilstošā secībā.
SELECT vards, uzvards, vecums
FROM skoleni
ORDER BY vecums ASC;

SELECT vards, uzvards, vecums
FROM skoleni
ORDER BY vecums DESC, uzvards ASC;

-- LIMIT - parada ierobežotu rindu skaitu. 
-- Ieteicams norādīt ar ORDER BY, lai iegūtu paredzamu rezultātu. 
SELECT * FROM skoleni
ORDER BY id ASC
LIMIT 5;

-- OFFSET - izlaiž norādīto rindu skaitu (piem., lapošanai).
-- Šeit izlaiž 3 pirmās rindas un parāda nakamās 3.
SELECT * FROM skoleni
ORDER BY id ASC
LIMIT 3 OFFSET 3;

-- =============================================================
-- 7. Datu labošana - UPDATE (CRUD: UPDATE)
-- =============================================================
-- UPDATE - maina jau esoša ieraksta datus.
-- SET - norāda, kura lauka vērtību jamaina.
-- WHERE - norada, KURU ierakstu labot.
-- !!!!!!!!!!!!!!!!!!!!!
-- SVARĪGI: bez WHERE var tikt izmainītas VISAS tabulas rindas!

-- Piemērs: labojam tieši skolēna ar id = 6.
SELECT * FROM skoleni WHERE id = 6;
UPDATE skoleni
SET uzvards = 'Siliņš'
WHERE id = 6;

-- Vienā UPDATE komandā drīkst labot arī vairākus laukus.
UPDATE skoleni
SET epasts = 'dace@example.test', grupas_id = 2
WHERE id = 10;

-- Rezultāta pārbuade:
SELECT * FROM skoleni WHERE id = 10;

-- BĪSTAMS PIEMĒRS
-- Šī komanda visiem skoleniem nomainītu vecumu uz 18!
UPDATE skoleni SET vecums = 18; 

-- =============================================================
-- 8. Datu dzēšana - DELETE (CRUD: DELETE)
-- =============================================================
-- DELETE FROM - dzēš vienu vai vairākus ierakstus
-- WHERE nosaka, kuri ieraksti ir jādzēš.
-- !!!!!!!!!!!!!!!!!!!!!
-- SVARĪGI: bez WHERE var tikt izdzēstas VISAS tabulas rindas!

-- Dzēšam tikai skolēnu DAci ar id = 10.
DELETE FROM skoleni WHERE id = 10;
-- Pārbaude:
SELECT * FROM skoleni WHERE id = 10;

-- BĪSTAMS PIEMĒRS
-- Tas izdzēsīs VISUS SKOLĒNUS, bet pati tabula paliks. 
DELETE FROM skoleni;

-- =============================================================
-- 9. Tabulas struktūras maiņa - ALTER TABLE
-- =============================================================
-- ALTER TABLE maina tabulas KOLONNAS vai IEROBEŽOJUMUS, nevis taikai datus.
-- ADD COLUMN - pievienos jaunu kolonnu.
ALTER TABLE skoleni
ADD COLUMN telefons VARCHAR(20) NULL;

-- Ievietojam vērtību jaunajā kolonnā.
UPDATE skoleni
SET telefons = '200000001'
WHERE id = 1;

-- CHANGE COLUMN - pārdēvē kolonnu(jānorāda arī datu tips).
ALTER TABLE skoleni
CHANGE COLUMN telefons talrunis VARCHAR(20) NULL;

-- MODIFY COLUMN - maina kolonnas datu tipu vai atribūtus.
ALTER TABLE skoleni
MODIFY COLUMN talrunis VARCHAR(30) NULL;

-- COMMENT - saglabā lauka skaidrojumu tabulas definīcijā.
ALTER TABLE skoleni
MODIFY COLUMN talrunis VARCHAR(30) NULL COMMENT 'Skolena kontakttālrunis';

-- Pagidu kolona 
ALTER TABLE skoleni
ADD COLUMN ABC VARCHAR(50) NULL;

-- DROP COLUMN - izdzēš kolonnu un visas tajā glabātās vērtības. 
ALTER TABLE skoleni
DROP COLUMN ABC;

-- RENAME COLUMN - pārdēve kolonnu MySQL 8.0+ vidē vai MariaDB 10.5+
-- ALTER TABLE skoleni RENAME COLUMN telefons TO talrunis

-- RENAME TABLE - maina tabulas nosaukumu.
RENAME TABLE skoleni TO audzekni;
RENAME TABLE audzekni TO skoleni;








