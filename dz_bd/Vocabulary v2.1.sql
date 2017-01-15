-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 14 2017 г., 15:51
-- Версия сервера: 5.5.50
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Dictionary`
--

CREATE TABLE IF NOT EXISTS `Dictionary` (
  `id` int(10) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=armscii8;

--
-- Дамп данных таблицы `Dictionary`
--

INSERT INTO `Dictionary` (`id`, `name`) VALUES
(1, 'Sleng'),
(3, 'orthographic');

-- --------------------------------------------------------

--
-- Структура таблицы `Stable_Expression`
--

CREATE TABLE IF NOT EXISTS `Stable_Expression` (
  `id` int(10) NOT NULL,
  `st_ex` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8;

--
-- Дамп данных таблицы `Stable_Expression`
--

INSERT INTO `Stable_Expression` (`id`, `st_ex`) VALUES
(1, 'You can kick his arse');

-- --------------------------------------------------------

--
-- Структура таблицы `Synonyms`
--

CREATE TABLE IF NOT EXISTS `Synonyms` (
  `id` int(10) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8;

--
-- Дамп данных таблицы `Synonyms`
--

INSERT INTO `Synonyms` (`id`, `name`) VALUES
(1, 'ass');

-- --------------------------------------------------------

--
-- Структура таблицы `Vocabulary`
--

CREATE TABLE IF NOT EXISTS `Vocabulary` (
  `id` int(10) NOT NULL,
  `English` varchar(40) DEFAULT NULL,
  `Tranclate` varchar(40) DEFAULT NULL,
  `id_Dictionary` int(10) DEFAULT NULL,
  `id_Synonyms` int(10) DEFAULT NULL,
  `id_StEx` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8;

--
-- Дамп данных таблицы `Vocabulary`
--

INSERT INTO `Vocabulary` (`id`, `English`, `Tranclate`, `id_Dictionary`, `id_Synonyms`, `id_StEx`) VALUES
(1, 'arse', 'zadniza', NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Dictionary`
--
ALTER TABLE `Dictionary`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Stable_Expression`
--
ALTER TABLE `Stable_Expression`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Synonyms`
--
ALTER TABLE `Synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Vocabulary`
--
ALTER TABLE `Vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Dictionary` (`id_Dictionary`),
  ADD KEY `id_Synonyms` (`id_Synonyms`),
  ADD KEY `id_StEx` (`id_StEx`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Dictionary`
--
ALTER TABLE `Dictionary`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Stable_Expression`
--
ALTER TABLE `Stable_Expression`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Synonyms`
--
ALTER TABLE `Synonyms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Vocabulary`
--
ALTER TABLE `Vocabulary`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Vocabulary`
--
ALTER TABLE `Vocabulary`
  ADD CONSTRAINT `vocabulary_ibfk_3` FOREIGN KEY (`id_StEx`) REFERENCES `Stable_Expression` (`id`),
  ADD CONSTRAINT `vocabulary_ibfk_1` FOREIGN KEY (`id_Dictionary`) REFERENCES `Dictionary` (`id`),
  ADD CONSTRAINT `vocabulary_ibfk_2` FOREIGN KEY (`id_Synonyms`) REFERENCES `Synonyms` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
