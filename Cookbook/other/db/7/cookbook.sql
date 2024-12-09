-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-5.7
-- Время создания: Дек 04 2024 г., 02:01
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
(2, 'Хинкали', 'assets/img/hinkali.jpg', '3 часа', 15, 183),
(3, 'Баклажаны жареные с помидорами', 'assets/img/baklaznany.jpg', '30 мин', 4, 177),
(4, 'Кролик в пиве', 'assets/img/krolik-v-pive.webp', '1.5 часа', 8, 440),
(5, 'Оливье по-советски', 'assets/img/olivier.jpg', '1 час', 10, 417),
(6, 'Французские гренки с фруктами', 'assets/img/francuzskie-grenki-s-fruktam.webp', '40 мин', 4, 439),
(7, 'Малиновый лимонад с мятой', 'assets/img/lemonade-drink.jpg', '30 мин', 8, 84),
(8, 'Гусь в духовке', 'assets/img/gus-v-duhovke.webp', '3.5 часа + 8 часов', 6, 352),
(9, 'Тыквенный суп пюре', 'assets/img/pumpkin-soup (1).jpg', '45 мин', 4, 418),
(10, 'Бутер (авторский рецепт)', 'assets/img/buter.jpg', '5 мин', 1, 1),
(11, 'Бельгийские вафли с мороженным и взбитыми сливками', 'assets/img/vafli.jpg', '40 мин', 5, 705),
(12, 'Печеная брюссельская капуста с чесноком', 'assets/img/zbk.jpg', '30 мин', 4, 153);

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
(1, 2),
(4, 3),
(5, 6),
(6, 1),
(6, 8),
(7, 9),
(8, 3),
(9, 2),
(9, 3),
(9, 7),
(10, 4),
(10, 1),
(11, 1),
(11, 8),
(12, 4);

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
(3, 1),
(4, 1),
(5, 2),
(6, 1),
(7, 5),
(8, 4),
(9, 1),
(9, 2),
(10, 5),
(11, 5),
(12, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id_recipe_ingredient` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient` varchar(200) NOT NULL,
  `units` varchar(100) NOT NULL,
  `ingredient_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id_recipe_ingredient`, `recipe_id`, `ingredient`, `units`, `ingredient_type`) VALUES
