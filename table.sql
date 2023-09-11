DROP TABLE Offers;
DROP TABLE Review2;
DROP TABLE GameEdition;
DROP TABLE Review1;
DROP TABLE Award;
DROP TABLE Classify;
DROP TABLE AgeRating;
DROP TABLE Plays;
DROP TABLE Customer;
DROP TABLE CountryTerritory;
DROP TABLE ReviewPlatform;
DROP TABLE PCGame;
DROP TABLE ConsoleGame;
DROP TABLE MobileGame2;
DROP TABLE MobileGame1;
DROP TABLE Game;
DROP TABLE DeveloperTeam;

CREATE TABLE
    DeveloperTeam (
        dID INTEGER PRIMARY KEY,
        dname VARCHAR2(20),
        cemail VARCHAR2(50),
        dsize VARCHAR2(20),
        company VARCHAR2(20),
        UNIQUE (company, dname),
        UNIQUE (cemail, dname)
    );
     
CREATE TABLE
    Game (
        gID INTEGER PRIMARY KEY,
        gname VARCHAR2(80),
        initial_release_year INTEGER,
        dID INTEGER NOT NULL,
        UNIQUE(gname, dID),
        FOREIGN KEY (dID) REFERENCES DeveloperTeam (dID)
    );

CREATE TABLE
    MobileGame1 (
        minimum_os_version VARCHAR2(20) PRIMARY KEY,
        supported_os VARCHAR2(10)
    );

CREATE TABLE
    MobileGame2 (
        gID INTEGER,
        minimum_os_version VARCHAR2(20),
        PRIMARY KEY (gID),
        FOREIGN KEY (minimum_os_version) REFERENCES MobileGame1 (minimum_os_version),
        FOREIGN KEY (gID) REFERENCES Game (gID)
    );

CREATE TABLE
    ConsoleGame (
        gID INTEGER,
        console_name VARCHAR2(20),
        version VARCHAR2(10),
        PRIMARY KEY (gID),
        FOREIGN KEY (gID) REFERENCES Game (gID)
    );

CREATE TABLE
    PCGame (
        gID INTEGER,
        CPU VARCHAR2(30),
        GPU VARCHAR2(30),
        memory REAL,
        PRIMARY KEY (gID),
        FOREIGN KEY (gID) REFERENCES Game (gID)
    );

CREATE TABLE
    ReviewPlatform (
        pname VARCHAR2(20) PRIMARY KEY,
        popularity VARCHAR2(10)
    );

CREATE TABLE
    CountryTerritory (
        cname VARCHAR2(20) PRIMARY KEY,
        currency VARCHAR2(3)
    );

CREATE TABLE
    Customer (
        cID INTEGER PRIMARY KEY,
        customer_name VARCHAR2(20),
        email VARCHAR2(50) UNIQUE,
        birth_year INTEGER
    );

CREATE TABLE
    Plays (
        cname VARCHAR2(20),
        gID INTEGER,
        cID INTEGER,
        username VARCHAR2(20),
        PRIMARY KEY (cname, gID, cID),
        FOREIGN KEY (cname) REFERENCES CountryTerritory (cname),
        FOREIGN KEY (gID) REFERENCES Game (gID),
        FOREIGN KEY (cID) REFERENCES Customer (cID)
    );

CREATE TABLE
    AgeRating (
        label VARCHAR2(20),
        ar_standard VARCHAR2(10),
        PRIMARY KEY (label, ar_standard)
    );

CREATE TABLE
    Classify (
        gID INTEGER,
        label VARCHAR2(20),
        ar_standard VARCHAR2(10),
        PRIMARY KEY (gID, ar_standard),
        FOREIGN KEY (gID) REFERENCES Game (gID),
        FOREIGN KEY (label, ar_standard) REFERENCES AgeRating (label, ar_standard)
    );

CREATE TABLE
    Award (
        aname VARCHAR2(50),
        organization VARCHAR2(20),
        award_year INTEGER,
        gID INTEGER,
        PRIMARY KEY (aname, award_year),
        FOREIGN KEY (gID) REFERENCES Game (gID)
    );

CREATE TABLE
    Review1 (rate INTEGER PRIMARY KEY, sentiment VARCHAR2(10));

CREATE TABLE
    GameEdition (
        gID INTEGER,
        version_number VARCHAR2(10),
        release_date DATE,
        PRIMARY KEY (gID, version_number),
        FOREIGN KEY (gID) REFERENCES Game (gID),
        UNIQUE (gID, release_date)
    );

