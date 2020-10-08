-- Запрос показывающий имена авторов и названия книг жанра фантастики.
SELECT `book_title` AS 'Название книги', `name` AS 'Имя автора', `last_name` AS 'Фамилия автора' FROM ((`task3`.`books` JOIN `task3`.`authors_books` ON `books`.`id` = `authors_books`.`id_book`) 
JOIN `task3`.`authors` ON `authors`.`id` = `authors_books`.`id_author`)                                                                    
JOIN `task3`.`genre` ON `books`.`id_genre` = `genre`.`id`
WHERE `genre`.`genre_name` = 'Фантастика';