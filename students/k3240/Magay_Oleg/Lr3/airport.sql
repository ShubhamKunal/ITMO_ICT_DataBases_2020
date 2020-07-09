-- SCHEMA: Аэропорт

-- DROP SCHEMA "Аэропорт" ;

CREATE SCHEMA "Аэропорт"
    AUTHORIZATION postgres;

COMMENT ON SCHEMA "Аэропорт"
    IS 'Лабораторная работа 3';

-- Table: Аэропорт.Авиаперевозчик

-- DROP TABLE "Аэропорт"."Авиаперевозчик";

CREATE TABLE "Аэропорт"."Авиаперевозчик"
(
    -- Inherited from table "Аэропорт"."Администрация": "Номер отдела" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Администрация": "Заключение договоров" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Администрация": "Собеседования" integer NOT NULL,
    "Лицензия" "char" NOT NULL,
    "Название" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Авиаперевозчик_pkey" PRIMARY KEY ("Название")
)
    INHERITS ("Аэропорт"."Администрация")
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Авиаперевозчик"
    OWNER to postgres;

-- Table: Аэропорт.Администрация

-- DROP TABLE "Аэропорт"."Администрация";

CREATE TABLE "Аэропорт"."Администрация"
(
    "Номер отдела" integer NOT NULL,
    "Заключение договоров" integer NOT NULL,
    "Собеседования" integer NOT NULL,
    CONSTRAINT "Администрация_pkey" PRIMARY KEY ("Номер отдела")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Администрация"
    OWNER to postgres;

-- Table: Аэропорт.Вылет

-- DROP TABLE "Аэропорт"."Вылет";

CREATE TABLE "Аэропорт"."Вылет"
(
    -- Inherited from table "Аэропорт"."Рейс": "Номер рейса" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Рейс": "Пункт вылета" text COLLATE pg_catalog."default" NOT NULL,
    -- Inherited from table "Аэропорт"."Рейс": "Расстояние" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Рейс": "Пункт прилета" text COLLATE pg_catalog."default" NOT NULL,
    -- Inherited from table "Аэропорт"."Рейс": "Дата и время" timestamp with time zone NOT NULL,
    -- Inherited from table "Аэропорт"."Рейс": "Транзит" "char",
    -- Inherited from table "Аэропорт"."Экипаж": "Номер экипажа" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Командир " "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Штурман" "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Второй пилот" "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Стюарды" "char" NOT NULL,
    "Номер выхода" integer
)
    INHERITS ("Аэропорт"."Рейс", "Аэропорт"."Экипаж")
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Вылет"
    OWNER to postgres;

-- Table: Аэропорт.Рейс

-- DROP TABLE "Аэропорт"."Рейс";

CREATE TABLE "Аэропорт"."Рейс"
(
    "Номер рейса" integer NOT NULL,
    "Пункт вылета" text COLLATE pg_catalog."default" NOT NULL,
    "Расстояние" integer NOT NULL,
    "Пункт прилета" text COLLATE pg_catalog."default" NOT NULL,
    "Дата и время" timestamp with time zone NOT NULL,
    "Транзит" "char",
    CONSTRAINT "Рейс_pkey" PRIMARY KEY ("Номер рейса")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Рейс"
    OWNER to postgres;

-- Table: Аэропорт.Самолет

-- DROP TABLE "Аэропорт"."Самолет";

CREATE TABLE "Аэропорт"."Самолет"
(
    -- Inherited from table "Аэропорт"."Авиаперевозчик": "Номер отдела" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Авиаперевозчик": "Заключение договоров" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Авиаперевозчик": "Собеседования" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Авиаперевозчик": "Лицензия" "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Авиаперевозчик": "Название" text COLLATE pg_catalog."default" NOT NULL,
    "Номер самолета" integer NOT NULL,
    "Тип" text COLLATE pg_catalog."default" NOT NULL,
    "Скорость" "char" NOT NULL,
    "Число мест" integer NOT NULL,
    CONSTRAINT "Самолет_pkey" PRIMARY KEY ("Номер самолета")
)
    INHERITS ("Аэропорт"."Авиаперевозчик")
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Самолет"
    OWNER to postgres;

-- Table: Аэропорт.Сотрудник

-- DROP TABLE "Аэропорт"."Сотрудник";

CREATE TABLE "Аэропорт"."Сотрудник"
(
    -- Inherited from table "Аэропорт"."Администрация": "Номер отдела" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Администрация": "Заключение договоров" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Администрация": "Собеседования" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Номер экипажа" integer NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Командир " "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Штурман" "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Второй пилот" "char" NOT NULL,
    -- Inherited from table "Аэропорт"."Экипаж": "Стюарды" "char" NOT NULL,
    "ФИО" text COLLATE pg_catalog."default" NOT NULL,
    "Возраст" integer NOT NULL,
    "Стаж" integer NOT NULL,
    "Паспорт" integer NOT NULL,
    "Образование" text COLLATE pg_catalog."default" NOT NULL
)
    INHERITS ("Аэропорт"."Администрация", "Аэропорт"."Экипаж")
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Сотрудник"
    OWNER to postgres;

-- Table: Аэропорт.Экипаж

-- DROP TABLE "Аэропорт"."Экипаж";

CREATE TABLE "Аэропорт"."Экипаж"
(
    "Номер экипажа" integer NOT NULL,
    "Командир " "char" NOT NULL,
    "Штурман" "char" NOT NULL,
    "Второй пилот" "char" NOT NULL,
    "Стюарды" "char" NOT NULL,
    CONSTRAINT "Экипаж_pkey" PRIMARY KEY ("Номер экипажа")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Аэропорт"."Экипаж"
    OWNER to postgres;

INSERT INTO "Аэропорт"."Авиаперевозчик"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название") 
	VALUES ("1","1","56","+","AirAstana");
INSERT INTO "Аэропорт"."Авиаперевозчик"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название") 
	VALUES ("3","1","35","+","AirUnicorn");
INSERT INTO "Аэропорт"."Авиаперевозчик"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название") 
	VALUES ("2","1","65","+","KitaiFly");
INSERT INTO "Аэропорт"."Авиаперевозчик"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название") 
	VALUES ("5","1","36","+","GLHFAirways");
INSERT INTO "Аэропорт"."Авиаперевозчик"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название") 
	VALUES ("4","1","56","+","FlyDavay");

INSERT INTO "Аэропорт"."Администрация"(
	"Номер отдела","Заключение договоров","Собеседования") 
	VALUES ("1","1","56");
INSERT INTO "Аэропорт"."Администрация"(
	"Номер отдела","Заключение договоров","Собеседования") 
	VALUES ("1","1","35");
INSERT INTO "Аэропорт"."Администрация"(
	"Номер отдела","Заключение договоров","Собеседования") 
	VALUES ("1","1","65");
INSERT INTO "Аэропорт"."Администрация"(
	"Номер отдела","Заключение договоров","Собеседования") 
	VALUES ("1","1","36");
INSERT INTO "Аэропорт"."Администрация"(
	"Номер отдела","Заключение договоров","Собеседования") 
	VALUES ("1","1","56");

INSERT INTO "Аэропорт"."Вылет"(
	"Номер рейса","Пункт вылета","Растояние","Пункт прилета","Дата и время","Транзит","Номер экипажа","Номер выхода") 
	VALUES ("1","Москва","705","Санкт-Петербург","2020-04-04 14:30:20+03","-","1","5");
INSERT INTO "Аэропорт"."Вылет"(
	"Номер рейса","Пункт вылета","Растояние","Пункт прилета","Дата и время","Транзит","Номер экипажа","Номер выхода") 
	VALUES ("2","Алматы","4614","Санкт-Петербург","2020-03-04 18:30:20+03","-","2","4");
INSERT INTO "Аэропорт"."Вылет"(
	"Номер рейса","Пункт вылета","Растояние","Пункт прилета","Дата и время","Транзит","Номер экипажа","Номер выхода") 
	VALUES ("3","Санкт-Петербург","3435","Нур-Султан","2020-04-15 12:30:40+03","-","3","3");
INSERT INTO "Аэропорт"."Вылет"(
	"Номер рейса","Пункт вылета","Растояние","Пункт прилета","Дата и время","Транзит","Номер экипажа","Номер выхода") 
	VALUES ("4","Караганда","1952","Уфа","2020-05-05 20:30:20+03","-","4","2");
INSERT INTO "Аэропорт"."Вылет"(
	"Номер рейса","Пункт вылета","Растояние","Пункт прилета","Дата и время","Транзит","Номер экипажа","Номер выхода") 
	VALUES ("5","Нур-Султан","2272","Москва","2020-06-01 22:30:20+03","-","5","1");

INSERT INTO "Аэропорт"."Рейс"(
	"Номер рейса","Пункт вылета","Расстояние","Пункт прилета","Дата и время","Транзит") 
	VALUES ("1","Москва","705","Санкт-Петербург","2020-04-04 14:30:20+03","-");
INSERT INTO "Аэропорт"."Рейс"(
	"Номер рейса","Пункт вылета","Расстояние","Пункт прилета","Дата и время","Транзит") 
	VALUES ("2","Алматы","4614","Санкт-Петербург","2020-03-04 18:30:20+03","-");
INSERT INTO "Аэропорт"."Рейс"(
	"Номер рейса","Пункт вылета","Расстояние","Пункт прилета","Дата и время","Транзит") 
	VALUES ("3","Санкт-Петербург","3435","Нур-Султан","2020-04-15 12:30:40+03","-");
INSERT INTO "Аэропорт"."Рейс"(
	"Номер рейса","Пункт вылета","Расстояние","Пункт прилета","Дата и время","Транзит") 
	VALUES ("4","Караганда","1952","Уфа","2020-05-05 20:30:20+03","-");
INSERT INTO "Аэропорт"."Рейс"(
	"Номер рейса","Пункт вылета","Расстояние","Пункт прилета","Дата и время","Транзит") 
	VALUES ("5","Нур-Султан","2272","Москва","2020-06-01 22:30:20+03","-");

INSERT INTO "Аэропорт"."Самолет"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название","Номер самолета","Тип","Скорость","Число мест") 
	VALUES ("2","1","25","+","FlyMorning","731","AirBus","850","120");
INSERT INTO "Аэропорт"."Самолет"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название","Номер самолета","Тип","Скорость","Число мест") 
	VALUES ("5","1","36","+","SkyBird","732","Boeing","850","150");
INSERT INTO "Аэропорт"."Самолет"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название","Номер самолета","Тип","Скорость","Число мест") 
	VALUES ("4","1","56","+","Optimus-Prime","733","AirBus","850","120");
INSERT INTO "Аэропорт"."Самолет"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название","Номер самолета","Тип","Скорость","Число мест") 
	VALUES ("3","1","52","+","RevolutionSky","734","AirBus","850","120");
INSERT INTO "Аэропорт"."Самолет"(
	"Номер отдела","Заключение договоров","Собеседования","Лицензия","Название","Номер самолета","Тип","Скорость","Число мест") 
	VALUES ("1","1","15","+","Cucumber323","735","Boeing","850","150");

INSERT INTO "Аэропорт"."Сотрудник"(
	"ФИО","Возраст","Стаж","Паспорт","Образование") 
	VALUES ("Ким А.С.","33","10","123456","Высшее");
INSERT INTO "Аэропорт"."Сотрудник"(
	"ФИО","Возраст","Стаж","Паспорт","Образование") 
	VALUES ("Сон Б.К.","28","5","654321","Высшее");
INSERT INTO "Аэропорт"."Сотрудник"(
	"ФИО","Возраст","Стаж","Паспорт","Образование") 
	VALUES ("Ли С.С.","27","4","654123","Высшее");
INSERT INTO "Аэропорт"."Сотрудник"(
	"ФИО","Возраст","Стаж","Паспорт","Образование") 
	VALUES ("Нигай О.В.","29","7","123654","Высшее");
INSERT INTO "Аэропорт"."Сотрудник"(
	"ФИО","Возраст","Стаж","Паспорт","Образование") 
	VALUES ("Ма О.В.","27","2","272829","Высшее");

INSERT INTO "Аэропорт"."Экипаж"(
	"Номер экипажа","Командир","Штурман","Второй пилот","Стюарды") 
	VALUES ("1","+","+","+","+");
INSERT INTO "Аэропорт"."Экипаж"(
	"Номер экипажа","Командир","Штурман","Второй пилот","Стюарды") 
	VALUES ("2","+","+","-","+");
INSERT INTO "Аэропорт"."Экипаж"(
	"Номер экипажа","Командир","Штурман","Второй пилот","Стюарды") 
	VALUES ("3","+","+","+","+");
INSERT INTO "Аэропорт"."Экипаж"(
	"Номер экипажа","Командир","Штурман","Второй пилот","Стюарды") 
	VALUES ("4","+","+","-","+");
INSERT INTO "Аэропорт"."Экипаж"(
	"Номер экипажа","Командир","Штурман","Второй пилот","Стюарды") 
	VALUES ("5","+","+","-","+");