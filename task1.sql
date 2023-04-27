CREATE DATABASE IF NOT EXISTS task1;
USE task1;
CREATE TABLE `shops` 
(
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` 
(
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

SELECT cats.name, shops.shopname
FROM cats
JOIN shops ON shops.id = cats.shops_id;

SELECT shops.shopname
FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name = "Murzik";

SELECT shopname
FROM shops
WHERE id = (SELECT shops_id FROM cats WHERE name = "Murzik");

SELECT shopname 
FROM shops
LEFT JOIN cats ON shops.id = cats.shops_id AND (cats.name = 'Murzik' OR cats.name = 'Zuza')
WHERE cats.name IS NULL;