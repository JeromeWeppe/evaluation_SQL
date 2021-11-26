-- Créez la table planes

create table planes
(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name CHAR(5),
    description TEXT,
    numFlying DECIMAL(8,1)
);


-- Vous insererez les données suivantes dans la table planes :

-- +----+------+--------------------------------+-----------+
-- | id | name | description                    | numFlying |
-- +----+------+--------------------------------+-----------+
-- |  1 | A380 | Gros porteur                   |   12000.0 |
-- |  2 | A320 | Avion de ligne quadriréacteur  |   17000.0 |
-- |  3 | A340 | moyen courrier                 |   50000.0 |
-- +----+------+--------------------------------+-----------+

INSERT INTO planes
(name,description,numFlying)
VALUES
('A380','Gros porteur','12000'),
('A320','Avion de ligne quadriréacteur','17000'),
('A340','moyen courrier','50000');