CREATE TABLE
    Review2 (
        rID INTEGER,
        pname VARCHAR2(20),
        rate INTEGER,
        comment_text VARCHAR2(255),
        gID INTEGER NOT NULL,
        version_number VARCHAR2(10) NOT NULL,
        cID INTEGER NOT NULL,
        PRIMARY KEY (rID, pname),
        FOREIGN KEY (pname) REFERENCES ReviewPlatform (pname),
        FOREIGN KEY (gID, version_number) REFERENCES GameEdition (gID, version_number),
        FOREIGN KEY (cID) REFERENCES Customer (cID),
        FOREIGN KEY (rate) REFERENCES Review1 (rate),
        UNIQUE (pname, gID, version_number, cID)
    );

CREATE TABLE
    Offers (
        cname VARCHAR2(20),
        gID INTEGER,
        price DECIMAL(10, 2),
        PRIMARY KEY (cname, gID),
        FOREIGN KEY (cname) REFERENCES CountryTerritory (cname),
        FOREIGN KEY (gID) REFERENCES Game (gID)
    );

INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000001, 'Jean', 'jean921@gmail.com', 2009);
INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000002, 'Catherina', 'cath2211@hotmail.com', 2002);
INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000003, 'Rachel', 'rachelw23@gmail.com', 2007);
INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000004, 'Joshwa', 'joshwa52@outlook.com', 1998);
INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000005, 'Hannah', 'hannahhh@outlook.com', 1982);
INSERT INTO Customer (cID, customer_name, email, birth_year) VALUES (30000006, 'Mario', 'pipepline@gmail.com',1988);

INSERT INTO ReviewPlatform (pname, popularity) VALUES('IGN', 'High');
INSERT INTO ReviewPlatform (pname, popularity) VALUES('Metacritic', 'High');
INSERT INTO ReviewPlatform (pname, popularity) VALUES('Shacknews', 'Moderate');
INSERT INTO ReviewPlatform (pname, popularity) VALUES('GameSkinny', 'Moderate');
INSERT INTO ReviewPlatform (pname, popularity) VALUES('ReviewCenter', 'Low');

INSERT INTO AgeRating (label, ar_standard) VALUES('EVERYONE', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('TEEN', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('MATURE 17+', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('ADULTS ONLY 18+', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('RATING PENDING', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('18', 'PEGI');
INSERT INTO AgeRating (label, ar_standard) VALUES('18', 'USK');
INSERT INTO AgeRating (label, ar_standard) VALUES('EVERYONE 10+', 'ESRB');
INSERT INTO AgeRating (label, ar_standard) VALUES('12', 'PEGI');

INSERT INTO CountryTerritory (cname, currency) VALUES ('Canada', 'CAD');
INSERT INTO CountryTerritory (cname, currency) VALUES ('United States', 'USD');
INSERT INTO CountryTerritory (cname, currency) VALUES ('United Kingdom', 'GBP');
INSERT INTO CountryTerritory (cname, currency) VALUES ('Germany', 'EUR');
INSERT INTO CountryTerritory (cname, currency) VALUES ('France', 'EUR');
INSERT INTO CountryTerritory (cname, currency) VALUES ('Japan', 'JPY');
INSERT INTO CountryTerritory (cname, currency) VALUES ('China', 'CNY');
INSERT INTO CountryTerritory (cname, currency) VALUES ('India', 'INR');
INSERT INTO CountryTerritory (cname, currency) VALUES ('Australia', 'AUD');
INSERT INTO CountryTerritory (cname, currency) VALUES ('Italy', 'EUR');

INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000001, 'EPD', 'nintendo@noa.nintendo.com', 'Large-Scale', 'Nintendo');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000002, 'NDcube', 'nintendo@noa.nintendo.com', 'Medium-Sized', 'Nintendo');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000003, 'Beta Studio', 'official@riotgames.com', 'Large-Scale', 'Riot');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000004, 'Beta Studio', 'official@capcom.com', 'Small-Scale', 'Capcom');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000005, 'Fortnite', 'fortnite@epicgames.com', 'Small-Scale', 'Epic Games');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000006, 'YS Studio', 'BD@mihoyo.com', 'Small-Scale', 'miHoYo');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000007, 'FromSoftware', 'ds@fromsoftware.jp', 'Medium-Sized', 'FromSoftware');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000008, 'Hazelight Studios', 'contact@hazelight.se', 'Large-Scale', 'Hazelight Studios');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000009, 'Jhack', 'jhack@gmail.com', 'Small-Scale', 'Jhack');
INSERT INTO DeveloperTeam (dID, dname, cemail, dsize, company) VALUES(40000010, 'SuperCell', 'contact@supercell.com', 'Large-Scale', 'SuperCell');

INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000001, 'League of Legends', 2009, 40000003);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000002, 'Resident Evil', 1996, 40000004);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000003, 'Genshin Impact', 2020, 40000006);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000004, 'Fortnite', 2017, 40000005);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000005, 'Elden Ring', 2022, 40000007);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000006, 'It Takes Two', 2021, 40000008);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000007, 'The legends of Zelda: Tears of the Kingdom', 2023, 40000001);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000008, 'Resident Evil', 2001, 40000009);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000009, 'Pokemon GO', 2016, 40000002);
INSERT INTO Game (gID, gname, initial_release_year, dID) VALUES(10000010, 'Clash of Clans', 2012, 40000010);

INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000001, '13.14', DATE '2023-07-19');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000002, '5.0', DATE '2009-03-05');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000003, '2.8', DATE '2022-07-13');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000003, '3.4', DATE '2023-01-18');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000004, '2.3.4', DATE '2022-11-03');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000005, '1.03', DATE '2022-03-17');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000005, '1.04', DATE '2022-04-19');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000005, '1.05', DATE '2022-06-13');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000005, '1.07', DATE '2022-10-13');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000006, '1.03', DATE '2022-11-04');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000007, '1.1.2', DATE '2023-05-25');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000008, '1.0.1', DATE '2001-09-23');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000009, '0.277.3', DATE '2016-07-17');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000010, '15.352.8', DATE '2023-07-03');
INSERT INTO GameEdition (gID, version_number, release_date) VALUES (10000001, '12.10', DATE '2022-05-25');

INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('Nougat', 'android');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('14', 'ios');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('Pie', 'android');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('MarshMallow', 'android');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('13', 'ios');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('Q', 'android');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('12', 'ios');
INSERT INTO MobileGame1 (minimum_os_version, supported_os) VALUES ('3', 'ios');

INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000009, 'Nougat');
INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000010, '12');
INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000004, '12');
INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000008, 'MarshMallow');
INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000003, '14');
INSERT INTO MobileGame2 (gID, minimum_os_version) VALUES (10000001, '13');

INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000002, 'Playstation', '2');
INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000005, 'Playstation', '4 Pro');
INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000006, 'Playstation', '4');
INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000004, 'XBOX', 'Series S');
INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000007, 'Nintendo Switch', NULL);
INSERT INTO ConsoleGame (gID, console_name, version) VALUES (10000009, 'Nintendo Switch', NULL);

INSERT INTO PCGame (gID, CPU, GPU, memory) VALUES (10000005, 'Intel Core i7-8700K', 'NVIDIA GEFORCE GTX 1070', 44.47);
INSERT INTO PCGame (gID, CPU, GPU, memory) VALUES (10000003, 'Intel Core i5', 'NVIDIA GEFORCE GTX 1030', 38.71);
INSERT INTO PCGame (gID, CPU, GPU, memory) VALUES (10000001, 'Intel Core i5-750', 'AMD HD 6570', 11.81);
INSERT INTO PCGame (gID, CPU, GPU, memory) VALUES (10000006, 'Intel i3-2100T', 'NVIDIA GEFORCE GTX 660', 35.84);
INSERT INTO PCGame (gID, CPU, GPU, memory) VALUES (10000004, 'Corei3 2.4GHz', 'Intel HD 4000 Video Card', 33.26);

INSERT INTO Plays (cname, gID, cID, username) VALUES('India', 10000010, 30000001, 'gameplayer');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Japan', 10000006, 30000002, 'catttmeow');
INSERT INTO Plays (cname, gID, cID, username) VALUES('China', 10000003, 30000003, 'BinaryKing');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Germany', 10000004, 30000004, 'XDwarrior');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Italy', 10000001, 30000004, 'BYTE');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Germany', 10000008, 30000005, 'Ur master bear');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Italy', 10000001, 30000006, 'XDwarrior');
INSERT INTO Plays (cname, gID, cID, username) VALUES('United States', 10000003, 30000003, 'Traveller');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Italy', 10000001, 30000005, 'Sandro');
INSERT INTO Plays (cname, gID, cID, username) VALUES('Italy', 10000001, 30000002, 'catWar');

INSERT INTO Classify (gID, label, ar_standard) VALUES(10000001, 'TEEN', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000002, 'MATURE 17+', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000002, '18', 'PEGI');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000002, '18', 'USK');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000005, '18', 'PEGI');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000005, '18', 'USK');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000005, 'MATURE 17+', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000009, 'EVERYONE', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000003, 'TEEN', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000004, 'TEEN', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000006, '12', 'PEGI');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000006, 'TEEN', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000007, 'EVERYONE 10+', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000008, 'ADULTS ONLY 18+', 'ESRB');
INSERT INTO Classify (gID, label, ar_standard) VALUES(10000010, 'TEEN', 'ESRB');

INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for the Best ESports Game', 'Geoff Keighley', 2019, 10000001);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for the Best ESports Game', 'Geoff Keighley', 2020, 10000001);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for the Best ESports Game', 'Geoff Keighley', 2021, 10000001);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for Best Multiplayer Game', 'Geoff Keighley', 2018, 10000004);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for Game of the Year', 'Geoff Keighley', 2021, 10000006);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('British Academy Games Award for Multiplayer', 'BAFTA', 2022, 10000006);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Awards - Player''s Voice Award', 'Geoff Keighley', 2022, 10000003);
INSERT INTO Award (aname, organization, award_year, gID) 
VALUES ('The Game Award for the Game of the Year', 'Geoff Keighley', 2022, 10000005);

INSERT INTO Review1 (rate, sentiment) VALUES (0, 'negative');
INSERT INTO Review1 (rate, sentiment) VALUES (1, 'negative');
INSERT INTO Review1 (rate, sentiment) VALUES (2, 'negative');
INSERT INTO Review1 (rate, sentiment) VALUES (3, 'negative');
INSERT INTO Review1 (rate, sentiment) VALUES (4, 'neutral');
INSERT INTO Review1 (rate, sentiment) VALUES (5, 'neutral');
INSERT INTO Review1 (rate, sentiment) VALUES (6, 'positive');
INSERT INTO Review1 (rate, sentiment) VALUES (7, 'positive');
INSERT INTO Review1 (rate, sentiment) VALUES (8, 'positive');
INSERT INTO Review1 (rate, sentiment) VALUES (9, 'positive');


INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000001, 'GameSkinny', 0, 'This game is not genuine or authentic. I recommend everyone avoid purchasing it.', 10000008, '1.0.1', 30000005);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000002, 'Metacritic', 2, 'Epic games doesn''t listen to his community. They have ruined the game.', 10000004, '2.3.4', 30000004);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000003, 'Shacknews', 7, 'As a game it''s very good designed, but it has two big problems: 1.Community ( specially EUW) 2. Riot balance team (nonexistent)', 10000001, '12.10', 30000006);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000004, 'IGN', 9, 'The best game of its kind I''ve played. If nothing else, it definitely takes careful measures to ease in new players', 10000006, '1.03', 30000002);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000005, 'ReviewCenter', 4, 'The gameplay was decent, though it felt a bit repetitive at times. The graphics were well-executed but nothing extraordinary.', 10000003, '3.4', 30000003);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000006, 'Metacritic', 5, 'Overall, League of Legends holds a lot of promise, but comes up short as a retail product.', 10000001, '13.14', 30000004);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000007, 'Metacritic', 6, 'Good game, but can improve a bit on the music.', 10000001, '12.10', 30000004);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000008, 'Metacritic', 9, 'HAHA I LIKE THIS.', 10000001, '12.10', 30000005);
INSERT INTO Review2 (rID, pname, rate, comment_text, gID, version_number, cID) VALUES (20000009, 'ReviewCenter', 8, 'Great game!', 10000001, '12.10', 30000002);

INSERT INTO Offers (cname, gID, price) VALUES ('Italy', 10000001, 0.00);
INSERT INTO Offers (cname, gID, price) VALUES ('United States', 10000002, 39.99);
INSERT INTO Offers (cname, gID, price) VALUES ('China', 10000003, 0.00);
INSERT INTO Offers (cname, gID, price) VALUES ('Germany', 10000004, 0.00);
INSERT INTO Offers (cname, gID, price) VALUES ('United States', 10000005, 59.99);
INSERT INTO Offers (cname, gID, price) VALUES ('Canada', 10000005, 79.99);
INSERT INTO Offers (cname, gID, price) VALUES ('France', 10000005, 59.99);
INSERT INTO Offers (cname, gID, price) VALUES ('Japan', 10000006, 1720.00);
INSERT INTO Offers (cname, gID, price) VALUES ('United States', 10000007, 69.99);
INSERT INTO Offers (cname, gID, price) VALUES ('Canada', 10000007, 89.99);
INSERT INTO Offers (cname, gID, price) VALUES ('Germany', 10000008, 12.00);
INSERT INTO Offers (cname, gID, price) VALUES ('India', 10000009, 0.00);
INSERT INTO Offers (cname, gID, price) VALUES ('India', 10000010, 0.00);
INSERT INTO Offers (cname, gID, price) VALUES ('United States', 10000003, 0.00);
