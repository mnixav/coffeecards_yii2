-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Мар 29 2018 г., 12:45
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `coffeecards`
--
CREATE DATABASE IF NOT EXISTS `coffeecards` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `coffeecards`;

-- --------------------------------------------------------

--
-- Структура таблицы `cards`
--

CREATE TABLE `cards` (
  `idcards` int(11) NOT NULL,
  `author` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `img` varchar(45) NOT NULL,
  `description` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cards`
--

INSERT INTO `cards` (`idcards`, `author`, `date`, `img`, `description`) VALUES
(7, 'mnixa', '1520455432', '/cards/card5aa04f087fe5e2.70389064.jpeg', 'Sunny morning...\r\n#caffe #coffee #italy #italia #capuccino #capucino #relax #кофе #кофемофе #италия #утро #бар'),
(8, 'klaksha', '1520455862', '/cards/card5aa050b679a5d7.91353337.jpeg', 'Просто размешать в стакане тоже считается хорошим способом. #coffee #espresso #barista #sun #kyiv #barista #кофе #киев #cappuccino #cafe #coffeegeek #arabica #chemex #joy #hario #taste #latteart #milk #ilovecoffee #eat #eating #foodporn #happy #goodday #flatwhite #goodmorning #energy #coffeebean #coffeeroaster #coffeeshop'),
(11, 'mnixa', '1520501622', '/cards/card5aa10376548167.25047598.jpeg', 'Пожалуй, арбуз и холодный кофе - это все, что требуется в жаркий день в городе\r\n•\r\n•\r\n•\r\n#лето #арбуз #фрукты #погода #вместеслюбимым #кофе #айслатте #неамерика #счастье #счастьевнутри #жизньпрекрасна #summer #watermelon #fruits #myday #withmylove #coffee #imhappy #happinessishere #lifestyle #lovemylife'),
(12, 'klaksha', '1520501755', '/cards/card5aa103fba38ec7.77544808.jpeg', 'Безмятежное утро и завтрак на одной из тихих улочек Барселоны. Местные заходят сюда поздороваться с работниками кафе, купить свежий багет и круассаны или просто пообщаться за чашечной прекрасного кофе. Здесь можно ощутить настоящий ритм этого города - спокойный и размеренный. Нам приготовили потрясающий капучино с вкуснейшей пенкой #кофе #завтрак #утро #барселона'),
(13, 'mnixa', '1520501848', '/cards/card5aa10458b8d181.57136709.jpeg', 'Прекрасное утро начинается с молотого кофе и цветочного настроения\r\n• Пусть сердце ваше весной откликнется\r\n#анонексия #булимия #пп #ип #рпп #дневник #дневникпитания #ппдневник #утро #завтрак #кофе #еда #весна #март #праздник #morning #breakfast #diary #spring #food'),
(14, 'mnixa', '1520501891', '/cards/card5aa104837023a5.54011560.jpeg', '#эспрессо #латте #cafelife #caffeine #ристретто #coffeeart #drink #кофесмолоком #фраппе #лунго #coffeeoftheday #американо #coffeebreak #coffeeaddict #уют #кофеек #coffeelovers #coffeebean #coffeehouse #drinks #coffeelove #prilaga #кофе #доппио #coffeeholic #coffeelover #лучшийкофе #coffeeporn #coffeeshop #кофетайм'),
(15, 'mnixa', '1520502880', '/cards/card5aa1086022fcb5.36396956.jpeg', '#caffeine #coffee #kaffee #koffie #kava #кофе #кава #coffeeaddiction #coffeetime #coffeebreak #kaffeepause #coffeelover #goodtime #goodmorning #gutenmorgen #gutzeit #söt #nett #instadrink #cute #lecker #tasty #yummy #latte #delicious #womensday #8march #cupcakes #spring');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `password`) VALUES
(1, 'mnixa', 'mnixav@gmail.com', '18dk1994'),
(18, 'lol', 'lol@lol.lol', '123456'),
(19, 'klaksha', 'klaksha2510@gmail.com', '123456'),
(20, 'knapweed', 'knapweed53@gmail.com', 'vaselechek');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`idcards`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cards`
--
ALTER TABLE `cards`
  MODIFY `idcards` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- База данных: `coffee_db`
--
CREATE DATABASE IF NOT EXISTS `coffee_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `coffee_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `img` varchar(45) NOT NULL,
  `description` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card`
--

INSERT INTO `card` (`id`, `user_id`, `date`, `img`, `description`) VALUES
(1, 1, '1520455432', 'card5aa04f087fe5e2.70389064.jpeg', 'U3VubnkgbW9ybmluZy4uLg0KI2NhZmZlICNjb2ZmZWUgI2l0YWx5ICNpdGFsaWEgI2NhcHVjY2lubyAjY2FwdWNpbm8gI3JlbGF4ICPQutC+0YTQtSAj0LrQvtGE0LXQvNC+0YTQtSAj0LjRgtCw0LvQuNGPICPRg9GC0YDQviAj0LHQsNGA'),
(2, 1, '1520455862', 'card5aa050b679a5d7.91353337.jpeg', '0J/RgNC+0YHRgtC+INGA0LDQt9C80LXRiNCw0YLRjCDQsiDRgdGC0LDQutCw0L3QtSDRgtC+0LbQtSDRgdGH0LjRgtCw0LXRgtGB0Y8g0YXQvtGA0L7RiNC40Lwg0YHQv9C+0YHQvtCx0L7QvC4gI2NvZmZlZSAjZXNwcmVzc28gI2JhcmlzdGEgI3N1biAja3lpdiAjYmFyaXN0YSAj0LrQvtGE0LUgI9C60LjQtdCyICNjYXBwdWNjaW5vICNjYWZlICNjb2ZmZWVnZWVrICNhcmFiaWNhICNjaGVtZXggI2pveSAjaGFyaW8gI3Rhc3RlICNsYXR0ZWFydCAjbWlsayAjaWxvdmVjb2ZmZWUgI2VhdCAjZWF0aW5nICNmb29kcG9ybiAjaGFwcHkgI2dvb2RkYXkgI2ZsYXR3aGl0ZSAjZ29vZG1vcm5pbmcgI2VuZXJneSAjY29mZmVlYmVhbiAjY29mZmVlcm9hc3RlciAjY29mZmVlc2hvcA=='),
(3, 3, '1520501622', 'card5aa10376548167.25047598.jpeg', '0J/QvtC20LDQu9GD0LksINCw0YDQsdGD0Lcg0Lgg0YXQvtC70L7QtNC90YvQuSDQutC+0YTQtSAtINGN0YLQviDQstGB0LUsINGH0YLQviDRgtGA0LXQsdGD0LXRgtGB0Y8g0LIg0LbQsNGA0LrQuNC5INC00LXQvdGMINCyINCz0L7RgNC+0LTQtQ0K4oCiDQrigKINCuKAog0KI9C70LXRgtC+ICPQsNGA0LHRg9C3ICPRhNGA0YPQutGC0YsgI9C/0L7Qs9C+0LTQsCAj0LLQvNC10YHRgtC10YHQu9GO0LHQuNC80YvQvCAj0LrQvtGE0LUgI9Cw0LnRgdC70LDRgtGC0LUgI9C90LXQsNC80LXRgNC40LrQsCAj0YHRh9Cw0YHRgtGM0LUgI9GB0YfQsNGB0YLRjNC10LLQvdGD0YLRgNC4ICPQttC40LfQvdGM0L/RgNC10LrRgNCw0YHQvdCwICNzdW1tZXIgI3dhdGVybWVsb24gI2ZydWl0cyAjbXlkYXkgI3dpdGhteWxvdmUgI2NvZmZlZSAjaW1oYXBweSAjaGFwcGluZXNzaXNoZXJlICNsaWZlc3R5bGUgI2xvdmVteWxpZmU='),
(4, 1, '1520501755', 'card5aa103fba38ec7.77544808.jpeg', '0JHQtdC30LzRj9GC0LXQttC90L7QtSDRg9GC0YDQviDQuCDQt9Cw0LLRgtGA0LDQuiDQvdCwINC+0LTQvdC+0Lkg0LjQtyDRgtC40YXQuNGFINGD0LvQvtGH0LXQuiDQkdCw0YDRgdC10LvQvtC90YsuINCc0LXRgdGC0L3Ri9C1INC30LDRhdC+0LTRj9GCINGB0Y7QtNCwINC/0L7Qt9C00L7RgNC+0LLQsNGC0YzRgdGPINGBINGA0LDQsdC+0YLQvdC40LrQsNC80Lgg0LrQsNGE0LUsINC60YPQv9C40YLRjCDRgdCy0LXQttC40Lkg0LHQsNCz0LXRgiDQuCDQutGA0YPQsNGB0YHQsNC90Ysg0LjQu9C4INC/0YDQvtGB0YLQviDQv9C+0L7QsdGJ0LDRgtGM0YHRjyDQt9CwINGH0LDRiNC10YfQvdC+0Lkg0L/RgNC10LrRgNCw0YHQvdC+0LPQviDQutC+0YTQtS4g0JfQtNC10YHRjCDQvNC+0LbQvdC+INC+0YnRg9GC0LjRgtGMINC90LDRgdGC0L7Rj9GJ0LjQuSDRgNC40YLQvCDRjdGC0L7Qs9C+INCz0L7RgNC+0LTQsCAtINGB0L/QvtC60L7QudC90YvQuSDQuCDRgNCw0LfQvNC10YDQtdC90L3Ri9C5LiDQndCw0Lwg0L/RgNC40LPQvtGC0L7QstC40LvQuCDQv9C+0YLRgNGP0YHQsNGO0YnQuNC5INC60LDQv9GD0YfQuNC90L4g0YEg0LLQutGD0YHQvdC10LnRiNC10Lkg0L/QtdC90LrQvtC5ICPQutC+0YTQtSAj0LfQsNCy0YLRgNCw0LogI9GD0YLRgNC+ICPQsdCw0YDRgdC10LvQvtC90LA='),
(5, 1, '1520501848', 'card5aa10458b8d181.57136709.jpeg', '0J/RgNC10LrRgNCw0YHQvdC+0LUg0YPRgtGA0L4g0L3QsNGH0LjQvdCw0LXRgtGB0Y8g0YEg0LzQvtC70L7RgtC+0LPQviDQutC+0YTQtSDQuCDRhtCy0LXRgtC+0YfQvdC+0LPQviDQvdCw0YHRgtGA0L7QtdC90LjRjw0K4oCiINCf0YPRgdGC0Ywg0YHQtdGA0LTRhtC1INCy0LDRiNC1INCy0LXRgdC90L7QuSDQvtGC0LrQu9C40LrQvdC10YLRgdGPDQoj0LDQvdC+0L3QtdC60YHQuNGPICPQsdGD0LvQuNC80LjRjyAj0L/QvyAj0LjQvyAj0YDQv9C/ICPQtNC90LXQstC90LjQuiAj0LTQvdC10LLQvdC40LrQv9C40YLQsNC90LjRjyAj0L/Qv9C00L3QtdCy0L3QuNC6ICPRg9GC0YDQviAj0LfQsNCy0YLRgNCw0LogI9C60L7RhNC1ICPQtdC00LAgI9Cy0LXRgdC90LAgI9C80LDRgNGCICPQv9GA0LDQt9C00L3QuNC6ICNtb3JuaW5nICNicmVha2Zhc3QgI2RpYXJ5ICNzcHJpbmcgI2Zvb2Q='),
(6, 1, '1520501891', 'card5aa104837023a5.54011560.jpeg', 'I9GN0YHQv9GA0LXRgdGB0L4gI9C70LDRgtGC0LUgI2NhZmVsaWZlICNjYWZmZWluZSAj0YDQuNGB0YLRgNC10YLRgtC+ICNjb2ZmZWVhcnQgI2RyaW5rICPQutC+0YTQtdGB0LzQvtC70L7QutC+0LwgI9GE0YDQsNC/0L/QtSAj0LvRg9C90LPQviAjY29mZmVlb2Z0aGVkYXkgI9Cw0LzQtdGA0LjQutCw0L3QviAjY29mZmVlYnJlYWsgI2NvZmZlZWFkZGljdCAj0YPRjtGCICPQutC+0YTQtdC10LogI2NvZmZlZWxvdmVycyAjY29mZmVlYmVhbiAjY29mZmVlaG91c2UgI2RyaW5rcyAjY29mZmVlbG92ZSAjcHJpbGFnYSAj0LrQvtGE0LUgI9C00L7Qv9C/0LjQviAjY29mZmVlaG9saWMgI2NvZmZlZWxvdmVyICPQu9GD0YfRiNC40LnQutC+0YTQtSAjY29mZmVlcG9ybiAjY29mZmVlc2hvcCAj0LrQvtGE0LXRgtCw0LnQvA=='),
(7, 1, '1520502880', 'card5aa1086022fcb5.36396956.jpeg', 'I2NhZmZlaW5lICNjb2ZmZWUgI2thZmZlZSAja29mZmllICNrYXZhICPQutC+0YTQtSAj0LrQsNCy0LAgI2NvZmZlZWFkZGljdGlvbiAjY29mZmVldGltZSAjY29mZmVlYnJlYWsgI2thZmZlZXBhdXNlICNjb2ZmZWVsb3ZlciAjZ29vZHRpbWUgI2dvb2Rtb3JuaW5nICNndXRlbm1vcmdlbiAjZ3V0emVpdCAjc8O2dCAjbmV0dCAjaW5zdGFkcmluayAjY3V0ZSAjbGVja2VyICN0YXN0eSAjeXVtbXkgI2xhdHRlICNkZWxpY2lvdXMgI3dvbWVuc2RheSAjOG1hcmNoICNjdXBjYWtlcyAjc3ByaW5n'),
(15, 1, '1522220864', 'card5abb3f406dca59.94047126.jpg', '0JzQvtGPINC40YHRgtC+0YDQuNGPINC30L3QsNC60L7QvNGB0YLQstCwINGB0L4gI3N0YXJidWNrcyDRg9C20LUg0LTQsNCy0L3Rj9GPLiDQlNC70Y8g0LzQtdC90Y8gI9C60L7RhNC1INGN0YLQviDQvdC1INC/0YDQvtGB0YLQviDQvdCw0L/QuNGC0L7Quiwg0LrQvtGC0L7RgNGL0Lkg0L/QviDQsdC+0LvRjNGI0LXQuSDRh9Cw0YHRgtC4INGB0LXQudGH0LDRgSDQsdC10LfQstC60YPRgdC90YvQuSwg0LTQu9GPINC80LXQvdGPINGN0YLQviDRhtC10LvQsNGPINC40LTQtdC+0LvQvtCz0LjRjy0g0L3QtdGB0L/QtdGI0L3QsNGPLCDQsNGA0L7QvNCw0YLQvdCw0Y8sINCy0LTRg9C80YfQuNCy0LDRj+KYle+4j9C30LDRiNC70LAg0Y8g0YLRg9C00LAg0LLQvdCw0YfQsNC70LUg0L3QtSDRgdC70YPRh9Cw0LnQvdC+IPCfmYLQvNC40L3Rg9GC0L3Ri9C5INC40L3RgtC10YDQtdGBLCDQuCDQstC+0YItINCy0YHQtdC70LXQvdGB0LrQsNGPINC70Y7QsdC+0LLRjCDQuiDQutC+0YTQtSwg0L3QviDQvdC1INGA0LDRgdGC0LLQvtGA0LjQvNC+0LzRgyDQuNC3INC/0Y/RgtC10YDQvtGH0LrQuCwg0LAg0LLQutGD0YHQvdC+0LzRgywg0YHQviDQvNC90L7Qs9C40LzQuCDQvdC+0YLQsNC80Lgg0LDRgNC+0LzQsNGC0L7Qsiwg0L/RgNC40LLQutGD0YHQvtCyINC60L7RhNC1LCDRgdC00LXQu9Cw0L3QvdC+0LzRgyDRgSDQu9GO0LHQvtCy0YzRjiDimLrvuI/RgtCw0Log0YfRgtC+INC90LUg0L/Rg9GC0LDQudGC0LUg0LrQvtGE0LXQudC90YvQuSDRgNCw0YHRgtCy0L7RgNC40LzRi9C5INC90LDQv9C40YLQvtC6INC4INC60L7RhNC1INC40Lcg0LfRkdGA0LXQvSwg0Y3RgtC+INGA0LDQt9C90YvQtSDQstC10YnQuCwg0YXQvtGC0Y8g0L3QsCDRjdGC0LjQutC10YLQutCw0YUg0L/QuNGI0YPRgiDQvtC00L3QviDQuCDRgtC+INC20LUg8J+krdCwIFN0YXJidWNrcyDRjdGC0L4g0L7RgtC00LXQu9GM0L3QsNGPINGC0LXQvNCwLCDRgtCw0Lwg0Y8g0LzQvtCz0YMg0LLRi9C/0LjRgtGMINGH0LDRiNC10YfQutGDINC90LDRgdGC0L7Rj9GJ0LXQs9C+INC60L7RhNC1LCDRgNCw0YHRgdC70LDQsdC40YLRgdGPINCyINGC0LjRiNC40L3QtSDQuCDQvtGJ0YPRgtC40YLRjC4uLiDwn6SU0L3QtdGC0L7RgNC+0L/Qu9C40LLQvtGB0YLRjCwg0LXRgdC70Lgg0LzQvtC20L3QviDRgtCw0Log0YHQutCw0LfQsNGC0YwuLi4gQHN0YXJidWNrc3J1c3NpYSDinaTvuI8NCiNjb2ZmZWUgI3N0YXJidWNrc2NvZmZlZSAjYm9va3N0YWdyYW0gI3RoZW1lICNvbmVsb3ZlICNhdG1vc3BoZXJlICPRgdGC0LDRgNCx0LDQutGBICPQvNGL0YHQu9C4ICPQu9GO0LHQu9GO0YHQstC+0Y7QttC40LfQvdGM'),
(16, 1, '1522220981', 'card5abb3fb5073ef8.12925781.jpg', '0J/QvtC60YPQv9C60LAg0LrQvtGE0LUg0L3QsCDQstGL0L3QvtGBINGDINC80LXQvdGPINCy0YHQtdCz0LTQsCDQsNGB0YHQvtGG0LjQuNGA0YPQtdGC0YHRjyDRgSDQv9GD0YLQtdGI0LXRgdGC0LLQuNC10Lwg0L3QsCDQvNCw0YjQuNC90LUpINCS0LXQtNGMINC60L7Qs9C00LAg0YLQsNC6INC00L7Qu9Cz0L4g0LXQtNC10YjRjCAoMTAwMNC60LwsINCwINGC0L4g0Lgg0LXRidGRINCx0L7Qu9GM0YjQtSksINC+0YfQtdC90Ywg0YXQvtGH0LXRgtGB0Y8g0LLQt9Cx0L7QtNGA0LjRgtGM0YHRjyDimJXvuI/QmCwg0LrQvtC90LXRh9C90L4sINC70LjRh9C90L4g0LzQtdC90Y8g0L7Rh9C10L3RjCDRgNCw0LTRg9GO0YIg0YDQsNC30L3QvtC+0LHRgNCw0LfQvdGL0LUg0YHRgtCw0LrQsNC90YfQuNC60LgpINCjINC80LXQvdGPINC00LDQttC1INC10YHRgtGMINC90LXQsdC+0LvRjNGI0LDRjyDQutC+0LvQu9C10LrRhtC40Y8g8J+YitCS0YHQtdC8INC00L7QsdGA0L7Qs9C+INGD0YLRgNCwINC4INGF0L7RgNC+0YjQtdCz0L4g0LTQvdGPIQ=='),
(17, 1, '1522221106', 'card5abb4032909aa8.49126446.jpg', '0JTQvtCx0YDQvtC1INGD0YLRgNC+8J+YmA0K0JLQutGD0YHQvdC+0LPQviDQuCDRgNCw0LTQvtGB0YLQvdC+0LPQviDQstCw0Lwg0LTQvdGPIOKdpO+4jw0K0KbQtdC90LjRgtC1INC4INC/0YDQvtCy0L7QtNC40YLQtSDQsdC+0LvRjNGI0LUg0LLRgNC10LzQtdC90Lgg0YEg0LHQu9C40LfQutC40LzQuOKYgO+4jw0KLg0KLg0KLg0KI9C00L7QsdGA0L7QtdGD0YLRgNC+ICPQutC+0YTQtSAjY29mZmVlICNnb29kbW9ybmluZw=='),
(18, 1, '1522235899', 'card5abb79fb559c63.14364348.jpg', '0JTQvtCx0YDQvtC1INGD0YLRgNC+LCDQu9GO0LHQuNC80YvQtSDQvdCw0YjQuCEg8J+Sm/CfmYzwn5iKDQoNCtCd0LDRiNCwINGD0LzQvdC40YbQsCBAa3NlbmlfYmVuaTgg0YPQttC1INCy0L7QstGB0Y4g0LPQvtGC0L7QstC40YIg0LLQutGD0YHQvdC10LnRiNC40Lkg0LrQvtGE0LUsINGA0LjRgdGD0LXRgiDQutGA0LDRgdC+0YLRgyDQvdCwINGB0YLQsNC60LDQvdGH0LjQutCw0YUsINC4INC/0YDQvtGB0YLQviDQtNCw0YDQuNGCINGB0LLQvtGOINGD0LvRi9Cx0LrRgyDQstGB0LXQvCHwn4y38J+Mt/CfjLcNCtCh0LrQvtGA0LXQtSDQstGB0LUg0Log0JrRgdGO0YjQtSwg0LfQsNGA0Y/QttCw0YLRjNGB0Y8g0L/QvtC30LjRgtC40LLQvtC88J+MvPCfjLjwn4y8DQoj0J/QuNGA0L7Qs9Ca0L7RhNC10LjRhyPQutC+0YTQtSPQutC+0YTQtdGB0YHQvtCx0L7QuSPQutC+0YTQtdC90LDQsdC10LPRgyPQv9C40YDQvtCz0LjRgtGD0YIj0LLQu9Cw0LTQuNC80LjRgCPQsdC+0LvRjNGI0LDRj9C80L7RgdC60L7QstGB0LrQsNGPMjI='),
(19, 2, '1522254287', 'card5abbc1cef2d562.76352499.jpg', '0JHQvtGA0L7QtNCwINCx0L7RgNC+0LTQtdC90Ywg0KHQsNC90YLRi15e'),
(20, 2, '1522254475', 'card5abbc28b249298.42206088.jpg', '0J/Rg9GC0LXRiNC10YHRgtCy0LjQtSDQuCDQutC+0YTQtSDigJTRjdGC0L4g0LLQvtC70YjQtdCx0L3Qvg=='),
(23, 2, '1522257212', 'card5abbcd3bdf0114.93988045.jpg', NULL),
(24, 2, '1522310198', 'card5abc9c3686eb98.91666897.jpg', '0JrQvtGE0LUg0YEg0LzQvtC70L7QutC+0Lwg0YLQvtC20LUg0L3QtdC/0LvQvtGF0L7QtSDRgdC+0YfQtdGC0LDQvdC40LU='),
(25, 2, '1522310326', 'card5abc9cb6642004.17313201.jpg', '0JXRgdC70Lgg0YDRj9C00L7QvCDRgSDQstCw0LzQuCDRhdC+0YDQvtGI0LjQuSDRh9C10LvQvtCy0LXQuiAtINCx0LXRgNC10LPQuNGC0LUg0LXQs9C+LCDRhdC+0YDQvtGI0LjQtSDQu9GO0LTQuCAtINC90LUg0LDQstGC0L7QsdGD0YHRiywg0YHQu9C10LTRg9GO0YnQuNC5INC90LUg0L/RgNC40LTQtdGCLg==');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `accessToken` varchar(128) DEFAULT NULL,
  `authKey` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `friendsOnly` int(1) DEFAULT '0',
  `email` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `accessToken`, `authKey`, `name`, `friendsOnly`, `email`) VALUES
(1, 'mnixa', '$2y$13$hnr8FT4ZoeBog63RIngZbuueeRe4bAJFkbBxQG14Jdd5snPTP38Fu', NULL, NULL, 'Вадим', 1, 'mnixav@gmail.com'),
(2, 'knapweed', '$2y$13$PMdXVHpKemx/dzcyMQUmuuU8yo7Bb5/yAgTK7z9z5JHUNUMlRB3VK', NULL, NULL, NULL, 0, NULL),
(3, 'klaksha', '$2y$13$KDkEBtuxCBbnGvUJQM.oYuATDqx2jYwdA2maRJjOeId0IUEtPGM16', NULL, NULL, NULL, 0, NULL),
(5, 'lol', '$2y$13$KDkEBtuxCBbnGvUJQM.oYuATDqx2jYwdA2maRJjOeId0IUEtPGM16', NULL, NULL, NULL, 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
