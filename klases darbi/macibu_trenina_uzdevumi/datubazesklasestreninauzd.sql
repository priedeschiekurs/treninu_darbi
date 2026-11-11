SQL treniņa uzdevumi — XAMPP / phpMyAdmin
Skolēna darba lapa

Mācību vide: XAMPP (Apache + MySQL/MariaDB), phpMyAdmin → SQL. Uzdevumi veidoti atbilstoši dotajam materiālam; JOIN un ārējās atslēgas nav iekļautas.
Darba kārtība

•	Uzdevumus izpildi secīgi: nākamās tēmas izmanto iepriekšējās tabulas un datus.
•	Darba datubāze: sql_trenins. Nelieto DROP/DELETE citās datubāzēs.
•	Katrai SQL darbībai izmanto phpMyAdmin cilni SQL; apskati rezultātu un kļūdu paziņojumus.
•	7.–9. tēmas maina datus un struktūru; atkārtojot treniņu, izveido jaunu datubāzi vai sāc no sākuma.
•	Pēc katra uzdevuma saglabā SQL komandu savos pierakstos.

1. Datubāzes un phpMyAdmin


1. Atver XAMPP Control Panel, palaid Apache un MySQL. Pārlūkā atver http://localhost/phpmyadmin/. Pieraksti, kā pārbaudīji, ka savienojums darbojas.
SQL / atbilde:__ 
__localhost/phpmy admin atveras un darbojas _____

2. Paskaidro saviem vārdiem: datubāze, DBVS, SQL un phpMyAdmin.
SQL / atbilde:
 1. datubāze- organizeta datu glabatava
 2. DBVS(datubāzes vadības sistēma) - Programas kas pārvalda datubāzes. 
3. SQL (Structured Query Language)- strukturēta vaicājuma valoda.
4.phpMyAdmin-timekla riks, kur vasr stradat ar dartu bazem.

3. Nosauc pa vienam piemēram relāciju, dokumentu, atslēgas–vērtības un grafu datubāzei.
SQL / atbilde: _______Relāciju datubāzes: dati tabulās, kas saistītas ar atslēgām.___
4. SQL logā izveido datubāzi sql_trenins ar utf8mb4 kodējumu un utf8mb4_unicode_ci salīdzināšanas kārtību.
SQL / atbilde: __________________________________________________________
5. Atlasi sql_trenins darbam un pārbaudi, kura datubāze ir aktīva. Rezultāta kolonnai piešķir nosaukumu aktiva_datubaze.
SQL / atbilde: __________________________________________________________
6. Parādi pieejamo datubāzu sarakstu.
SQL / atbilde: __________________________________________________________
7. Izveido pagaidu datubāzi sql_tests un pēc tam izdzēs tikai šo pagaidu datubāzi.
SQL / atbilde: __________________________________________________________
2. Tabulas un datu tipi
8. Izveido tabulu grupas: id (INT, primārā atslēga, automātiska numerācija), nosaukus (VARCHAR(20), obligāts un unikāls). Kolonnas nosaukumu nosaukus saglabā tādu pašu kā mācību materiālā.
SQL / atbilde: __________________________________________________________
9. Izveido tabulu skoleni ar laukiem id, vards, uzvards, vecums, epasts, grupas_id, iestajas un izveidots. Izmanto mācību materiālā norādītos datu tipus un ierobežojumus.
