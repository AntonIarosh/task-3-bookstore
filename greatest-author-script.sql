-- Запрос подсчитывающий сколько всего книг у каждого автора
SELECT `name` AS 'Имя автора', `last_name` AS 'Фамилия автора', COUNT(*) AS 'Количество книг автора'
FROM (`task3`.`books` JOIN `task3`.`authors_books` ON `books`.`id` = `authors_books`.`id_book`) 
JOIN `task3`.`authors` ON `authors`.`id` = `authors_books`.`id_author`
GROUP BY `authors`.`id`;

-- Запрос показывающий автора с самым больших количеством книг
SELECT `name` AS 'Имя автора', `last_name` AS 'Фамилия автора', COUNT(*) AS 'Количество книг автора'
FROM (`task3`.`books` JOIN `task3`.`authors_books` ON `books`.`id` = `authors_books`.`id_book`) 
JOIN `task3`.`authors` ON `authors`.`id` = `authors_books`.`id_author`
GROUP BY `authors`.`id`
HAVING COUNT(`books`.`id`) = (SELECT MAX(y.num)  FROM 
(SELECT `name` AS n, `last_name` AS f, COUNT(*) AS num FROM (`task3`.`books` JOIN `task3`.`authors_books` ON `books`.`id` = `authors_books`.`id_book`) 
JOIN `task3`.`authors` ON `authors`.`id` = `authors_books`.`id_author` GROUP BY `authors`.`id`)y);