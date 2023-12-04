CREATE DATABASE corporation;

CREATE TABLE author(
	author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    email VARCHAR(50),
    biography TEXT
	
);

CREATE TABLE book (
	book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300),
    sinopsis TEXT, 
    num_pages INT,
    author_id INT,
	CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(author_id)
    
);

SELECT * FROM author;

insert into author (author_id, first_name, email, biography) values (1, 'Mac', 'mareles0@marriott.com', 'Maya Lin: A Strong Clear Vision');
insert into author (author_id, first_name, email, biography) values (2, 'Ray', 'rliebermann1@netvibes.com', 'Went the Day Well?');
insert into author (author_id, first_name, email, biography) values (3, 'Aurore', 'abyway2@wordpress.org', 'Inheritance, The (Arven)');
insert into author (author_id, first_name, email, biography) values (4, 'Kelby', 'khesse3@ovh.net', 'Lap Dance');
insert into author (author_id, first_name, email, biography) values (5, 'Kirsti', 'kmckinless4@mozilla.org', 'The Improv: 50 Years Behind the Brick Wall');
insert into author (author_id, first_name, email, biography) values (6, 'Taddeusz', 'tborel5@liveinternet.ru', 'Red River');
insert into author (author_id, first_name, email, biography) values (7, 'Pate', 'pburhouse6@paginegialle.it', 'Busses Roar (Buses Roar)');
insert into author (author_id, first_name, email, biography) values (8, 'Oran', 'oautin7@wikimedia.org', 'Rock & Rule');
insert into author (author_id, first_name, email, biography) values (9, 'Linc', 'lbrands8@usnews.com', 'Strip Nude for Your Killer (Nude per l''assassino)');
insert into author (author_id, first_name, email, biography) values (10, 'Melissa', 'mwynne9@i2i.jp', 'Deceit');
insert into author (author_id, first_name, email, biography) values (11, 'Amery', 'awrothama@state.gov', 'Flower in Hell (Jiokhwa)');
insert into author (author_id, first_name, email, biography) values (12, 'Rusty', 'rkilbeyb@lycos.com', 'Operation ''Y'' & Other Shurik''s Adventures');
insert into author (author_id, first_name, email, biography) values (13, 'Archambault', 'aoffillc@plala.or.jp', 'Lost Highway');
insert into author (author_id, first_name, email, biography) values (14, 'Shellysheldon', 'sserrurierd@bloglines.com', 'Human Touch');
insert into author (author_id, first_name, email, biography) values (15, 'Prescott', 'pcleetone@nature.com', 'Set It Off');
insert into author (author_id, first_name, email, biography) values (16, 'Davide', 'dstiellf@nydailynews.com', 'Corn Island (Simindis kundzuli)');
insert into author (author_id, first_name, email, biography) values (17, 'Karry', 'kjeaycockg@quantcast.com', 'Johnny Handsome');
insert into author (author_id, first_name, email, biography) values (18, 'Ulises', 'ufinneyh@google.com.au', 'Back to the Future');
insert into author (author_id, first_name, email, biography) values (19, 'Luciana', 'lapedailei@businesswire.com', 'Truth in 24');
insert into author (author_id, first_name, email, biography) values (20, 'Janel', 'jmaccaugheyj@npr.org', 'Far Off Place, A');
insert into author (author_id, first_name, email, biography) values (21, 'Romonda', 'rtetherk@nydailynews.com', 'Mouse Hunt');
insert into author (author_id, first_name, email, biography) values (22, 'Marjy', 'mspenderl@reference.com', '247°F ');
insert into author (author_id, first_name, email, biography) values (23, 'Andrej', 'alorenzom@marketwatch.com', 'Flash Gordon');
insert into author (author_id, first_name, email, biography) values (24, 'Bryna', 'bgillonn@timesonline.co.uk', 'Fame');
insert into author (author_id, first_name, email, biography) values (25, 'Jacklin', 'jjaniko@bluehost.com', 'Crisis');
insert into author (author_id, first_name, email, biography) values (26, 'Winona', 'wprimmerp@parallels.com', 'Bible, The (a.k.a. Bible... In the Beginning, The)');
insert into author (author_id, first_name, email, biography) values (27, 'Allistir', 'awellwoodq@house.gov', 'Station, The (Blutgletscher)');
insert into author (author_id, first_name, email, biography) values (28, 'Gina', 'ghenworthr@topsy.com', '97 Percent True');
insert into author (author_id, first_name, email, biography) values (29, 'Ophelia', 'okornackis@1und1.de', 'Other Girls');
insert into author (author_id, first_name, email, biography) values (30, 'Dwight', 'dbrattyt@blogs.com', 'Jönssonligans största kupp');
insert into author (author_id, first_name, email, biography) values (31, 'Vitia', 'vcarlinou@flavors.me', 'Dr. Wai in the Scriptures with No Words (Mao xian wang)');
insert into author (author_id, first_name, email, biography) values (32, 'Lavina', 'lbragancav@tuttocitta.it', 'Armless');
insert into author (author_id, first_name, email, biography) values (33, 'Henrie', 'hkleew@intel.com', 'Roman Polanski: Wanted and Desired');
insert into author (author_id, first_name, email, biography) values (34, 'Jocelyn', 'jstaveleyx@sina.com.cn', 'Man Apart, A');
insert into author (author_id, first_name, email, biography) values (35, 'Norbie', 'ncakey@usgs.gov', 'Planet of the Vampires (Terrore nello spazio)');
insert into author (author_id, first_name, email, biography) values (36, 'Pandora', 'pdreweryz@wordpress.org', 'William Shakespeare''s A Midsummer Night''s Dream');
insert into author (author_id, first_name, email, biography) values (37, 'Valdemar', 'vstalf10@technorati.com', 'Comedy of Power (Ivresse du pouvoir, L'')');
insert into author (author_id, first_name, email, biography) values (38, 'Ephrayim', 'eiglesiaz11@marketwatch.com', 'Twelve Angry Men');
insert into author (author_id, first_name, email, biography) values (39, 'Vania', 'vadriaan12@bbb.org', 'Escapist, The');
insert into author (author_id, first_name, email, biography) values (40, 'Katlin', 'kfeldheim13@yahoo.co.jp', 'Bunny Lake Is Missing');
insert into author (author_id, first_name, email, biography) values (41, 'Silvio', 'sfaich14@earthlink.net', 'Roger Dodger');
insert into author (author_id, first_name, email, biography) values (42, 'Frederick', 'fbakeup15@edublogs.org', 'Attack, The');
insert into author (author_id, first_name, email, biography) values (43, 'Claudelle', 'chughes16@redcross.org', 'Until September');
insert into author (author_id, first_name, email, biography) values (44, 'Mart', 'mlawrenz17@360.cn', 'Return to the Blue Lagoon');
insert into author (author_id, first_name, email, biography) values (45, 'Anya', 'aseeman18@ycombinator.com', 'Mad Dog and Glory');
insert into author (author_id, first_name, email, biography) values (46, 'Nehemiah', 'ncarslake19@opensource.org', 'Professor Beware');
insert into author (author_id, first_name, email, biography) values (47, 'Burl', 'brisdale1a@discuz.net', 'Opposing Force');
insert into author (author_id, first_name, email, biography) values (48, 'Becca', 'blandsbury1b@boston.com', 'The Suspended Step of the Stork');
insert into author (author_id, first_name, email, biography) values (49, 'Fara', 'fcowdrey1c@amazon.de', 'Karla');
insert into author (author_id, first_name, email, biography) values (50, 'Livia', 'ljira1d@yandex.ru', 'Paris');
insert into author (author_id, first_name, email, biography) values (51, 'Norby', 'npearse1e@i2i.jp', 'Hitman (Contract Killer) (Sat sau ji wong)');
insert into author (author_id, first_name, email, biography) values (52, 'Damiano', 'dbollis1f@chronoengine.com', 'K2');
insert into author (author_id, first_name, email, biography) values (53, 'Philipa', 'pormonde1g@geocities.com', 'Rated X');
insert into author (author_id, first_name, email, biography) values (54, 'Jessalin', 'jhartshorne1h@ocn.ne.jp', 'Casanova''s Big Night');
insert into author (author_id, first_name, email, biography) values (55, 'Kevon', 'kmatijevic1i@constantcontact.com', 'Suitor, The (Soupirant, Le)');
insert into author (author_id, first_name, email, biography) values (56, 'Janice', 'jallcock1j@sitemeter.com', 'Dark and Stormy Night');
insert into author (author_id, first_name, email, biography) values (57, 'Marice', 'melgey1k@upenn.edu', 'I Wanna Hold Your Hand');
insert into author (author_id, first_name, email, biography) values (58, 'Lewes', 'lbassam1l@altervista.org', 'Captain Kidd');
insert into author (author_id, first_name, email, biography) values (59, 'Archibold', 'akinset1m@washingtonpost.com', 'Johnny Dangerously');
insert into author (author_id, first_name, email, biography) values (60, 'Con', 'cfearick1n@de.vu', 'We Were Soldiers');
insert into author (author_id, first_name, email, biography) values (61, 'Gilbertine', 'gjeffray1o@abc.net.au', 'House of Wax');
insert into author (author_id, first_name, email, biography) values (62, 'Rycca', 'rmcmurtyr1p@addthis.com', 'Cartoon All-Stars to the Rescue');
insert into author (author_id, first_name, email, biography) values (63, 'Shandie', 'spie1q@icq.com', 'Condorman');
insert into author (author_id, first_name, email, biography) values (64, 'Base', 'binskipp1r@nifty.com', 'Southern District (Zona Sur)');
insert into author (author_id, first_name, email, biography) values (65, 'Marna', 'mmeegan1s@stanford.edu', 'Voyage to the Bottom of the Sea');
insert into author (author_id, first_name, email, biography) values (66, 'Armando', 'aclooney1t@reddit.com', 'Boom Town');
insert into author (author_id, first_name, email, biography) values (67, 'Creigh', 'chazlewood1u@ask.com', 'Dark, The');
insert into author (author_id, first_name, email, biography) values (68, 'Hinze', 'hbartoszek1v@wikimedia.org', 'Hot Pursuit');
insert into author (author_id, first_name, email, biography) values (69, 'Flory', 'ftaberer1w@apple.com', 'Thomas Crown Affair, The');
insert into author (author_id, first_name, email, biography) values (70, 'Garald', 'gmccrossan1x@yahoo.com', 'President''s Lady, The');
insert into author (author_id, first_name, email, biography) values (71, 'Algernon', 'amarquese1y@clickbank.net', 'Samouraï, Le (Godson, The)');
insert into author (author_id, first_name, email, biography) values (72, 'Meryl', 'mbatisse1z@ehow.com', 'I Love You, Alice B. Toklas!');
insert into author (author_id, first_name, email, biography) values (73, 'Alix', 'apease20@ft.com', 'Ain''t Them Bodies Saints');
insert into author (author_id, first_name, email, biography) values (74, 'Rubina', 'rfarnaby21@ucoz.ru', 'Dirty Dozen: Next Mission, The');
insert into author (author_id, first_name, email, biography) values (75, 'Tadeas', 'tallworthy22@pinterest.com', 'Crippled Avengers (Can que) (Return of the 5 Deadly Venoms)');
insert into author (author_id, first_name, email, biography) values (76, 'Fabian', 'fbrissenden23@jugem.jp', 'Devour');
insert into author (author_id, first_name, email, biography) values (77, 'Sheff', 'sdelacroix24@live.com', 'And Life Goes On (a.k.a. Life and Nothing More) (Zendegi va digar hich)');
insert into author (author_id, first_name, email, biography) values (78, 'Giustina', 'gcaustic25@sohu.com', 'Front of the Class');
insert into author (author_id, first_name, email, biography) values (79, 'Gerard', 'galbert26@163.com', 'Mandabi (The Money Order)');
insert into author (author_id, first_name, email, biography) values (80, 'Kelsey', 'kreames27@jalbum.net', 'Rebound');
insert into author (author_id, first_name, email, biography) values (81, 'Mel', 'mnorthcliffe28@si.edu', 'Police');
insert into author (author_id, first_name, email, biography) values (82, 'Domini', 'dphilpot29@about.com', 'The Shoe');
insert into author (author_id, first_name, email, biography) values (83, 'Dolf', 'dakast2a@time.com', 'Ellen DeGeneres: The Beginning');
insert into author (author_id, first_name, email, biography) values (84, 'Wileen', 'wfeasby2b@vkontakte.ru', 'Smash-Up: The Story of a Woman');
insert into author (author_id, first_name, email, biography) values (85, 'Phyllys', 'pgreenmon2c@pcworld.com', 'Misérables in Concert, Les');
insert into author (author_id, first_name, email, biography) values (86, 'Rogers', 'rstreatfield2d@studiopress.com', 'Red Dawn');
insert into author (author_id, first_name, email, biography) values (87, 'Farly', 'fpenner2e@ezinearticles.com', 'Barbarian Queen II: The Empress Strikes Back');
insert into author (author_id, first_name, email, biography) values (88, 'Jania', 'jrainville2f@php.net', 'Adventurer, The');
insert into author (author_id, first_name, email, biography) values (89, 'Lela', 'lyard2g@tuttocitta.it', 'After the Thin Man');
insert into author (author_id, first_name, email, biography) values (90, 'Harriett', 'hkirgan2h@addthis.com', 'Visit to a Small Planet');
insert into author (author_id, first_name, email, biography) values (91, 'Alverta', 'abeardsdale2i@telegraph.co.uk', 'Love Is News');
insert into author (author_id, first_name, email, biography) values (92, 'Lawrence', 'ldugald2j@comsenz.com', 'Saboteur');
insert into author (author_id, first_name, email, biography) values (93, 'Aidan', 'agandy2k@biglobe.ne.jp', 'Bed & Board (Domicile conjugal)');
insert into author (author_id, first_name, email, biography) values (94, 'Addy', 'adogerty2l@archive.org', 'Human Desire');
insert into author (author_id, first_name, email, biography) values (95, 'Cybil', 'cheskey2m@joomla.org', 'Mighty Aphrodite');
insert into author (author_id, first_name, email, biography) values (96, 'Conchita', 'carber2n@exblog.jp', 'Two for the Road');
insert into author (author_id, first_name, email, biography) values (97, 'Agnese', 'amcgee2o@cnet.com', 'Shadrach');
insert into author (author_id, first_name, email, biography) values (98, 'Hertha', 'htrownson2p@google.com.au', 'Xuxa in Crystal Moon');
insert into author (author_id, first_name, email, biography) values (99, 'Nolly', 'nquilty2q@multiply.com', 'Abandoned, The');
insert into author (author_id, first_name, email, biography) values (100, 'Marve', 'moffer2r@bluehost.com', 'Conspiracy');

SELECT * FROM author;
SELECT * FROM book;
INSERT 
INTO 
book (title, sinopsis, num_pages, author_id) 
VALUES 
('El rincon de la casa redonda', 'lorem ipsum dolor' , 500, 1),
('la novia gitana', 'lorem ipsum dolor' , 300, 1),
('El calor de tus ojos', 'lorem ipsum dolor' , 200, 1),
('Saludos desde el mas alla' ,'lorem ipsum dolor' , 200, 2),
('Calor y dolor ', 'lorem ipsum dolor' , 450, 2),
('El calor de tus ojos', 'lorem ipsum dolor' , 700, 2),
('El libro gordo de petete' ,'lorem ipsum dolor' , 200, 3),
('El libro del autor 3 ', 'lorem ipsum dolor' , 450, 3),
('El libro de eli', 'lorem ipsum dolor' , 700, 3);
;

