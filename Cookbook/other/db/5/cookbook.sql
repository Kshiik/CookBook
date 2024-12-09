-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-5.7
-- Время создания: Ноя 25 2024 г., 01:26
-- Версия сервера: 5.7.44
-- Версия PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cookbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `category`) VALUES
(1, 'ЗАВТРАК'),
(2, 'ОБЕД'),
(3, 'УЖИН'),
(4, 'ЗАКУСКИ'),
(5, 'ВЫПЕЧКА'),
(6, 'САЛАТЫ'),
(7, 'СУПЫ'),
(8, 'ДЕСЕРТЫ'),
(9, 'НАПИТКИ'),
(10, 'ЗАГОТОВКИ');

-- --------------------------------------------------------

--
-- Структура таблицы `cooking_method`
--

CREATE TABLE `cooking_method` (
  `id_cooking_method` int(11) NOT NULL,
  `method` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cooking_method`
--

INSERT INTO `cooking_method` (`id_cooking_method`, `method`) VALUES
(1, 'ЖАРИТЬ'),
(2, 'ВАРИТЬ'),
(3, 'ТУШИТЬ'),
(4, 'ЗАПЕКАТЬ'),
(5, 'БЕЗ ПРИГОТОВЛЕНИЯ НА ПЛИТЕ');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id_favorite` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE `ingredients` (
  `id_ingredient` int(11) NOT NULL,
  `ingredient` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`id_ingredient`, `ingredient`) VALUES
(1, 'куриная грудка'),
(2, 'картофель'),
(3, 'морковь'),
(4, 'лук'),
(5, 'чеснок'),
(6, 'карри'),
(7, 'вода'),
(8, 'соль'),
(9, 'молотый черный перец'),
(10, 'молотый красный перец'),
(11, 'баклажаны'),
(12, 'помидоры'),
(13, 'лук репчатый'),
(14, 'масло растительное'),
(15, 'семена кунжута'),
(16, 'зелень'),
(18, 'говядина'),
(19, 'зелень кинзы'),
(20, 'петрушка'),
(21, 'пшеничная мука'),
(22, 'специи сухие'),
(23, 'кролик'),
(24, 'темное пиво'),
(25, 'чернослив'),
(26, 'горчица'),
(27, 'тимьян'),
(28, 'лавровый лист'),
(29, 'сливочное масло'),
(30, 'яйцо'),
(31, 'сыр'),
(32, 'молоко'),
(33, 'творог'),
(34, 'грибы'),
(35, 'орехи'),
(80, 'чёрный_молотый_перец'),
(82, 'зелень_кинзы'),
(83, 'петрушка'),
(84, 'пшеничная_мука'),
(85, 'специи_сухие'),
(86, 'кролик'),
(87, 'темное_пиво'),
(88, 'чернослив'),
(89, 'горчица'),
(90, 'тимьян'),
(91, 'лавровый_лист'),
(92, 'сливочное_масло'),
(93, 'яйцо'),
(94, 'сыр'),
(95, 'молоко'),
(96, 'творог'),
(97, 'грибы'),
(98, 'орехи');

-- --------------------------------------------------------

--
-- Структура таблицы `recipes`
--

CREATE TABLE `recipes` (
  `id_recipe` int(11) NOT NULL,
  `name_recipe` varchar(200) NOT NULL,
  `img_recipe` varchar(300) NOT NULL,
  `cooking_time` varchar(50) NOT NULL,
  `servings` int(11) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipes`
--

INSERT INTO `recipes` (`id_recipe`, `name_recipe`, `img_recipe`, `cooking_time`, `servings`, `calories`) VALUES
(1, 'Японское карри', 'assets/img/jarkoe.png', '1 час', 4, 147),
(2, 'Хинкали', 'assets/img/hinkali.jpg', '3 часа', 15, 132),
(3, 'Баклажаны жареные с помидорами', 'assets/img/baklaznany.jpg', '30 мин', 4, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_categories`
--

CREATE TABLE `recipe_categories` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_categories`
--

INSERT INTO `recipe_categories` (`recipe_id`, `category_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_cooking_methods`
--

CREATE TABLE `recipe_cooking_methods` (
  `recipe_id` int(11) NOT NULL,
  `cooking_method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_cooking_methods`
--

INSERT INTO `recipe_cooking_methods` (`recipe_id`, `cooking_method_id`) VALUES
(1, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `units` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `units`) VALUES
(1, 1, '5 кусков'),
(1, 2, '2 штуки'),
(1, 3, '1 штука'),
(1, 4, '1 головка'),
(1, 5, '2 зубчика'),
(1, 6, '40 гр.'),
(1, 7, '3 стакана'),
(1, 8, 'на кончике ножа'),
(1, 9, 'на кончике ножа'),
(2, 21, '500 гр.'),
(2, 7, '750 мл.'),
(2, 8, '1 чайн.л.'),
(2, 18, '500 гр.'),
(2, 13, '2 шт.'),
(2, 19, '1 пуч.'),
(2, 22, 'по вкусу'),
(2, 9, 'по вкусу'),
(2, 10, 'по вкусу'),
(2, 8, 'по вкусу'),
(3, 11, '2 шт.'),
(3, 12, '3 шт.'),
(3, 5, '2 зуб.'),
(3, 13, '1 шт.'),
(3, 14, '3 ст. л.'),
(3, 15, 'для подачи'),
(3, 16, 'для подачи'),
(3, 9, 'по вкусу'),
(3, 8, 'по вкусу');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_steps`
--

CREATE TABLE `recipe_steps` (
  `id_recipe_steps` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `number_step` int(11) NOT NULL,
  `description_step` varchar(500) NOT NULL,
  `img_step` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_steps`
--

INSERT INTO `recipe_steps` (`id_recipe_steps`, `recipe_id`, `number_step`, `description_step`, `img_step`) VALUES
(1, 1, 1, 'Нарезать мелкими кусками курицу, посолить, поперчить.', NULL),
(2, 1, 2, 'Нарезать чеснок кубиками, лук — колечками, морковь — четвертинками, картофель — кубиками, но все это не особо мелко.', NULL),
(3, 1, 3, 'В глубокой сковороде или воке жарить курицу с чесноком до легкого поджаривания.', NULL),
(4, 1, 4, 'Добавить остальные овощи. Жарить до мягкости лука.', NULL),
(5, 1, 5, 'Перемешать все в кастрюле и залить 6 стаканами воды, тушить под крышкой на медленном огне, пока не будет готов картофель.', NULL),
(6, 1, 6, 'Высыпать туда карри, тушить, пока соус не загустеет.', NULL),
(7, 1, 7, 'Ваше японское карри готово! Можете его подавать вместе с рисом или другим гарниром.', NULL),
(8, 3, 1, 'Для начала тщательно промойте баклажаны под проточной водой. Затем нарежьте их кольцами, примерно по 1 см толщиной. Посолите каждый кусочек с двух сторон и оставьте на 20 минут, чтобы ушла горечь.', 'assets/img/img-steps/baklazhani-1.webp'),
(9, 3, 2, 'Тщательно помойте помидоры под холодной проточной водой. Затем нарежьте их на дольки. Вы также можете нарезать помидоры кубиками, чтобы они лучше смешались с другими ингредиентами. ', 'assets/img/img-steps/baklazhani-2.webp'),
(10, 3, 3, 'Очистите репчатый лук от шелухи и нарежьте его маленькими кубиками. Чеснок тоже очистите от шелухи, измельчите ножом или пропустите через пресс для чеснока – как вам удобнее.', 'assets/img/img-steps/baklazhani-3.webp'),
(11, 3, 4, 'Как только баклажаны постоят 20 минут, необходимо их промыть под холодной водой. Затем обсушите баклажаны с помощью бумажного полотенце. Возьмите сковороду, добавьте немного масла, и разогрейте на среднем огне. Выкладывайте кольца баклажана на раскаленную сковороду и жарьте, пока не появится золотистая корочка с обеих сторон. Вам понадобится 3-4 минуты для каждой стороны. Параллельно возьмите другую сковороду и поджарьте лук до мягкости. Добавьте чеснок и продолжайте жарить ещё несколько минут.', 'assets/img/img-steps/baklazhani-4.webp'),
(12, 3, 5, 'Добавьте к луку и чесноку нарезанные помидоры, слегка приправьте солью и перцем. Дайте им потушиться на слабом огне около 5 минут — пусть помидоры размягчатся, выпустят свой сок. Затем объедините всё это на одной сковороде с баклажанами. Аккуратно перемешайте, дайте всему блюду прогреться и соединиться в одно целое. Всего пару минут. Выложите готовое блюдо на тарелку или блюдо, посыпьте зеленью и кунжутом.', 'assets/img/img-steps/baklazhani-5.webp'),
(13, 2, 1, 'Муку просейте на рабочую поверхность. Благодаря этому она насытится кислородом, и готовое тесто получится нежнее. Сделайте в центре углубление типа кратера, всыпьте в него соль. Начните понемногу вливать воду в центр, собирая муку от краев к центру.', 'assets/img/img-steps/xinkali-1.jpg'),
(14, 2, 2, 'Работайте только вилкой — налили воду, перемешайте — и так до конца, пока не кончится вода. Вся мука должна намокнуть и собраться в комок. Мне пришлось добавить немного воды, потому что тесто оставалось сухим. Имейте в виду, что муки у вас может уйти больше или меньше, чем у меня. Ориентируйтесь на консистенцию теста.', 'assets/img/img-steps/xinkali-2.jpg'),
(15, 2, 3, 'Далее начните месить тесто руками. Время от времени разрезайте тесто пополам и выворачивайте его, так как внутри оно более влажное, чем снаружи. Иногда подсыпайте муку, чтобы тесто не прилипало. Месите тесто долго и усердно, оно должно стать крутым, но при этом эластичным.', 'assets/img/img-steps/xinkali-3.jpg'),
(16, 2, 4, 'Готовое тесто заверните в пакет и оставьте на два часа \"отдыхать\". За это время в нем разовьется клейковина, и тесто станет очень эластичным.', 'assets/img/img-steps/xinkali-4.jpg'),
(17, 2, 5, 'Пока тесто отлеживается, займитесь фаршем. Если у вас мясо, то прокрутите его через мясорубку вместе с луком. Так как у меня фарш, я просто натерла лук на терке.', 'assets/img/img-steps/xinkali-5.jpg'),
(18, 2, 6, 'Зелень хорошо помойте, обсушите. Мелко нарежьте ее. Добавьте в фарш лук, зелень, специи и соль. Хорошо перемешайте.', 'assets/img/img-steps/xinkali-6.jpg'),
(19, 2, 7, 'Начните порциями добавлять воду в фарш, хорошо вымешивая после каждой порции. Фарш должен стать жидким. Я добавила воды меньше, около стакана. Готовность фарша можно определить так — воткните в него ложку, она должна начать крениться. Уберите фарш в холодильник на час.', 'assets/img/img-steps/xinkali-7.jpg'),
(20, 2, 8, 'Вылежавшееся тесто скатайте в колбаску, затем нарежьте ее на одинаковые куски. Каждый кусок раскатайте в круг толщиной в 2 мм и величиной с ладонь. Старайтесь края сделать тоньше, чем центр. Раскатайте таким образом все куски. Сложите их один на другой, пересыпая мукой.', 'assets/img/img-steps/xinkali-8.jpg'),
(21, 2, 9, 'Пришло время лепить хинкали. Для удобства возьмите небольшую пиалку. Накиньте на нее кусок теста. В центр положите столовую ложку фарша. Собирайте края теста складочками в центр.', 'assets/img/img-steps/xinkali-9.jpg'),
(22, 2, 10, 'Последнюю складку заверните вокруг других, соединив с первой. Слегка закрутите хвостик против часовой стрелки.', 'assets/img/img-steps/xinkali-10.jpg'),
(23, 2, 11, 'Верх хвостика отрежьте ножом. Таким образом сформируйте все хинкали.', 'assets/img/img-steps/xinkali-11.jpg'),
(24, 2, 12, 'Чтобы отварить хинкали, вскипятите воду в кастрюле. Посолите ее. Закиньте хинкали. Не варите сразу большое количество, чтобы они не слиплись при варке. Время от времени перемешивайте содержимое кастрюли, чтобы хинкали не прилипли ко дну. Варите хинкали около 14 минут, затем выньте при помощи шумовки на тарелку.', 'assets/img/img-steps/xinkali-12.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `name_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id_role`, `name_role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `login`, `password`, `email`, `first_name`, `last_name`, `role_id`) VALUES
(1, 'admin', 'admin', NULL, NULL, '', 1),
(2, 'qwe', '$2y$10$m4UyLkGXzwEw6DNSJNdFAOlaLkH866Bx0DHFbTnMvFjjkmF.p0nJy', 'qwew@ewwe.trh', NULL, NULL, NULL),
(3, 'aaa', '$2y$10$Fjo0rJsCdiEZScZGSC22guSzIIcyGP5GcpgiqMTBSVKgYaZAc5eH.', 'aaa@gmail.com', NULL, NULL, NULL),
(4, 'ячс', '$2y$10$sunVQyyo36pzFCVXZD9JCOOMa6fh.EtREbP7GKnOAM54LNFVN9zPi', 'asd@gmail.com', NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `cooking_method`
--
ALTER TABLE `cooking_method`
  ADD PRIMARY KEY (`id_cooking_method`),
  ADD KEY `id_cooking_method` (`id_cooking_method`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id_favorite`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Индексы таблицы `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_recipe` (`id_recipe`);

--
-- Индексы таблицы `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `recipe_categories_ibfk_2` (`category_id`);

--
-- Индексы таблицы `recipe_cooking_methods`
--
ALTER TABLE `recipe_cooking_methods`
  ADD KEY `recipe_cooking_methods_ibfk_1` (`recipe_id`),
  ADD KEY `cooking_method_id` (`cooking_method_id`);

--
-- Индексы таблицы `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Индексы таблицы `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD PRIMARY KEY (`id_recipe_steps`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`),
  ADD KEY `id_role` (`id_role`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `cooking_method`
--
ALTER TABLE `cooking_method`
  MODIFY `id_cooking_method` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id_favorite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id_recipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id_recipe_steps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD CONSTRAINT `recipe_categories_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipe_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipe_cooking_methods`
--
ALTER TABLE `recipe_cooking_methods`
  ADD CONSTRAINT `recipe_cooking_methods_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipe_cooking_methods_ibfk_2` FOREIGN KEY (`cooking_method_id`) REFERENCES `cooking_method` (`id_cooking_method`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id_ingredient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD CONSTRAINT `recipe_steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