(1, 1, 'куриная грудка', '5 кусков', 'птица'),
(2, 1, 'картофель', '2 штуки', 'овощ'),
(3, 1, 'морковь', '1 штука', 'овощ'),
(4, 1, 'лук', '1 головка', 'овощ'),
(5, 1, 'чеснок', '2 зубчика', 'овощ'),
(6, 1, 'карри', '40 гр.', 'приправа'),
(7, 1, 'вода', '3 стакана', NULL),
(8, 1, 'соль', 'на кончике ножа', 'приправа'),
(9, 1, 'молотый черный перец', 'на кончике ножа', 'приправа'),
(10, 2, 'пшеничная мука', '500 гр.', 'мука'),
(11, 2, 'вода', '750 мл.', NULL),
(12, 2, 'соль', '1 чайн.л.', 'приправа'),
(13, 2, 'говядина', '500 гр.', 'мясо'),
(14, 2, 'лук репчатый', '2 шт.', 'овощ'),
(15, 2, 'зелень кинзы', '1 пуч.', 'зелень'),
(16, 2, 'специи сухие', 'по вкусу', 'приправа'),
(17, 2, 'молотый черный перец', 'по вкусу', 'приправа'),
(18, 2, 'молотый красный перец', 'по вкусу', 'приправа'),
(19, 2, 'соль', 'по вкусу', 'приправа'),
(20, 3, 'баклажаны', '2 шт.', 'овощ'),
(21, 3, 'помидоры', '3 шт.', 'овощ'),
(22, 3, 'чеснок', '2 зуб.', 'овощ'),
(23, 3, 'лук репчатый', '1 шт.', 'овощ'),
(24, 3, 'масло растительное', '3 ст. л.', 'масло'),
(25, 3, 'семена кунжута', 'для подачи', 'приправа'),
(26, 3, 'зелень', 'для подачи', 'зелень'),
(27, 3, 'молотый черный перец', 'по вкусу', 'приправа'),
(28, 3, 'соль', 'по вкусу', 'приправа'),
(29, 4, 'кролик', '1 штука', 'мясо'),
(30, 4, 'темное пиво', '400 мл', NULL),
(31, 4, 'чернослив', '200 г', 'сухофрукт'),
(32, 4, 'лук репчатый', '2 головки', 'овощ'),
(33, 4, 'горчица', '1 ст.л', NULL),
(34, 4, 'тимьян', '1 стебель', 'зелень'),
(35, 4, 'лавровый лист', 'по вкусу', 'приправа'),
(36, 4, 'сливочное масло', '50 г', 'масло'),
(37, 4, 'соль', 'по вкусу', 'приправа'),
(38, 4, 'молотый черный перец', 'по вкусу', 'приправа'),
(48, 5, 'Картофель', '6 шт', 'овощ'),
(49, 5, 'Морковь', '4 шт', 'овощ'),
(50, 5, 'Маринованные огурцы', '200 г(~7 шт)', 'овощ'),
(51, 5, 'Консервированный зеленый горошек', '1 банка', 'бобовые'),
(52, 5, 'Куриное яйцо', '6 шт', 'яйцо'),
(53, 5, 'Докторская колбаса', '500 г', 'колбаса'),
(54, 5, 'Майонез', '200 г', NULL),
(55, 5, 'Сметана', '100 г', NULL),
(56, 5, 'Соль', 'по вкусу', 'приправа'),
(57, 6, 'Сливочное масло', '80 г', 'масло'),
(58, 6, 'Булочка', '2 шт', NULL),
(59, 6, 'Куриное яйцо', '2 шт', 'яйцо'),
(60, 6, 'Сахар', '30 г', NULL),
(61, 6, 'Лимончелло', '1 ст.л', NULL),
(62, 6, 'Сливки', '100 мл', NULL),
(63, 6, 'Бананы', '1 шт', 'фрукт'),
(64, 6, 'Груши', '1 шт', 'фрукт'),
(65, 6, 'Виноград', '80 г', 'ягоды'),
(66, 6, 'Корица ', 'по вкусу', 'приправа'),
(67, 6, 'Сахарная пудра', 'по вкусу', NULL),
(68, 7, 'Малина замороженная', '340 г', 'ягоды'),
(69, 7, 'Лимонад', '2 л', NULL),
(70, 7, 'Лимон', '1 штука', 'фрукт'),
(71, 7, 'Свежая мята', 'по вкусу', 'зелень'),
(72, 7, 'Лед', 'по вкусу', NULL),
(73, 8, 'Гусь', '3 кг', 'птица'),
(74, 8, 'Соль', '15 г', NULL),
(75, 8, 'Имбирь', '40 г', NULL),
(76, 8, 'Чеснок', '5 зубчиков', 'овощ'),
(77, 8, 'Анис (бадьян)', '2 штуки', 'приправа'),
(78, 8, 'Молотая корица', '1 чайная ложка', 'приправа'),
(79, 8, 'Черный перец горошком', '2 чайные ложки', 'приправа'),
(80, 8, 'Апельсины', '2 штуки', 'фрукт'),
(81, 8, 'Сахар', '15 г', NULL),
(82, 9, 'Тыква', '500 г', 'овощ'),
(83, 9, 'Сливки', '300 мл', NULL),
(84, 9, 'Морковь', '1 шт', 'овощ'),
(85, 9, 'Лук', '1 шт', 'овощ'),
(86, 9, 'Чеснок', '3 зубч', 'овощ'),
(87, 9, 'Сливочное масло', '50 гр', 'масло'),
(88, 9, 'Растительное масло', '20 мл', 'масло'),
(89, 9, 'Соль', 'по вкусу', 'приправа'),
(90, 9, 'Перец', 'по вкусу', 'приправа'),
(91, 10, 'Хлеб (любой)', '1 кусочек', NULL),
(92, 10, 'Докторская колбаса', '2 слайса', 'колбаса'),
(93, 11, 'Пшеничная мука', '350 г', 'мука'),
(94, 11, 'Сливочное масло', '200 г', 'масло'),
(95, 11, 'Разрыхлитель', '2 чайн.л', NULL),
(96, 11, 'Лимонный сок', '1 ст.л', NULL),
(97, 11, 'Сахарная пудра', '100 г', NULL),
(98, 11, 'Куриное яйцо', '3 шт', 'яйцо'),
(99, 11, 'Молоко', '250 мл', 'молоко'),
(100, 11, 'Мороженое', 'по вкусу', NULL),
(101, 11, 'Мята', 'по вкусу', 'зелень'),
(102, 11, 'Взбитые сладкие сливки', 'по вкусу', NULL),
(103, 11, 'Ваниль', 'по вкусу', NULL),
(104, 12, 'Брюссельская капуста', '500 г', 'овощ'),
(105, 12, 'Чеснок', '3 зубч', 'овощ'),
(106, 12, 'Лимонный сок', '1 чайн.л', NULL),
(107, 12, 'Оливковое масло', '2 ст.л', 'масло'),
(108, 12, 'Соль', 'по вкусу', 'приправа'),
(109, 12, 'Свежемолотый черный перец', 'по вкусу', 'приправа');

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
(8, 3, 1, 'Для начала тщательно промойте баклажаны под проточной водой. Затем нарежьте их кольцами, примерно по 1 см толщиной. Посолите каждый кусочек с двух сторон и оставьте на 20 минут, чтобы ушла горечь.', 'assets/img/img-steps/baklazhani-1.jpg'),
(9, 3, 2, 'Тщательно помойте помидоры под холодной проточной водой. Затем нарежьте их на дольки. Вы также можете нарезать помидоры кубиками, чтобы они лучше смешались с другими ингредиентами. ', 'assets/img/img-steps/baklazhani-2.jpg'),
(10, 3, 3, 'Очистите репчатый лук от шелухи и нарежьте его маленькими кубиками. Чеснок тоже очистите от шелухи, измельчите ножом или пропустите через пресс для чеснока – как вам удобнее.', 'assets/img/img-steps/baklazhani-3.jpg'),
(11, 3, 4, 'Как только баклажаны постоят 20 минут, необходимо их промыть под холодной водой. Затем обсушите баклажаны с помощью бумажного полотенце. Возьмите сковороду, добавьте немного масла, и разогрейте на среднем огне. Выкладывайте кольца баклажана на раскаленную сковороду и жарьте, пока не появится золотистая корочка с обеих сторон. Вам понадобится 3-4 минуты для каждой стороны. Параллельно возьмите другую сковороду и поджарьте лук до мягкости. Добавьте чеснок и продолжайте жарить ещё несколько минут.', 'assets/img/img-steps/baklazhani-4.jpg'),
(12, 3, 5, 'Добавьте к луку и чесноку нарезанные помидоры, слегка приправьте солью и перцем. Дайте им потушиться на слабом огне около 5 минут — пусть помидоры размягчатся, выпустят свой сок. Затем объедините всё это на одной сковороде с баклажанами. Аккуратно перемешайте, дайте всему блюду прогреться и соединиться в одно целое. Всего пару минут. Выложите готовое блюдо на тарелку или блюдо, посыпьте зеленью и кунжутом.', 'assets/img/img-steps/baklazhani-5.jpg'),
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
(24, 2, 12, 'Чтобы отварить хинкали, вскипятите воду в кастрюле. Посолите ее. Закиньте хинкали. Не варите сразу большое количество, чтобы они не слиплись при варке. Время от времени перемешивайте содержимое кастрюли, чтобы хинкали не прилипли ко дну. Варите хинкали около 14 минут, затем выньте при помощи шумовки на тарелку.', 'assets/img/img-steps/xinkali-12.jpg'),
(25, 4, 1, 'Разделать тушку на куски. Обжарить кусочки кролика в масле до золотистого цвета, посолить, поперчить. Для насыщенного вкуса можно обжарить печень и голову животного. Через 5 минут достать кролика из сковороды.', 'assets/img/img-steps/krolik-v-pive-1.webp'),
(26, 4, 2, 'Лук крупно нарезать и обжарить в той же сковороде.', 'assets/img/img-steps/krolik-v-pive-2.webp'),
(27, 4, 3, 'Добавить темное пиво, тимьян, лавровый лист, чернослив и горчицу. Уварить на медленном огне в течение 15 минут. Положить в соус кролика и томить под крышкой на маленьком огне в течение 45-60 минут. Подавать с яблочным соусом или отварным картофелем.', 'assets/img/img-steps/krolik-v-pive-3.webp'),
(28, 5, 1, 'Отварить картофель и морковь до готовности (40-60 минут). Отдельно сварить яйца (11 минут).', 'assets/img/img-steps/olive-po-sovetski-1.webp'),
(29, 5, 2, 'Очистить картофель и морковь. Все нарезать мелкими кубиками.', 'assets/img/img-steps/olive-po-sovetski-2.webp'),
(30, 5, 3, 'Все перемешать и заправить майонезом, сметаной и солью.', 'assets/img/img-steps/olive-po-sovetski-3.webp'),
(31, 6, 1, 'Подготовить все ингредиенты.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-1.webp'),
(32, 6, 2, 'Фрукты нарезать небольшими кусочками, предварительно избавив от косточек.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-2.webp'),
(33, 6, 3, 'Растопить на сковороде половину сливочного масла и обжарить в нем фрукты до легкой золотистости.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-3.webp'),
(34, 6, 4, 'Посыпать фрукты корицей и сахаром, дать сахару растопиться и аккуратно перемешать фрукты с сахаром, чтобы они покрылись карамелью.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-4.webp'),
(35, 6, 5, 'Влить на сковороду ликер, перемешать и дать ликеру выпариться в течение минуты. Выложить фрукты из сковороды.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-5.webp'),
(36, 6, 6, 'Булочки нарезать на ломтики. Взбить в тарелке яйцо со сливками и замочить в этом смеси хлеб.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-6.webp'),
(37, 6, 7, 'Обжарить хлеб в той же сковороде на сливочном масле до золотисто-коричневой корочки.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-7.webp'),
(38, 6, 8, 'Выложить на гренки обжаренные фрукты.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-8.webp'),
(39, 6, 9, 'Посыпать сахарной пудрой через мелкое ситечко.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-9.webp'),
(40, 6, 10, 'Подавать гренки со сладким чаем или кофе.', 'assets/img/img-steps/francuzskie-grenki-s-fruktami-10.webp'),
(41, 7, 1, 'Разморозьте малину и переложите в блендер вместе с выделившимся соком. Сделайте пюре. Процедите и перелейте в большой графин.', NULL),
(42, 7, 2, 'Добавьте лед по вкусу и залейте лимонадом. Украсьте дольками лимона и листьями мяты.', NULL),
(43, 8, 1, 'Подготовить все ингредиенты.', 'assets/img/img-steps/gus-v-duhovke-1.webp'),
(44, 8, 2, 'В ступке или кофемолке смолоть черный перец и бадьян.', 'assets/img/img-steps/gus-v-duhovke-2.webp'),
(45, 8, 3, 'Корень имбиря натереть на мелкой терке.', 'assets/img/img-steps/gus-v-duhovke-3.webp'),
(46, 8, 4, 'Смешать молотые специи, соль, имбирь, раздавленный через пресс чеснок и апельсиновую цедру до однородной пасты. При необходимости добавить немного растительного масла.', 'assets/img/img-steps/gus-v-duhovke-4.webp'),
(47, 8, 5, 'Натереть гуся пряной пастой снаружи и внутри.', 'assets/img/img-steps/gus-v-duhovke-5.webp'),
(48, 8, 6, 'Обернуть гуся пищевой пленкой и убрать мариноваться в холодильник на 8 часов.', 'assets/img/img-steps/gus-v-duhovke-6.webp'),
(49, 8, 7, 'Разогреть духовку до 180 градусов. Гуся избавить от обертки, выложить в глубокий противень, накрыть фольгой и отправить в духовку на 2 часа.', 'assets/img/img-steps/gus-v-duhovke-7.webp'),
(50, 8, 8, 'Выдавить из апельсинов сок и уварить его с сахаром вдвое в небольшом сотейнике.', 'assets/img/img-steps/gus-v-duhovke-8.webp'),
(51, 8, 9, 'Снять с противня фольгу, смазать гуся апельсиновым соком и запекать еще час, периодически смазывая его соком или вытопившимся жиром с противня.', 'assets/img/img-steps/gus-v-duhovke-9.webp'),
(52, 8, 10, 'Готового гуся подавать к праздничному столу.', 'assets/img/img-steps/gus-v-duhovke-10.webp'),
(53, 9, 1, 'Подготовьте все необходимые ингредиенты. У меня половинка тыквы как раз вышла 500 гр. Количество чеснока можете регулировать по своему желанию. Сливки у меня жирностью 20 %. Кастрюлю для варки вы легко выберите прочитав статью на эту тему. Ссылка на нее есть в конце рецепта.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-1.jpg'),
(54, 9, 2, 'Морковь вымойте в проточной воде с щеткой, очистите и натрите на крупной или средней терке. Чеснок и лук очистите от шелухи, нарежьте кубиком. В кастрюле с толстым дном разогрейте растительное масло и обжарьте овощи, периодически помешивая.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-2.jpg'),
(55, 9, 3, 'Тыку очистите от кожуры, вымойте в проточной вде и нарежьте кубиками.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-3.jpg'),
(56, 9, 4, 'Добавьте к обжаренным овощам нарезанную тыкву и сливочное масло. Обжаривайте всё вместе на среднем огне минут пять.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-4.jpg'),
(57, 9, 5, 'Влейте горячую воду, чтобы она чуть прикрывала овощи. Добавьте соль и перец по вкусу. Варите на слабом огне до готовности овощей (минут пятнадцать).', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-5.jpg'),
(58, 9, 6, 'Готовый суп пюрируйте погружным блендером. По желанию можно оставить несколько кусочков целой тыквы. Степень измельчения супа выбирайте по своему усмотрению.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-6.jpg'),
(59, 9, 7, 'Влейте сливки, перемешайте, доведите суп до кипения и отключите нагрев.', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-7.jpg'),
(60, 9, 8, 'Готовый суп-пюре подавайте горячим, разлив по порционным тарелочкам. В суп при подаче можно добавить гренки, тыквенные семечки или мелко нарезанную свежую зелень. Приятного аппетита!', 'assets/img/img-steps/tykva-so-slivkami-sup-pure-8.jpg'),
(65, 10, 1, 'Отрежте кусочек хлба от буханки.', NULL),
(66, 10, 2, 'Отрежте два слайса докторской колбасы (можно взять любую другую).', NULL),
(67, 10, 3, 'Полжите в нахлёст два слйаса колбасы, чтобы колбаса покрывала всю площадь куска хлеба.', NULL),
(68, 10, 4, 'Всё, ваш бутер готов!!!!!!!!!!!!', NULL),
(69, 11, 1, 'Включить вафельницу.', NULL),
(70, 11, 2, 'Растереть масло с сахарной пудрой.', NULL),
(71, 11, 3, 'Добавить к этой массе яйца, молоко. Аккуратно перемешать.', NULL),
(72, 11, 4, 'Постепенно добавить просеянную муку, разрыхлитель, лимонный сок, ваниль. Смешать все до однородной массы.', NULL),
(73, 11, 5, 'Выпекать 7–10 минут. Примерно 3 столовые ложки на 1 вафлю.', NULL),
(74, 11, 6, 'На теплую вафлю выложить шарик мороженного.', NULL),
(75, 11, 7, 'Украсить листьями мяты, взбитыми сливками.', NULL),
(76, 12, 1, 'Разогрейте духовку до 180 градусов.', NULL),
(77, 12, 2, 'Выложите кочанчики капусты в огнеупорную сковороду и перемешайте с измельченным чесноком. Сбрызните лимонным соком и оливковым маслом, посолите и поперчите. Хорошо перемешайте.', NULL),
(78, 12, 3, 'Отправьте в духовку на 20 минут, затем перемешайте и готовьте еще 10 минут. Капуста должна стать румяного цвета и слегка хрустящая снаружи.', NULL),
(79, 12, 4, 'Снова посолите и подавайте.', NULL);

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
(4, 'ф', '$2y$10$sunVQyyo36pzFCVXZD9JCOOMa6fh.EtREbP7GKnOAM54LNFVN9zPi', 'asd@gmail.com', 'иии', 'ссс', NULL),
(5, 'ssss', '$2y$10$pSLHG.4LEdy.530K80NIyeoyp16vj8OTLPeQfWXrEwPdoGq9dp6OG', 'dfwekfhu@lehfipuf.fweoih', 'ffff', NULL, 2);

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
  ADD PRIMARY KEY (`id_recipe_ingredient`),
  ADD KEY `ingredient_id` (`ingredient`),
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
-- AUTO_INCREMENT для таблицы `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id_recipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id_recipe_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id_recipe_steps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
