-- Создание таблицы жанры. Создание индекса для идентификатора таблицы.
CREATE TABLE `task3`.`genre` ( `id` BIGINT(12) UNSIGNED NOT NULL AUTO_INCREMENT , `genre_name` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`), UNIQUE `genre_index` (`genre_name`(255))) ENGINE = InnoDB;
ALTER TABLE `genre` ADD INDEX( `id`);

-- Создание таблицы авторы. Создание индекса для идентификатора таблицы.
CREATE TABLE `task3`.`authors` ( `id` BIGINT(100) UNSIGNED NOT NULL AUTO_INCREMENT , `name` VARCHAR(255) NOT NULL , `last_name` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `authors` ADD INDEX( `id`);

-- Создание таблицы книги. Создание ограничений внешнего ключа - связи с таблицей жанры.
CREATE TABLE `task3`.`books` ( `id` BIGINT(100) UNSIGNED NOT NULL AUTO_INCREMENT , `ISBN` VARCHAR(23) NOT NULL , `book_title` VARCHAR(300) NOT NULL ,
 `number_pages` INT(5) UNSIGNED NOT NULL , `id_genre` BIGINT(10) UNSIGNED NOT NULL , `publication_date` DATE NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `books`ADD FOREIGN KEY (`id_genre`) REFERENCES `genre`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Создание таблицы книги автора. Развязывание отношения многие ко многим. 
CREATE TABLE `task3`.`authors_books` ( `id_book` BIGINT(100) UNSIGNED NULL , `id_author` BIGINT(100) UNSIGNED NULL ) ENGINE = InnoDB;
ALTER TABLE `authors_books` ADD FOREIGN KEY (`id_book`) REFERENCES `books`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `authors_books` ADD FOREIGN KEY (`id_author`) REFERENCES `authors`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;