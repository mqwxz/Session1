USE [session]
GO
/****** Object:  Table [dbo].[activity_staff]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_staff](
	[id_event] [int] NOT NULL,
	[activity_name] [varchar](128) NOT NULL,
	[activity_day] [int] NOT NULL,
	[activity_time] [time](7) NOT NULL,
	[activity_moder] [int] NULL,
	[activity_j1] [int] NULL,
	[activity_j2] [int] NULL,
	[activity_j3] [int] NULL,
	[activity_j4] [int] NULL,
	[activity_j5] [int] NULL,
 CONSTRAINT [pk_id_name] PRIMARY KEY CLUSTERED 
(
	[id_event] ASC,
	[activity_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[id_event] [int] NOT NULL,
	[event_name] [nvarchar](150) NOT NULL,
	[event_date] [date] NOT NULL,
	[event_days] [int] NOT NULL,
	[event_city] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_event] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[id_activity] [int] NOT NULL,
	[event_id] [int] NULL,
	[activity_date] [date] NOT NULL,
	[activity_days] [int] NOT NULL,
	[activity_winner] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewEventsFixed]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventsFixed]
AS
SELECT        dbo.activity_staff.id_event AS [№], dbo.event.event_name AS [Наименование мероприятия], dbo.activity_staff.activity_name AS Направление, dbo.activity.activity_date AS Дата
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  View [dbo].[ViewEventsAndDirectionsFixed]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventsAndDirectionsFixed]
AS
SELECT        dbo.event.id_event AS [№], dbo.activity_staff.activity_name AS Направление
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  View [dbo].[ViewEvent1]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent1]
AS
SELECT        dbo.event.*
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  Table [dbo].[city]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id_city] [int] NOT NULL,
	[city_emblem] [varbinary](max) NULL,
	[city_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewCities]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCities]
AS
SELECT        id_city AS Город, city_name
FROM            dbo.city
GO
/****** Object:  View [dbo].[ViewEventFull]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventFull]
AS
SELECT        dbo.event.*
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  View [dbo].[ViewEventsNamee]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventsNamee]
AS
SELECT        id_event AS event, event_name AS [Название мероприятия]
FROM            dbo.event
GO
/****** Object:  View [dbo].[ViewEventName]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventName]
AS
SELECT        id_event AS event, event_name AS [Название мероприятия]
FROM            dbo.event
GO
/****** Object:  View [dbo].[ViewEvents]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvents]
AS
SELECT        dbo.event.id_event AS [№], dbo.event.event_name AS [Наименование мероприятия], dbo.activity_staff.activity_name AS Направление, dbo.event.event_date AS Дата
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity_staff ON dbo.event.id_event = dbo.activity_staff.id_event
GO
/****** Object:  View [dbo].[ViewEvent2]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent2]
AS
SELECT        dbo.activity.*
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  View [dbo].[ViewEvent3]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent3]
AS
SELECT        dbo.activity_staff.*
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  Table [dbo].[people]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[people](
	[id_people] [int] IDENTITY(1,1) NOT NULL,
	[people_role] [int] NULL,
	[people_fio] [nvarchar](255) NOT NULL,
	[people_post] [nvarchar](255) NOT NULL,
	[people_dob] [date] NOT NULL,
	[people_country] [int] NULL,
	[people_phone] [nvarchar](32) NOT NULL,
	[people_pass] [nvarchar](64) NOT NULL,
	[people_photo] [nvarchar](255) NULL,
	[people_gender] [char](12) NULL,
	[people_direction] [int] NULL,
	[people_event] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_people] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPeople]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPeople]
AS
SELECT        id_people AS [Id Number], people_fio AS ФИО, people_gender AS Пол, people_role AS Роль, people_post AS Почта, people_phone AS Телефон, people_country AS Страна, people_dob AS [Дата рождения], 
                         people_photo AS Фото, people_pass AS Пароль
FROM            dbo.people
GO
/****** Object:  Table [dbo].[country]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id_country] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](100) NOT NULL,
	[country_eng_name] [nvarchar](100) NOT NULL,
	[country_code] [nvarchar](3) NOT NULL,
	[country_code2] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewCountries]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCountries]
AS
SELECT        country_name AS Страна
FROM            dbo.country
GO
/****** Object:  View [dbo].[ViewEventsName]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventsName]
AS
SELECT        event_name AS [Название мероприятия]
FROM            dbo.event
GO
/****** Object:  View [dbo].[ViewEventsAndDirections]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventsAndDirections]
AS
SELECT        id_event AS Мероприятие, activity_name AS Направление
FROM            dbo.activity_staff
GO
/****** Object:  View [dbo].[ViewActivities]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewActivities]
AS
SELECT        dbo.activity_staff.*
FROM            dbo.activity_staff
GO
/****** Object:  View [dbo].[ViewStaff]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStaff]
AS
SELECT        dbo.activity.event_id, dbo.activity_staff.activity_name, dbo.activity_staff.activity_day, dbo.activity_staff.activity_time, dbo.activity_staff.activity_moder, dbo.activity_staff.activity_j1, dbo.activity_staff.activity_j2, 
                         dbo.activity_staff.activity_j3, dbo.activity_staff.activity_j4, dbo.activity_staff.activity_j5
FROM            dbo.event LEFT OUTER JOIN
                         dbo.activity ON dbo.activity.event_id = dbo.event.id_event INNER JOIN
                         dbo.activity_staff ON dbo.activity_staff.id_event = dbo.activity.id_activity
GO
/****** Object:  Table [dbo].[direction_m]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direction_m](
	[id_direction_m] [int] IDENTITY(1,1) NOT NULL,
	[direction_m_name] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_direction_m] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_m]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_m](
	[id_event_m] [int] IDENTITY(1,1) NOT NULL,
	[event_m_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_event_m] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_m]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_m](
	[id_role_m] [int] IDENTITY(1,1) NOT NULL,
	[role_m_name] [nvarchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_role_m] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Активности_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Активности_import](
	[№] [float] NULL,
	[Наименование мероприятия] [nvarchar](255) NULL,
	[Дата начала] [datetime] NULL,
	[Дни] [float] NULL,
	[Активность] [nvarchar](255) NULL,
	[День] [float] NULL,
	[Время начала] [datetime] NULL,
	[Модератор] [nvarchar](255) NULL,
	[Жюри 1] [nvarchar](255) NULL,
	[Жюри 2] [nvarchar](255) NULL,
	[Жюри 3] [nvarchar](255) NULL,
	[Жюри 4] [nvarchar](255) NULL,
	[Жюри 5] [nvarchar](255) NULL,
	[Победитель] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Город_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Город_import](
	[F1] [int] NULL,
	[F2] [varbinary](max) NULL,
	[F3] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Жюри_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Жюри_import](
	[ФИО] [nvarchar](255) NULL,
	[пол] [nvarchar](255) NULL,
	[почта] [nvarchar](255) NULL,
	[дата рождения] [datetime] NULL,
	[страна] [float] NULL,
	[телефон] [nvarchar](255) NULL,
	[направление] [nvarchar](255) NULL,
	[пароль] [nvarchar](255) NULL,
	[фото] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Мероприятия_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Мероприятия_import](
	[№] [int] NULL,
	[Событие] [nvarchar](150) NULL,
	[DATE] [date] NULL,
	[DAYS] [int] NULL,
	[Город] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Модераторы_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Модераторы_import](
	[ФИО] [nvarchar](255) NULL,
	[пол] [nvarchar](255) NULL,
	[почта] [nvarchar](255) NULL,
	[дата рождения] [datetime] NULL,
	[страна] [float] NULL,
	[телефон] [nvarchar](255) NULL,
	[направление] [nvarchar](255) NULL,
	[мероприятие] [nvarchar](255) NULL,
	[пароль] [nvarchar](255) NULL,
	[фото] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Организаторы_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Организаторы_import](
	[ФИО] [nvarchar](255) NULL,
	[Почта] [nvarchar](255) NULL,
	[Дата рождения] [datetime] NULL,
	[страна] [float] NULL,
	[телефон] [nvarchar](255) NULL,
	[пароль] [nvarchar](255) NULL,
	[фото] [nvarchar](255) NULL,
	[пол] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны_import](
	[Название страны] [nvarchar](255) NULL,
	[Английское название] [nvarchar](255) NULL,
	[Код] [nvarchar](255) NULL,
	[Код2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Участники_import]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Участники_import](
	[ФИО] [nvarchar](255) NULL,
	[Почта] [nvarchar](255) NULL,
	[дата рождения] [datetime] NULL,
	[страна] [float] NULL,
	[телефон] [float] NULL,
	[пароль] [nvarchar](255) NULL,
	[фото] [nvarchar](255) NULL,
	[пол] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (1, 3, CAST(N'2023-11-09' AS Date), 2, 32)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (2, 5, CAST(N'2023-04-13' AS Date), 2, 33)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (3, 8, CAST(N'2022-04-16' AS Date), 3, 34)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (4, 10, CAST(N'2022-10-18' AS Date), 2, 35)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (5, 12, CAST(N'2022-11-27' AS Date), 3, 36)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (6, 13, CAST(N'2023-10-31' AS Date), 2, 37)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (7, 14, CAST(N'2022-07-02' AS Date), 2, 38)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (8, 15, CAST(N'2022-10-14' AS Date), 1, 40)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (9, 16, CAST(N'2023-05-08' AS Date), 3, 42)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (10, 19, CAST(N'2023-09-13' AS Date), 3, 44)
INSERT [dbo].[activity] ([id_activity], [event_id], [activity_date], [activity_days], [activity_winner]) VALUES (11, 21, CAST(N'2023-12-22' AS Date), 3, NULL)
GO
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (1, N'Искусство коучинга', 2, CAST(N'12:30:00' AS Time), 70, 54, 55, 69, 59, 59)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (1, N'Лидерство в бизнесе', 1, CAST(N'09:00:00' AS Time), 1, 52, NULL, 58, 57, 57)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (1, N'Технология принятия решений', 2, CAST(N'10:45:00' AS Time), 2, 53, 54, 59, 58, 58)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (2, N'Навыки подготовки', 2, CAST(N'12:30:00' AS Time), 6, 55, 59, NULL, NULL, 58)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (2, N'Переговоры от "А" до "Я"', 1, CAST(N'09:00:00' AS Time), 4, NULL, 57, 55, 53, 56)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (2, N'Телефонные переговоры', 2, CAST(N'10:45:00' AS Time), 5, 54, 58, 56, 54, 57)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (3, N'Big Data', 2, CAST(N'10:45:00' AS Time), 8, 57, 53, 59, 58, 57)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (3, N'Must Have 21 века', 2, CAST(N'12:30:00' AS Time), 9, NULL, 54, NULL, 59, 58)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (3, N'Новые продукты и версии', 1, CAST(N'09:00:00' AS Time), 7, 56, 52, 58, 57, 56)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (4, N'Дизайн-мышление', 2, CAST(N'12:30:00' AS Time), 12, 57, 59, NULL, 58, NULL)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (4, N'Коммуникативные неудачи', 1, CAST(N'10:45:00' AS Time), 11, 56, 58, 56, 57, 58)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (4, N'Управление знаниями', 1, CAST(N'09:00:00' AS Time), 10, NULL, NULL, 55, 56, 57)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (5, N'Исследование рынка', 2, CAST(N'10:45:00' AS Time), 14, 53, 58, 58, 61, 54)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (5, N'Рекрутинг', 3, CAST(N'12:30:00' AS Time), 15, 54, 59, 59, NULL, 55)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (5, N'Технические собеседования', 1, CAST(N'09:00:00' AS Time), 13, 52, NULL, 57, 60, 53)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (6, N'Kanban', 1, CAST(N'09:00:00' AS Time), 16, NULL, 58, 57, 52, 53)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (6, N'Роли HR', 1, CAST(N'12:30:00' AS Time), 18, 57, 60, 59, 54, 55)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (6, N'Способы поиска специалистов', 1, CAST(N'10:45:00' AS Time), 17, 56, 59, 58, 53, 54)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (7, N'Soft skills', 1, CAST(N'10:45:00' AS Time), 20, 56, 56, 57, 53, 60)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (7, N'Осознанность личных целей', 1, CAST(N'09:00:00' AS Time), 19, 55, 55, NULL, NULL, NULL)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (7, N'Развитие проактивности', 2, CAST(N'12:30:00' AS Time), 21, 57, NULL, 58, 54, 61)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (8, N'Введение в IT-субкультуру', 1, CAST(N'09:00:00' AS Time), 12, 58, NULL, 55, 60, 56)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (8, N'Развитие проактивности', 1, CAST(N'16:00:00' AS Time), 14, 60, 57, NULL, NULL, 58)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (8, N'Управление знаниями', 1, CAST(N'10:45:00' AS Time), 13, 59, NULL, 56, 61, 57)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (9, N'Идельный результат', 1, CAST(N'09:00:00' AS Time), 17, 53, 59, 57, NULL, 53)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (9, N'Рычаги', 2, CAST(N'12:30:00' AS Time), 19, NULL, NULL, 59, 61, 55)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (9, N'Тайны и секреты', 2, CAST(N'10:45:00' AS Time), 18, 54, NULL, 58, 60, 54)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (10, N'Войти в ТОП', 1, CAST(N'09:00:00' AS Time), 3, 58, 55, NULL, 56, 53)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (10, N'Руководство проектами', 2, CAST(N'12:30:00' AS Time), 5, 60, NULL, 61, 58, 55)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (10, N'Секреты продвижения', 1, CAST(N'10:45:00' AS Time), 4, 59, 56, 60, 57, 54)
INSERT [dbo].[activity_staff] ([id_event], [activity_name], [activity_day], [activity_time], [activity_moder], [activity_j1], [activity_j2], [activity_j3], [activity_j4], [activity_j5]) VALUES (11, N'Навыки подготовки', 1, CAST(N'12:55:30' AS Time), NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1, NULL, N'Абаза')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (2, NULL, N'Абакан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (3, NULL, N'Абдулино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (4, NULL, N'Абинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (5, NULL, N'Агидель')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (6, NULL, N'Агрыз')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (7, NULL, N'Адыгейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (8, NULL, N'Азнакаево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (9, NULL, N'Азов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (10, NULL, N'Ак-Довурак')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (11, NULL, N'Аксай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (12, NULL, N'Алагир')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (13, NULL, N'Алапаевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (14, NULL, N'Алатырь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (15, NULL, N'Алдан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (16, NULL, N'Алейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (17, NULL, N'Александров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (18, NULL, N'Александровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (19, NULL, N'Александровск-Сахалинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (20, NULL, N'Алексеевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (21, NULL, N'Алексин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (22, NULL, N'Алзамай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (23, NULL, N'Алупкане призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (24, NULL, N'Алуштане призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (25, NULL, N'Альметьевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (26, NULL, N'Амурск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (27, NULL, N'Анадырь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (28, NULL, N'Анапа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (29, NULL, N'Ангарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (30, NULL, N'Андреаполь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (31, NULL, N'Анжеро-Судженск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (32, NULL, N'Анива')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (33, NULL, N'Апатиты')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (34, NULL, N'Апрелевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (35, NULL, N'Апшеронск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (36, NULL, N'Арамиль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (37, NULL, N'Аргун')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (38, NULL, N'Ардатов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (39, NULL, N'Ардон')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (40, NULL, N'Арзамас')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (41, NULL, N'Аркадак')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (42, NULL, N'Армавир')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (43, NULL, N'Армянскне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (44, NULL, N'Арсеньев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (45, NULL, N'Арск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (46, NULL, N'Артём')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (47, NULL, N'Артёмовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (48, NULL, N'Артёмовский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (49, NULL, N'Архангельск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (50, NULL, N'Асбест')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (51, NULL, N'Асино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (52, NULL, N'Астрахань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (53, NULL, N'Аткарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (54, NULL, N'Ахтубинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (55, NULL, N'Ачинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (56, NULL, N'Аша')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (57, NULL, N'Бабаево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (58, NULL, N'Бабушкин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (59, NULL, N'Бавлы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (60, NULL, N'Багратионовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (61, NULL, N'Байкальск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (62, NULL, N'Баймак')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (63, NULL, N'Бакал')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (64, NULL, N'Баксан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (65, NULL, N'Балабаново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (66, NULL, N'Балаково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (67, NULL, N'Балахна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (68, NULL, N'Балашиха')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (69, NULL, N'Балашов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (70, NULL, N'Балей')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (71, NULL, N'Балтийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (72, NULL, N'Барабинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (73, NULL, N'Барнаул')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (74, NULL, N'Барыш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (75, NULL, N'Батайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (76, NULL, N'Бахчисарайне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (77, NULL, N'Бежецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (78, NULL, N'Белая Калитва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (79, NULL, N'Белая Холуница')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (80, NULL, N'Белгород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (81, NULL, N'Белебей')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (82, NULL, N'Белёв')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (83, NULL, N'Белинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (84, NULL, N'Белово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (85, NULL, N'Белогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (86, NULL, N'Белогорскне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (87, NULL, N'Белозерск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (88, NULL, N'Белокуриха')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (89, NULL, N'Беломорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (90, NULL, N'Белоозёрский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (91, NULL, N'Белорецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (92, NULL, N'Белореченск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (93, NULL, N'Белоусово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (94, NULL, N'Белоярский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (95, NULL, N'Белый')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (96, NULL, N'Бердск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (97, NULL, N'Березники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (98, NULL, N'Берёзовский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (99, NULL, N'Берёзовский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (100, NULL, N'Беслан')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (101, NULL, N'Бийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (102, NULL, N'Бикин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (103, NULL, N'Билибино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (104, NULL, N'Биробиджан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (105, NULL, N'Бирск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (106, NULL, N'Бирюсинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (107, NULL, N'Бирюч')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (108, NULL, N'Благовещенск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (109, NULL, N'Благовещенск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (110, NULL, N'Благодарный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (111, NULL, N'Бобров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (112, NULL, N'Богданович')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (113, NULL, N'Богородицк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (114, NULL, N'Богородск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (115, NULL, N'Боготол')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (116, NULL, N'Богучар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (117, NULL, N'Бодайбо')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (118, NULL, N'Бокситогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (119, NULL, N'Болгар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (120, NULL, N'Бологое')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (121, NULL, N'Болотное')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (122, NULL, N'Болохово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (123, NULL, N'Болхов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (124, NULL, N'Большой Камень')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (125, NULL, N'Бор')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (126, NULL, N'Борзя')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (127, NULL, N'Борисоглебск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (128, NULL, N'Боровичи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (129, NULL, N'Боровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (130, NULL, N'Бородино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (131, NULL, N'Братск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (132, NULL, N'Бронницы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (133, NULL, N'Брянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (134, NULL, N'Бугульма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (135, NULL, N'Бугуруслан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (136, NULL, N'Будённовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (137, NULL, N'Бузулук')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (138, NULL, N'Буинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (139, NULL, N'Буй')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (140, NULL, N'Буйнакск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (141, NULL, N'Бутурлиновка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (142, NULL, N'Валдай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (143, NULL, N'Валуйки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (144, NULL, N'Велиж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (145, NULL, N'Великие Луки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (146, NULL, N'Великий Новгород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (147, NULL, N'Великий Устюг')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (148, NULL, N'Вельск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (149, NULL, N'Венёв')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (150, NULL, N'Верещагино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (151, NULL, N'Верея')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (152, NULL, N'Верхнеуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (153, NULL, N'Верхний Тагил')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (154, NULL, N'Верхний Уфалей')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (155, NULL, N'Верхняя Пышма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (156, NULL, N'Верхняя Салда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (157, NULL, N'Верхняя Тура')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (158, NULL, N'Верхотурье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (159, NULL, N'Верхоянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (160, NULL, N'Весьегонск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (161, NULL, N'Ветлуга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (162, NULL, N'Видное')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (163, NULL, N'Вилюйск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (164, NULL, N'Вилючинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (165, NULL, N'Вихоревка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (166, NULL, N'Вичуга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (167, NULL, N'Владивосток')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (168, NULL, N'Владикавказ')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (169, NULL, N'Владимир')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (170, NULL, N'Волгоград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (171, NULL, N'Волгодонск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (172, NULL, N'Волгореченск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (173, NULL, N'Волжск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (174, NULL, N'Волжский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (175, NULL, N'Вологда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (176, NULL, N'Володарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (177, NULL, N'Волоколамск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (178, NULL, N'Волосово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (179, NULL, N'Волхов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (180, NULL, N'Волчанск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (181, NULL, N'Вольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (182, NULL, N'Воркута')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (183, NULL, N'Воронеж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (184, NULL, N'Ворсма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (185, NULL, N'Воскресенск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (186, NULL, N'Воткинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (187, NULL, N'Всеволожск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (188, NULL, N'Вуктыл')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (189, NULL, N'Выборг')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (190, NULL, N'Выкса')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (191, NULL, N'Высоковск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (192, NULL, N'Высоцк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (193, NULL, N'Вытегра')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (194, NULL, N'Вышний Волочёк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (195, NULL, N'Вяземский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (196, NULL, N'Вязники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (197, NULL, N'Вязьма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (198, NULL, N'Вятские Поляны')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (199, NULL, N'Гаврилов Посад')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (200, NULL, N'Гаврилов-Ям')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (201, NULL, N'Гагарин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (202, NULL, N'Гаджиево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (203, NULL, N'Гай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (204, NULL, N'Галич')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (205, NULL, N'Гатчина')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (206, NULL, N'Гвардейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (207, NULL, N'Гдов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (208, NULL, N'Геленджик')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (209, NULL, N'Георгиевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (210, NULL, N'Глазов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (211, NULL, N'Голицыно')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (212, NULL, N'Горбатов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (213, NULL, N'Горно-Алтайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (214, NULL, N'Горнозаводск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (215, NULL, N'Горняк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (216, NULL, N'Городец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (217, NULL, N'Городище')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (218, NULL, N'Городовиковск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (219, NULL, N'Гороховец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (220, NULL, N'Горячий Ключ')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (221, NULL, N'Грайворон')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (222, NULL, N'Гремячинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (223, NULL, N'Грозный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (224, NULL, N'Грязи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (225, NULL, N'Грязовец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (226, NULL, N'Губаха')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (227, NULL, N'Губкин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (228, NULL, N'Губкинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (229, NULL, N'Гудермес')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (230, NULL, N'Гуково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (231, NULL, N'Гулькевичи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (232, NULL, N'Гурьевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (233, NULL, N'Гурьевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (234, NULL, N'Гусев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (235, NULL, N'Гусиноозёрск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (236, NULL, N'Гусь-Хрустальный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (237, NULL, N'Давлеканово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (238, NULL, N'Дагестанские Огни')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (239, NULL, N'Далматово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (240, NULL, N'Дальнегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (241, NULL, N'Дальнереченск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (242, NULL, N'Данилов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (243, NULL, N'Данков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (244, NULL, N'Дегтярск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (245, NULL, N'Дедовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (246, NULL, N'Демидов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (247, NULL, N'Дербент')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (248, NULL, N'Десногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (249, NULL, N'Джанкойне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (250, NULL, N'Дзержинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (251, NULL, N'Дзержинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (252, NULL, N'Дивногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (253, NULL, N'Дигора')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (254, NULL, N'Димитровград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (255, NULL, N'Дмитриев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (256, NULL, N'Дмитров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (257, NULL, N'Дмитровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (258, NULL, N'Дно')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (259, NULL, N'Добрянка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (260, NULL, N'Долгопрудный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (261, NULL, N'Долинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (262, NULL, N'Домодедово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (263, NULL, N'Донецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (264, NULL, N'Донской')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (265, NULL, N'Дорогобуж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (266, NULL, N'Дрезна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (267, NULL, N'Дубна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (268, NULL, N'Дубовка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (269, NULL, N'Дудинка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (270, NULL, N'Духовщина')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (271, NULL, N'Дюртюли')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (272, NULL, N'Дятьково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (273, NULL, N'Евпаторияне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (274, NULL, N'Егорьевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (275, NULL, N'Ейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (276, NULL, N'Екатеринбург')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (277, NULL, N'Елабуга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (278, NULL, N'Елец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (279, NULL, N'Елизово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (280, NULL, N'Ельня')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (281, NULL, N'Еманжелинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (282, NULL, N'Емва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (283, NULL, N'Енисейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (284, NULL, N'Ермолино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (285, NULL, N'Ершов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (286, NULL, N'Ессентуки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (287, NULL, N'Ефремов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (288, NULL, N'Железноводск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (289, NULL, N'Железногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (290, NULL, N'Железногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (291, NULL, N'Железногорск-Илимский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (292, NULL, N'Жердевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (293, NULL, N'Жигулёвск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (294, NULL, N'Жиздра')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (295, NULL, N'Жирновск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (296, NULL, N'Жуков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (297, NULL, N'Жуковка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (298, NULL, N'Жуковский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (299, NULL, N'Завитинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (300, NULL, N'Заводоуковск')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (301, NULL, N'Заволжск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (302, NULL, N'Заволжье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (303, NULL, N'Задонск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (304, NULL, N'Заинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (305, NULL, N'Закаменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (306, NULL, N'Заозёрный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (307, NULL, N'Заозёрск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (308, NULL, N'Западная Двина')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (309, NULL, N'Заполярный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (310, NULL, N'Зарайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (311, NULL, N'Заречный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (312, NULL, N'Заречный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (313, NULL, N'Заринск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (314, NULL, N'Звенигово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (315, NULL, N'Звенигород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (316, NULL, N'Зверево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (317, NULL, N'Зеленогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (318, NULL, N'Зеленоградск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (319, NULL, N'Зеленодольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (320, NULL, N'Зеленокумск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (321, NULL, N'Зерноград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (322, NULL, N'Зея')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (323, NULL, N'Зима')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (324, NULL, N'Златоуст')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (325, NULL, N'Злынка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (326, NULL, N'Змеиногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (327, NULL, N'Знаменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (328, NULL, N'Зубцов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (329, NULL, N'Зуевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (330, NULL, N'Ивангород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (331, NULL, N'Иваново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (332, NULL, N'Ивантеевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (333, NULL, N'Ивдель')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (334, NULL, N'Игарка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (335, NULL, N'Ижевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (336, NULL, N'Избербаш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (337, NULL, N'Изобильный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (338, NULL, N'Иланский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (339, NULL, N'Инза')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (340, NULL, N'Иннополис')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (341, NULL, N'Инсар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (342, NULL, N'Инта')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (343, NULL, N'Ипатово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (344, NULL, N'Ирбит')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (345, NULL, N'Иркутск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (346, NULL, N'Исилькуль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (347, NULL, N'Искитим')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (348, NULL, N'Истра')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (349, NULL, N'Ишим')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (350, NULL, N'Ишимбай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (351, NULL, N'Йошкар-Ола')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (352, NULL, N'Кадников')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (353, NULL, N'Казань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (354, NULL, N'Калач')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (355, NULL, N'Калач-на-Дону')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (356, NULL, N'Калачинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (357, NULL, N'Калининград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (358, NULL, N'Калининск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (359, NULL, N'Калтан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (360, NULL, N'Калуга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (361, NULL, N'Калязин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (362, NULL, N'Камбарка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (363, NULL, N'Каменка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (364, NULL, N'Каменногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (365, NULL, N'Каменск-Уральский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (366, NULL, N'Каменск-Шахтинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (367, NULL, N'Камень-на-Оби')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (368, NULL, N'Камешково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (369, NULL, N'Камызяк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (370, NULL, N'Камышин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (371, NULL, N'Камышлов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (372, NULL, N'Канаш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (373, NULL, N'Кандалакша')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (374, NULL, N'Канск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (375, NULL, N'Карабаново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (376, NULL, N'Карабаш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (377, NULL, N'Карабулак')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (378, NULL, N'Карасук')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (379, NULL, N'Карачаевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (380, NULL, N'Карачев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (381, NULL, N'Каргат')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (382, NULL, N'Каргополь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (383, NULL, N'Карпинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (384, NULL, N'Карталы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (385, NULL, N'Касимов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (386, NULL, N'Касли')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (387, NULL, N'Каспийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (388, NULL, N'Катав-Ивановск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (389, NULL, N'Катайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (390, NULL, N'Качканар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (391, NULL, N'Кашин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (392, NULL, N'Кашира')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (393, NULL, N'Кедровый')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (394, NULL, N'Кемерово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (395, NULL, N'Кемь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (396, NULL, N'Керчьне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (397, NULL, N'Кизел')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (398, NULL, N'Кизилюрт')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (399, NULL, N'Кизляр')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (400, NULL, N'Кимовск')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (401, NULL, N'Кимры')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (402, NULL, N'Кингисепп')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (403, NULL, N'Кинель')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (404, NULL, N'Кинешма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (405, NULL, N'Киреевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (406, NULL, N'Киренск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (407, NULL, N'Киржач')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (408, NULL, N'Кириллов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (409, NULL, N'Кириши')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (410, NULL, N'Киров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (411, NULL, N'Киров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (412, NULL, N'Кировград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (413, NULL, N'Кирово-Чепецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (414, NULL, N'Кировск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (415, NULL, N'Кировск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (416, NULL, N'Кирс')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (417, NULL, N'Кирсанов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (418, NULL, N'Киселёвск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (419, NULL, N'Кисловодск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (420, NULL, N'Клин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (421, NULL, N'Клинцы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (422, NULL, N'Княгинино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (423, NULL, N'Ковдор')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (424, NULL, N'Ковров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (425, NULL, N'Ковылкино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (426, NULL, N'Когалым')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (427, NULL, N'Кодинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (428, NULL, N'Козельск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (429, NULL, N'Козловка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (430, NULL, N'Козьмодемьянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (431, NULL, N'Кола')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (432, NULL, N'Кологрив')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (433, NULL, N'Коломна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (434, NULL, N'Колпашево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (435, NULL, N'Кольчугино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (436, NULL, N'Коммунар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (437, NULL, N'Комсомольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (438, NULL, N'Комсомольск-на-Амуре')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (439, NULL, N'Конаково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (440, NULL, N'Кондопога')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (441, NULL, N'Кондрово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (442, NULL, N'Константиновск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (443, NULL, N'Копейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (444, NULL, N'Кораблино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (445, NULL, N'Кореновск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (446, NULL, N'Коркино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (447, NULL, N'Королёв')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (448, NULL, N'Короча')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (449, NULL, N'Корсаков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (450, NULL, N'Коряжма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (451, NULL, N'Костерёво')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (452, NULL, N'Костомукша')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (453, NULL, N'Кострома')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (454, NULL, N'Котельники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (455, NULL, N'Котельниково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (456, NULL, N'Котельнич')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (457, NULL, N'Котлас')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (458, NULL, N'Котово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (459, NULL, N'Котовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (460, NULL, N'Кохма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (461, NULL, N'Красавино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (462, NULL, N'Красноармейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (463, NULL, N'Красноармейск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (464, NULL, N'Красновишерск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (465, NULL, N'Красногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (466, NULL, N'Краснодар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (467, NULL, N'Краснозаводск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (468, NULL, N'Краснознаменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (469, NULL, N'Краснознаменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (470, NULL, N'Краснокаменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (471, NULL, N'Краснокамск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (472, NULL, N'Красноперекопскне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (473, NULL, N'Краснослободск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (474, NULL, N'Краснослободск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (475, NULL, N'Краснотурьинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (476, NULL, N'Красноуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (477, NULL, N'Красноуфимск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (478, NULL, N'Красноярск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (479, NULL, N'Красный Кут')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (480, NULL, N'Красный Сулин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (481, NULL, N'Красный Холм')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (482, NULL, N'Кремёнки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (483, NULL, N'Кропоткин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (484, NULL, N'Крымск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (485, NULL, N'Кстово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (486, NULL, N'Кубинка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (487, NULL, N'Кувандык')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (488, NULL, N'Кувшиново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (489, NULL, N'Кудрово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (490, NULL, N'Кудымкар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (491, NULL, N'Кузнецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (492, NULL, N'Куйбышев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (493, NULL, N'Кукмор')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (494, NULL, N'Кулебаки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (495, NULL, N'Кумертау')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (496, NULL, N'Кунгур')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (497, NULL, N'Купино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (498, NULL, N'Курган')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (499, NULL, N'Курганинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (500, NULL, N'Курильск')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (501, NULL, N'Курлово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (502, NULL, N'Куровское')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (503, NULL, N'Курск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (504, NULL, N'Куртамыш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (505, NULL, N'Курчалой')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (506, NULL, N'Курчатов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (507, NULL, N'Куса')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (508, NULL, N'Кушва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (509, NULL, N'Кызыл')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (510, NULL, N'Кыштым')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (511, NULL, N'Кяхта')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (512, NULL, N'Лабинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (513, NULL, N'Лабытнанги')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (514, NULL, N'Лагань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (515, NULL, N'Ладушкин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (516, NULL, N'Лаишево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (517, NULL, N'Лакинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (518, NULL, N'Лангепас')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (519, NULL, N'Лахденпохья')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (520, NULL, N'Лебедянь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (521, NULL, N'Лениногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (522, NULL, N'Ленинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (523, NULL, N'Ленинск-Кузнецкий')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (524, NULL, N'Ленск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (525, NULL, N'Лермонтов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (526, NULL, N'Лесной')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (527, NULL, N'Лесозаводск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (528, NULL, N'Лесосибирск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (529, NULL, N'Ливны')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (530, NULL, N'Ликино-Дулёво')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (531, NULL, N'Липецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (532, NULL, N'Липки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (533, NULL, N'Лиски')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (534, NULL, N'Лихославль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (535, NULL, N'Лобня')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (536, NULL, N'Лодейное Поле')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (537, NULL, N'Лосино-Петровский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (538, NULL, N'Луга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (539, NULL, N'Луза')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (540, NULL, N'Лукоянов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (541, NULL, N'Луховицы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (542, NULL, N'Лысково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (543, NULL, N'Лысьва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (544, NULL, N'Лыткарино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (545, NULL, N'Льгов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (546, NULL, N'Любань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (547, NULL, N'Люберцы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (548, NULL, N'Любим')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (549, NULL, N'Людиново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (550, NULL, N'Лянтор')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (551, NULL, N'Магадан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (552, NULL, N'Магас')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (553, NULL, N'Магнитогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (554, NULL, N'Майкоп')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (555, NULL, N'Майский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (556, NULL, N'Макаров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (557, NULL, N'Макарьев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (558, NULL, N'Макушино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (559, NULL, N'Малая Вишера')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (560, NULL, N'Малгобек')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (561, NULL, N'Малмыж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (562, NULL, N'Малоархангельск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (563, NULL, N'Малоярославец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (564, NULL, N'Мамадыш')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (565, NULL, N'Мамоново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (566, NULL, N'Мантурово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (567, NULL, N'Мариинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (568, NULL, N'Мариинский Посад')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (569, NULL, N'Маркс')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (570, NULL, N'Махачкала')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (571, NULL, N'Мглин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (572, NULL, N'Мегион')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (573, NULL, N'Медвежьегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (574, NULL, N'Медногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (575, NULL, N'Медынь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (576, NULL, N'Межгорье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (577, NULL, N'Междуреченск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (578, NULL, N'Мезень')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (579, NULL, N'Меленки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (580, NULL, N'Мелеуз')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (581, NULL, N'Менделеевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (582, NULL, N'Мензелинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (583, NULL, N'Мещовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (584, NULL, N'Миасс')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (585, NULL, N'Микунь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (586, NULL, N'Миллерово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (587, NULL, N'Минеральные Воды')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (588, NULL, N'Минусинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (589, NULL, N'Миньяр')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (590, NULL, N'Мирный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (591, NULL, N'Мирный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (592, NULL, N'Михайлов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (593, NULL, N'Михайловка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (594, NULL, N'Михайловск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (595, NULL, N'Михайловск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (596, NULL, N'Мичуринск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (597, NULL, N'Могоча')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (598, NULL, N'Можайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (599, NULL, N'Можга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (600, NULL, N'Моздок')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (601, NULL, N'Мончегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (602, NULL, N'Морозовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (603, NULL, N'Моршанск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (604, NULL, N'Мосальск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (605, NULL, N'Москва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (606, NULL, N'Муравленко')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (607, NULL, N'Мураши')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (608, NULL, N'Мурино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (609, NULL, N'Мурманск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (610, NULL, N'Муром')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (611, NULL, N'Мценск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (612, NULL, N'Мыски')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (613, NULL, N'Мытищи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (614, NULL, N'Мышкин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (615, NULL, N'Набережные Челны')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (616, NULL, N'Навашино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (617, NULL, N'Наволоки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (618, NULL, N'Надым')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (619, NULL, N'Назарово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (620, NULL, N'Назрань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (621, NULL, N'Называевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (622, NULL, N'Нальчик')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (623, NULL, N'Нариманов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (624, NULL, N'Наро-Фоминск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (625, NULL, N'Нарткала')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (626, NULL, N'Нарьян-Мар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (627, NULL, N'Находка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (628, NULL, N'Невель')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (629, NULL, N'Невельск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (630, NULL, N'Невинномысск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (631, NULL, N'Невьянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (632, NULL, N'Нелидово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (633, NULL, N'Неман')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (634, NULL, N'Нерехта')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (635, NULL, N'Нерчинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (636, NULL, N'Нерюнгри')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (637, NULL, N'Нестеров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (638, NULL, N'Нефтегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (639, NULL, N'Нефтекамск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (640, NULL, N'Нефтекумск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (641, NULL, N'Нефтеюганск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (642, NULL, N'Нея')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (643, NULL, N'Нижневартовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (644, NULL, N'Нижнекамск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (645, NULL, N'Нижнеудинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (646, NULL, N'Нижние Серги')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (647, NULL, N'Нижний Ломов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (648, NULL, N'Нижний Новгород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (649, NULL, N'Нижний Тагил')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (650, NULL, N'Нижняя Салда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (651, NULL, N'Нижняя Тура')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (652, NULL, N'Николаевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (653, NULL, N'Николаевск-на-Амуре')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (654, NULL, N'Никольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (655, NULL, N'Никольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (656, NULL, N'Никольское')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (657, NULL, N'Новая Ладога')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (658, NULL, N'Новая Ляля')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (659, NULL, N'Новоалександровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (660, NULL, N'Новоалтайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (661, NULL, N'Новоаннинский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (662, NULL, N'Нововоронеж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (663, NULL, N'Новодвинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (664, NULL, N'Новозыбков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (665, NULL, N'Новокубанск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (666, NULL, N'Новокузнецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (667, NULL, N'Новокуйбышевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (668, NULL, N'Новомичуринск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (669, NULL, N'Новомосковск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (670, NULL, N'Новопавловск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (671, NULL, N'Новоржев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (672, NULL, N'Новороссийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (673, NULL, N'Новосибирск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (674, NULL, N'Новосиль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (675, NULL, N'Новосокольники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (676, NULL, N'Новотроицк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (677, NULL, N'Новоузенск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (678, NULL, N'Новоульяновск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (679, NULL, N'Новоуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (680, NULL, N'Новохопёрск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (681, NULL, N'Новочебоксарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (682, NULL, N'Новочеркасск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (683, NULL, N'Новошахтинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (684, NULL, N'Новый Оскол')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (685, NULL, N'Новый Уренгой')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (686, NULL, N'Ногинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (687, NULL, N'Нолинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (688, NULL, N'Норильск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (689, NULL, N'Ноябрьск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (690, NULL, N'Нурлат')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (691, NULL, N'Нытва')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (692, NULL, N'Нюрба')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (693, NULL, N'Нягань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (694, NULL, N'Нязепетровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (695, NULL, N'Няндома')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (696, NULL, N'Облучье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (697, NULL, N'Обнинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (698, NULL, N'Обоянь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (699, NULL, N'Обь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (700, NULL, N'Одинцово')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (701, NULL, N'Озёрск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (702, NULL, N'Озёрск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (703, NULL, N'Озёры')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (704, NULL, N'Октябрьск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (705, NULL, N'Октябрьский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (706, NULL, N'Окуловка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (707, NULL, N'Олёкминск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (708, NULL, N'Оленегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (709, NULL, N'Олонец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (710, NULL, N'Омск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (711, NULL, N'Омутнинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (712, NULL, N'Онега')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (713, NULL, N'Опочка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (714, NULL, N'Орёл')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (715, NULL, N'Оренбург')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (716, NULL, N'Орехово-Зуево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (717, NULL, N'Орлов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (718, NULL, N'Орск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (719, NULL, N'Оса')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (720, NULL, N'Осинники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (721, NULL, N'Осташков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (722, NULL, N'Остров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (723, NULL, N'Островной')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (724, NULL, N'Острогожск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (725, NULL, N'Отрадное')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (726, NULL, N'Отрадный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (727, NULL, N'Оха')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (728, NULL, N'Оханск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (729, NULL, N'Очёр')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (730, NULL, N'Павлово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (731, NULL, N'Павловск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (732, NULL, N'Павловский Посад')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (733, NULL, N'Палласовка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (734, NULL, N'Партизанск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (735, NULL, N'Певек')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (736, NULL, N'Пенза')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (737, NULL, N'Первомайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (738, NULL, N'Первоуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (739, NULL, N'Перевоз')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (740, NULL, N'Пересвет')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (741, NULL, N'Переславль-Залесский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (742, NULL, N'Пермь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (743, NULL, N'Пестово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (744, NULL, N'Петров Вал')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (745, NULL, N'Петровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (746, NULL, N'Петровск-Забайкальский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (747, NULL, N'Петрозаводск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (748, NULL, N'Петропавловск-Камчатский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (749, NULL, N'Петухово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (750, NULL, N'Петушки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (751, NULL, N'Печора')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (752, NULL, N'Печоры')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (753, NULL, N'Пикалёво')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (754, NULL, N'Пионерский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (755, NULL, N'Питкяранта')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (756, NULL, N'Плавск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (757, NULL, N'Пласт')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (758, NULL, N'Плёс')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (759, NULL, N'Поворино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (760, NULL, N'Подольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (761, NULL, N'Подпорожье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (762, NULL, N'Покачи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (763, NULL, N'Покров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (764, NULL, N'Покровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (765, NULL, N'Полевской')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (766, NULL, N'Полесск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (767, NULL, N'Полысаево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (768, NULL, N'Полярные Зори')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (769, NULL, N'Полярный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (770, NULL, N'Поронайск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (771, NULL, N'Порхов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (772, NULL, N'Похвистнево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (773, NULL, N'Почеп')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (774, NULL, N'Починок')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (775, NULL, N'Пошехонье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (776, NULL, N'Правдинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (777, NULL, N'Приволжск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (778, NULL, N'Приморск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (779, NULL, N'Приморск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (780, NULL, N'Приморско-Ахтарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (781, NULL, N'Приозерск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (782, NULL, N'Прокопьевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (783, NULL, N'Пролетарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (784, NULL, N'Протвино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (785, NULL, N'Прохладный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (786, NULL, N'Псков')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (787, NULL, N'Пугачёв')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (788, NULL, N'Пудож')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (789, NULL, N'Пустошка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (790, NULL, N'Пучеж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (791, NULL, N'Пушкино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (792, NULL, N'Пущино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (793, NULL, N'Пыталово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (794, NULL, N'Пыть-Ях')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (795, NULL, N'Пятигорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (796, NULL, N'Радужный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (797, NULL, N'Радужный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (798, NULL, N'Райчихинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (799, NULL, N'Раменское')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (800, NULL, N'Рассказово')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (801, NULL, N'Ревда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (802, NULL, N'Реж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (803, NULL, N'Реутов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (804, NULL, N'Ржев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (805, NULL, N'Родники')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (806, NULL, N'Рославль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (807, NULL, N'Россошь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (808, NULL, N'Ростов-на-Дону')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (809, NULL, N'Ростов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (810, NULL, N'Рошаль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (811, NULL, N'Ртищево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (812, NULL, N'Рубцовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (813, NULL, N'Рудня')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (814, NULL, N'Руза')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (815, NULL, N'Рузаевка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (816, NULL, N'Рыбинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (817, NULL, N'Рыбное')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (818, NULL, N'Рыльск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (819, NULL, N'Ряжск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (820, NULL, N'Рязань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (821, NULL, N'Сакине призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (822, NULL, N'Салават')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (823, NULL, N'Салаир')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (824, NULL, N'Салехард')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (825, NULL, N'Сальск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (826, NULL, N'Самара')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (827, NULL, N'Санкт-Петербург')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (828, NULL, N'Саранск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (829, NULL, N'Сарапул')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (830, NULL, N'Саратов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (831, NULL, N'Саров')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (832, NULL, N'Сасово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (833, NULL, N'Сатка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (834, NULL, N'Сафоново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (835, NULL, N'Саяногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (836, NULL, N'Саянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (837, NULL, N'Светлогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (838, NULL, N'Светлоград')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (839, NULL, N'Светлый')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (840, NULL, N'Светогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (841, NULL, N'Свирск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (842, NULL, N'Свободный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (843, NULL, N'Себеж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (844, NULL, N'Севастопольне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (845, NULL, N'Северо-Курильск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (846, NULL, N'Северобайкальск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (847, NULL, N'Северодвинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (848, NULL, N'Североморск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (849, NULL, N'Североуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (850, NULL, N'Северск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (851, NULL, N'Севск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (852, NULL, N'Сегежа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (853, NULL, N'Сельцо')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (854, NULL, N'Семёнов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (855, NULL, N'Семикаракорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (856, NULL, N'Семилуки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (857, NULL, N'Сенгилей')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (858, NULL, N'Серафимович')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (859, NULL, N'Сергач')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (860, NULL, N'Сергиев Посад')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (861, NULL, N'Сердобск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (862, NULL, N'Серов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (863, NULL, N'Серпухов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (864, NULL, N'Сертолово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (865, NULL, N'Сибай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (866, NULL, N'Сим')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (867, NULL, N'Симферопольне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (868, NULL, N'Сковородино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (869, NULL, N'Скопин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (870, NULL, N'Славгород')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (871, NULL, N'Славск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (872, NULL, N'Славянск-на-Кубани')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (873, NULL, N'Сланцы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (874, NULL, N'Слободской')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (875, NULL, N'Слюдянка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (876, NULL, N'Смоленск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (877, NULL, N'Снежинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (878, NULL, N'Снежногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (879, NULL, N'Собинка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (880, NULL, N'Советск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (881, NULL, N'Советск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (882, NULL, N'Советск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (883, NULL, N'Советская Гавань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (884, NULL, N'Советский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (885, NULL, N'Сокол')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (886, NULL, N'Солигалич')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (887, NULL, N'Соликамск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (888, NULL, N'Солнечногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (889, NULL, N'Соль-Илецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (890, NULL, N'Сольвычегодск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (891, NULL, N'Сольцы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (892, NULL, N'Сорочинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (893, NULL, N'Сорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (894, NULL, N'Сортавала')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (895, NULL, N'Сосенский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (896, NULL, N'Сосновка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (897, NULL, N'Сосновоборск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (898, NULL, N'Сосновый Бор')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (899, NULL, N'Сосногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (900, NULL, N'Сочи')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (901, NULL, N'Спас-Деменск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (902, NULL, N'Спас-Клепики')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (903, NULL, N'Спасск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (904, NULL, N'Спасск-Дальний')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (905, NULL, N'Спасск-Рязанский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (906, NULL, N'Среднеколымск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (907, NULL, N'Среднеуральск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (908, NULL, N'Сретенск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (909, NULL, N'Ставрополь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (910, NULL, N'Старая Купавна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (911, NULL, N'Старая Русса')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (912, NULL, N'Старица')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (913, NULL, N'Стародуб')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (914, NULL, N'Старый Крымне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (915, NULL, N'Старый Оскол')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (916, NULL, N'Стерлитамак')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (917, NULL, N'Стрежевой')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (918, NULL, N'Строитель')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (919, NULL, N'Струнино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (920, NULL, N'Ступино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (921, NULL, N'Суворов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (922, NULL, N'Судакне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (923, NULL, N'Суджа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (924, NULL, N'Судогда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (925, NULL, N'Суздаль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (926, NULL, N'Сунжа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (927, NULL, N'Суоярви')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (928, NULL, N'Сураж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (929, NULL, N'Сургут')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (930, NULL, N'Суровикино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (931, NULL, N'Сурск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (932, NULL, N'Сусуман')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (933, NULL, N'Сухиничи')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (934, NULL, N'Сухой Лог')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (935, NULL, N'Сызрань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (936, NULL, N'Сыктывкар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (937, NULL, N'Сысерть')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (938, NULL, N'Сычёвка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (939, NULL, N'Сясьстрой')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (940, NULL, N'Тавда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (941, NULL, N'Таганрог')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (942, NULL, N'Тайга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (943, NULL, N'Тайшет')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (944, NULL, N'Талдом')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (945, NULL, N'Талица')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (946, NULL, N'Тамбов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (947, NULL, N'Тара')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (948, NULL, N'Тарко-Сале')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (949, NULL, N'Таруса')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (950, NULL, N'Татарск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (951, NULL, N'Таштагол')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (952, NULL, N'Тверь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (953, NULL, N'Теберда')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (954, NULL, N'Тейково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (955, NULL, N'Темников')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (956, NULL, N'Темрюк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (957, NULL, N'Терек')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (958, NULL, N'Тетюши')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (959, NULL, N'Тимашёвск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (960, NULL, N'Тихвин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (961, NULL, N'Тихорецк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (962, NULL, N'Тобольск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (963, NULL, N'Тогучин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (964, NULL, N'Тольятти')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (965, NULL, N'Томари')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (966, NULL, N'Томмот')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (967, NULL, N'Томск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (968, NULL, N'Топки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (969, NULL, N'Торжок')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (970, NULL, N'Торопец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (971, NULL, N'Тосно')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (972, NULL, N'Тотьма')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (973, NULL, N'Трёхгорный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (974, NULL, N'Троицк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (975, NULL, N'Трубчевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (976, NULL, N'Туапсе')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (977, NULL, N'Туймазы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (978, NULL, N'Тула')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (979, NULL, N'Тулун')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (980, NULL, N'Туран')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (981, NULL, N'Туринск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (982, NULL, N'Тутаев')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (983, NULL, N'Тында')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (984, NULL, N'Тырныауз')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (985, NULL, N'Тюкалинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (986, NULL, N'Тюмень')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (987, NULL, N'Уварово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (988, NULL, N'Углегорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (989, NULL, N'Углич')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (990, NULL, N'Удачный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (991, NULL, N'Удомля')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (992, NULL, N'Ужур')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (993, NULL, N'Узловая')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (994, NULL, N'Улан-Удэ')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (995, NULL, N'Ульяновск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (996, NULL, N'Унеча')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (997, NULL, N'Урай')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (998, NULL, N'Урень')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (999, NULL, N'Уржум')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1000, NULL, N'Урус-Мартан')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1001, NULL, N'Урюпинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1002, NULL, N'Усинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1003, NULL, N'Усмань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1004, NULL, N'Усолье-Сибирское')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1005, NULL, N'Усолье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1006, NULL, N'Уссурийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1007, NULL, N'Усть-Джегута')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1008, NULL, N'Усть-Илимск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1009, NULL, N'Усть-Катав')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1010, NULL, N'Усть-Кут')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1011, NULL, N'Усть-Лабинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1012, NULL, N'Устюжна')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1013, NULL, N'Уфа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1014, NULL, N'Ухта')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1015, NULL, N'Учалы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1016, NULL, N'Уяр')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1017, NULL, N'Фатеж')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1018, NULL, N'Феодосияне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1019, NULL, N'Фокино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1020, NULL, N'Фокино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1021, NULL, N'Фролово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1022, NULL, N'Фрязино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1023, NULL, N'Фурманов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1024, NULL, N'Хабаровск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1025, NULL, N'Хадыженск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1026, NULL, N'Ханты-Мансийск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1027, NULL, N'Харабали')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1028, NULL, N'Харовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1029, NULL, N'Хасавюрт')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1030, NULL, N'Хвалынск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1031, NULL, N'Хилок')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1032, NULL, N'Химки')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1033, NULL, N'Холм')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1034, NULL, N'Холмск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1035, NULL, N'Хотьково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1036, NULL, N'Цивильск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1037, NULL, N'Цимлянск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1038, NULL, N'Циолковский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1039, NULL, N'Чадан')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1040, NULL, N'Чайковский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1041, NULL, N'Чапаевск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1042, NULL, N'Чаплыгин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1043, NULL, N'Чебаркуль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1044, NULL, N'Чебоксары')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1045, NULL, N'Чегем')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1046, NULL, N'Чекалин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1047, NULL, N'Челябинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1048, NULL, N'Чердынь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1049, NULL, N'Черемхово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1050, NULL, N'Черепаново')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1051, NULL, N'Череповец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1052, NULL, N'Черкесск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1053, NULL, N'Чёрмоз')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1054, NULL, N'Черноголовка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1055, NULL, N'Черногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1056, NULL, N'Чернушка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1057, NULL, N'Черняховск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1058, NULL, N'Чехов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1059, NULL, N'Чистополь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1060, NULL, N'Чита')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1061, NULL, N'Чкаловск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1062, NULL, N'Чудово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1063, NULL, N'Чулым')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1064, NULL, N'Чусовой')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1065, NULL, N'Чухлома')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1066, NULL, N'Шагонар')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1067, NULL, N'Шадринск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1068, NULL, N'Шали')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1069, NULL, N'Шарыпово')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1070, NULL, N'Шарья')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1071, NULL, N'Шатура')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1072, NULL, N'Шахты')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1073, NULL, N'Шахунья')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1074, NULL, N'Шацк')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1075, NULL, N'Шебекино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1076, NULL, N'Шелехов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1077, NULL, N'Шенкурск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1078, NULL, N'Шилка')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1079, NULL, N'Шимановск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1080, NULL, N'Шиханы')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1081, NULL, N'Шлиссельбург')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1082, NULL, N'Шумерля')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1083, NULL, N'Шумиха')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1084, NULL, N'Шуя')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1085, NULL, N'Щёкино')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1086, NULL, N'Щёлкиноне призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1087, NULL, N'Щёлково')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1088, NULL, N'Щигры')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1089, NULL, N'Щучье')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1090, NULL, N'Электрогорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1091, NULL, N'Электросталь')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1092, NULL, N'Электроугли')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1093, NULL, N'Элиста')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1094, NULL, N'Энгельс')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1095, NULL, N'Эртиль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1096, NULL, N'Югорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1097, NULL, N'Южа')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1098, NULL, N'Южно-Сахалинск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1099, NULL, N'Южно-Сухокумск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1100, NULL, N'Южноуральск')
GO
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1101, NULL, N'Юрга')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1102, NULL, N'Юрьев-Польский')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1103, NULL, N'Юрьевец')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1104, NULL, N'Юрюзань')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1105, NULL, N'Юхнов')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1106, NULL, N'Ядрин')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1107, NULL, N'Якутск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1108, NULL, N'Ялтане призн.')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1109, NULL, N'Ялуторовск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1110, NULL, N'Янаул')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1111, NULL, N'Яранск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1112, NULL, N'Яровое')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1113, NULL, N'Ярославль')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1114, NULL, N'Ярцево')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1115, NULL, N'Ясногорск')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1116, NULL, N'Ясный')
INSERT [dbo].[city] ([id_city], [city_emblem], [city_name]) VALUES (1117, NULL, N'Яхрома')
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (1, N'Абхазия', N'Abkhazia', N'AB', 895)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (2, N'Австралия', N'Australia', N'AU', 36)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (3, N'Австрия', N'Austria', N'AT', 40)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (4, N'Азербайджан', N'Azerbaijan', N'AZ', 31)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (5, N'Албания', N'Albania', N'AL', 8)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (6, N'Алжир', N'Algeria', N'DZ', 12)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (7, N'Американское Самоа', N'American Samoa', N'AS', 16)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (8, N'Ангилья', N'Anguilla', N'AI', 660)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (9, N'Ангола', N'Angola', N'AO', 24)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (10, N'Андорра', N'Andorra', N'AD', 20)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (11, N'Антарктида', N'Antarctica', N'AQ', 10)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (12, N'Антигуа и Барбуда', N'Antigua and Barbuda', N'AG', 28)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (13, N'Аргентина', N'Argentina', N'AR', 32)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (14, N'Армения', N'Armenia', N'AM', 51)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (15, N'Аруба', N'Aruba', N'AW', 533)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (16, N'Афганистан', N'Afghanistan', N'AF', 4)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (17, N'Багамы', N'Bahamas', N'BS', 44)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (18, N'Бангладеш', N'Bangladesh', N'BD', 50)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (19, N'Барбадос', N'Barbados', N'BB', 52)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (20, N'Бахрейн', N'Bahrain', N'BH', 48)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (21, N'Беларусь', N'Belarus', N'BY', 112)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (22, N'Белиз', N'Belize', N'BZ', 84)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (23, N'Бельгия', N'Belgium', N'BE', 56)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (24, N'Бенин', N'Benin', N'BJ', 204)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (25, N'Бермуды', N'Bermuda', N'BM', 60)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (26, N'Болгария', N'Bulgaria', N'BG', 100)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (27, N'Боливия, Многонациональное Государство', N'Bolivia, plurinational state of', N'BO', 68)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (28, N'Бонайре, Саба и Синт-Эстатиус', N'Bonaire, Sint Eustatius and Saba', N'BQ', 535)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (29, N'Босния и Герцеговина', N'Bosnia and Herzegovina', N'BA', 70)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (30, N'Ботсвана', N'Botswana', N'BW', 72)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (31, N'Бразилия', N'Brazil', N'BR', 76)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (32, N'Британская территория в Индийском океане', N'British Indian Ocean Territory', N'IO', 86)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (33, N'Бруней-Даруссалам', N'Brunei Darussalam', N'BN', 96)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (34, N'Буркина-Фасо', N'Burkina Faso', N'BF', 854)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (35, N'Бурунди', N'Burundi', N'BI', 108)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (36, N'Бутан', N'Bhutan', N'BT', 64)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (37, N'Вануату', N'Vanuatu', N'VU', 548)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (38, N'Венгрия', N'Hungary', N'HU', 348)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (39, N'Венесуэла Боливарианская Республика', N'Venezuela', N'VE', 862)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (40, N'Виргинские острова, Британские', N'Virgin Islands, British', N'VG', 92)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (41, N'Виргинские острова, США', N'Virgin Islands, U.S.', N'VI', 850)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (42, N'Вьетнам', N'Vietnam', N'VN', 704)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (43, N'Габон', N'Gabon', N'GA', 266)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (44, N'Гаити', N'Haiti', N'HT', 332)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (45, N'Гайана', N'Guyana', N'GY', 328)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (46, N'Гамбия', N'Gambia', N'GM', 270)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (47, N'Гана', N'Ghana', N'GH', 288)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (48, N'Гваделупа', N'Guadeloupe', N'GP', 312)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (49, N'Гватемала', N'Guatemala', N'GT', 320)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (50, N'Гвинея', N'Guinea', N'GN', 324)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (51, N'Гвинея-Бисау', N'Guinea-Bissau', N'GW', 624)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (52, N'Германия', N'Germany', N'DE', 276)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (53, N'Гернси', N'Guernsey', N'GG', 831)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (54, N'Гибралтар', N'Gibraltar', N'GI', 292)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (55, N'Гондурас', N'Honduras', N'HN', 340)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (56, N'Гонконг', N'Hong Kong', N'HK', 344)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (57, N'Гренада', N'Grenada', N'GD', 308)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (58, N'Гренландия', N'Greenland', N'GL', 304)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (59, N'Греция', N'Greece', N'GR', 300)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (60, N'Грузия', N'Georgia', N'GE', 268)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (61, N'Гуам', N'Guam', N'GU', 316)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (62, N'Дания', N'Denmark', N'DK', 208)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (63, N'Джерси', N'Jersey', N'JE', 832)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (64, N'Джибути', N'Djibouti', N'DJ', 262)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (65, N'Доминика', N'Dominica', N'DM', 212)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (66, N'Доминиканская Республика', N'Dominican Republic', N'DO', 214)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (67, N'Египет', N'Egypt', N'EG', 818)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (68, N'Замбия', N'Zambia', N'ZM', 894)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (69, N'Западная Сахара', N'Western Sahara', N'EH', 732)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (70, N'Зимбабве', N'Zimbabwe', N'ZW', 716)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (71, N'Израиль', N'Israel', N'IL', 376)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (72, N'Индия', N'India', N'IN', 356)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (73, N'Индонезия', N'Indonesia', N'ID', 360)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (74, N'Иордания', N'Jordan', N'JO', 400)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (75, N'Ирак', N'Iraq', N'IQ', 368)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (76, N'Иран, Исламская Республика', N'Iran, Islamic Republic of', N'IR', 364)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (77, N'Ирландия', N'Ireland', N'IE', 372)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (78, N'Исландия', N'Iceland', N'IS', 352)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (79, N'Испания', N'Spain', N'ES', 724)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (80, N'Италия', N'Italy', N'IT', 380)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (81, N'Йемен', N'Yemen', N'YE', 887)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (82, N'Кабо-Верде', N'Cape Verde', N'CV', 132)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (83, N'Казахстан', N'Kazakhstan', N'KZ', 398)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (84, N'Камбоджа', N'Cambodia', N'KH', 116)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (85, N'Камерун', N'Cameroon', N'CM', 120)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (86, N'Канада', N'Canada', N'CA', 124)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (87, N'Катар', N'Qatar', N'QA', 634)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (88, N'Кения', N'Kenya', N'KE', 404)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (89, N'Кипр', N'Cyprus', N'CY', 196)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (90, N'Киргизия', N'Kyrgyzstan', N'KG', 417)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (91, N'Кирибати', N'Kiribati', N'KI', 296)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (92, N'Китай', N'China', N'CN', 156)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (93, N'Кокосовые (Килинг) острова', N'Cocos (Keeling) Islands', N'CC', 166)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (94, N'Колумбия', N'Colombia', N'CO', 170)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (95, N'Коморы', N'Comoros', N'KM', 174)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (96, N'Конго', N'Congo', N'CG', 178)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (97, N'Конго, Демократическая Республика', N'Congo, Democratic Republic of the', N'CD', 180)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (98, N'Корея, Народно-Демократическая Республика', N'Korea, Democratic People''s republic of', N'KP', 408)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (99, N'Корея, Республика', N'Korea, Republic of', N'KR', 410)
GO
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (100, N'Коста-Рика', N'Costa Rica', N'CR', 188)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (101, N'Кот д''Ивуар', N'Cote d''Ivoire', N'CI', 384)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (102, N'Куба', N'Cuba', N'CU', 192)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (103, N'Кувейт', N'Kuwait', N'KW', 414)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (104, N'Кюрасао', N'Curaçao', N'CW', 531)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (105, N'Лаос', N'Lao People''s Democratic Republic', N'LA', 418)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (106, N'Латвия', N'Latvia', N'LV', 428)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (107, N'Лесото', N'Lesotho', N'LS', 426)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (108, N'Ливан', N'Lebanon', N'LB', 422)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (109, N'Ливийская Арабская Джамахирия', N'Libyan Arab Jamahiriya', N'LY', 434)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (110, N'Либерия', N'Liberia', N'LR', 430)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (111, N'Лихтенштейн', N'Liechtenstein', N'LI', 438)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (112, N'Литва', N'Lithuania', N'LT', 440)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (113, N'Люксембург', N'Luxembourg', N'LU', 442)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (114, N'Маврикий', N'Mauritius', N'MU', 480)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (115, N'Мавритания', N'Mauritania', N'MR', 478)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (116, N'Мадагаскар', N'Madagascar', N'MG', 450)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (117, N'Майотта', N'Mayotte', N'YT', 175)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (118, N'Макао', N'Macao', N'MO', 446)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (119, N'Малави', N'Malawi', N'MW', 454)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (120, N'Малайзия', N'Malaysia', N'MY', 458)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (121, N'Мали', N'Mali', N'ML', 466)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (122, N'Малые Тихоокеанские отдаленные острова Соединенных Штатов', N'United States Minor Outlying Islands', N'UM', 581)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (123, N'Мальдивы', N'Maldives', N'MV', 462)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (124, N'Мальта', N'Malta', N'MT', 470)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (125, N'Марокко', N'Morocco', N'MA', 504)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (126, N'Мартиника', N'Martinique', N'MQ', 474)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (127, N'Маршалловы острова', N'Marshall Islands', N'MH', 584)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (128, N'Мексика', N'Mexico', N'MX', 484)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (129, N'Микронезия, Федеративные Штаты', N'Micronesia, Federated States of', N'FM', 583)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (130, N'Мозамбик', N'Mozambique', N'MZ', 508)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (131, N'Молдова, Республика', N'Moldova', N'MD', 498)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (132, N'Монако', N'Monaco', N'MC', 492)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (133, N'Монголия', N'Mongolia', N'MN', 496)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (134, N'Монтсеррат', N'Montserrat', N'MS', 500)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (135, N'Мьянма', N'Myanmar', N'MM', 104)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (136, N'Намибия', N'Namibia', N'NA', 516)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (137, N'Науру', N'Nauru', N'NR', 520)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (138, N'Непал', N'Nepal', N'NP', 524)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (139, N'Нигер', N'Niger', N'NE', 562)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (140, N'Нигерия', N'Nigeria', N'NG', 566)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (141, N'Нидерланды', N'Netherlands', N'NL', 528)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (142, N'Никарагуа', N'Nicaragua', N'NI', 558)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (143, N'Ниуэ', N'Niue', N'NU', 570)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (144, N'Новая Зеландия', N'New Zealand', N'NZ', 554)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (145, N'Новая Каледония', N'New Caledonia', N'NC', 540)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (146, N'Норвегия', N'Norway', N'NO', 578)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (147, N'Объединенные Арабские Эмираты', N'United Arab Emirates', N'AE', 784)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (148, N'Оман', N'Oman', N'OM', 512)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (149, N'Остров Буве', N'Bouvet Island', N'BV', 74)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (150, N'Остров Мэн', N'Isle of Man', N'IM', 833)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (151, N'Остров Норфолк', N'Norfolk Island', N'NF', 574)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (152, N'Остров Рождества', N'Christmas Island', N'CX', 162)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (153, N'Остров Херд и острова Макдональд', N'Heard Island and McDonald Islands', N'HM', 334)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (154, N'Острова Кайман', N'Cayman Islands', N'KY', 136)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (155, N'Острова Кука', N'Cook Islands', N'CK', 184)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (156, N'Острова Теркс и Кайкос', N'Turks and Caicos Islands', N'TC', 796)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (157, N'Пакистан', N'Pakistan', N'PK', 586)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (158, N'Палау', N'Palau', N'PW', 585)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (159, N'Палестинская территория, оккупированная', N'Palestinian Territory, Occupied', N'PS', 275)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (160, N'Панама', N'Panama', N'PA', 591)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (161, N'Папский Престол (Государство — город Ватикан)', N'Holy See (Vatican City State)', N'VA', 336)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (162, N'Папуа-Новая Гвинея', N'Papua New Guinea', N'PG', 598)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (163, N'Парагвай', N'Paraguay', N'PY', 600)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (164, N'Перу', N'Peru', N'PE', 604)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (165, N'Питкерн', N'Pitcairn', N'PN', 612)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (166, N'Польша', N'Poland', N'PL', 616)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (167, N'Португалия', N'Portugal', N'PT', 620)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (168, N'Пуэрто-Рико', N'Puerto Rico', N'PR', 630)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (169, N'Республика Македония', N'Macedonia, The Former Yugoslav Republic Of', N'MK', 807)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (170, N'Реюньон', N'Reunion', N'RE', 638)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (171, N'Россия', N'Russian Federation', N'RU', 643)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (172, N'Руанда', N'Rwanda', N'RW', 646)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (173, N'Румыния', N'Romania', N'RO', 642)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (174, N'Самоа', N'Samoa', N'WS', 882)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (175, N'Сан-Марино', N'San Marino', N'SM', 674)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (176, N'Сан-Томе и Принсипи', N'Sao Tome and Principe', N'ST', 678)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (177, N'Саудовская Аравия', N'Saudi Arabia', N'SA', 682)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (178, N'Свазиленд', N'Swaziland', N'SZ', 748)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (179, N'Святая Елена, Остров вознесения, Тристан-да-Кунья', N'Saint Helena, Ascension And Tristan Da Cunha', N'SH', 654)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (180, N'Северные Марианские острова', N'Northern Mariana Islands', N'MP', 580)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (181, N'Сен-Бартельми', N'Saint Barthélemy', N'BL', 652)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (182, N'Сен-Мартен', N'Saint Martin (French Part)', N'MF', 663)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (183, N'Сенегал', N'Senegal', N'SN', 686)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (184, N'Сент-Винсент и Гренадины', N'Saint Vincent and the Grenadines', N'VC', 670)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (185, N'Сент-Люсия', N'Saint Lucia', N'LC', 662)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (186, N'Сент-Китс и Невис', N'Saint Kitts and Nevis', N'KN', 659)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (187, N'Сент-Пьер и Микелон', N'Saint Pierre and Miquelon', N'PM', 666)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (188, N'Сербия', N'Serbia', N'RS', 688)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (189, N'Сейшелы', N'Seychelles', N'SC', 690)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (190, N'Сингапур', N'Singapore', N'SG', 702)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (191, N'Синт-Мартен', N'Sint Maarten', N'SX', 534)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (192, N'Сирийская Арабская Республика', N'Syrian Arab Republic', N'SY', 760)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (193, N'Словакия', N'Slovakia', N'SK', 703)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (194, N'Словения', N'Slovenia', N'SI', 705)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (195, N'Соединенное Королевство', N'United Kingdom', N'GB', 826)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (196, N'Соединенные Штаты', N'United States', N'US', 840)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (197, N'Соломоновы острова', N'Solomon Islands', N'SB', 90)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (198, N'Сомали', N'Somalia', N'SO', 706)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (199, N'Судан', N'Sudan', N'SD', 729)
GO
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (200, N'Суринам', N'Suriname', N'SR', 740)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (201, N'Сьерра-Леоне', N'Sierra Leone', N'SL', 694)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (202, N'Таджикистан', N'Tajikistan', N'TJ', 762)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (203, N'Таиланд', N'Thailand', N'TH', 764)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (204, N'Тайвань (Китай)', N'Taiwan, Province of China', N'TW', 158)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (205, N'Танзания, Объединенная Республика', N'Tanzania, United Republic Of', N'TZ', 834)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (206, N'Тимор-Лесте', N'Timor-Leste', N'TL', 626)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (207, N'Того', N'Togo', N'TG', 768)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (208, N'Токелау', N'Tokelau', N'TK', 772)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (209, N'Тонга', N'Tonga', N'TO', 776)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (210, N'Тринидад и Тобаго', N'Trinidad and Tobago', N'TT', 780)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (211, N'Тувалу', N'Tuvalu', N'TV', 798)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (212, N'Тунис', N'Tunisia', N'TN', 788)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (213, N'Туркмения', N'Turkmenistan', N'TM', 795)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (214, N'Турция', N'Turkey', N'TR', 792)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (215, N'Уганда', N'Uganda', N'UG', 800)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (216, N'Узбекистан', N'Uzbekistan', N'UZ', 860)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (217, N'Украина', N'Ukraine', N'UA', 804)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (218, N'Уоллис и Футуна', N'Wallis and Futuna', N'WF', 876)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (219, N'Уругвай', N'Uruguay', N'UY', 858)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (220, N'Фарерские острова', N'Faroe Islands', N'FO', 234)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (221, N'Фиджи', N'Fiji', N'FJ', 242)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (222, N'Филиппины', N'Philippines', N'PH', 608)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (223, N'Финляндия', N'Finland', N'FI', 246)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (224, N'Фолклендские острова (Мальвинские)', N'Falkland Islands (Malvinas)', N'FK', 238)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (225, N'Франция', N'France', N'FR', 250)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (226, N'Французская Гвиана', N'French Guiana', N'GF', 254)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (227, N'Французская Полинезия', N'French Polynesia', N'PF', 258)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (228, N'Французские Южные территории', N'French Southern Territories', N'TF', 260)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (229, N'Хорватия', N'Croatia', N'HR', 191)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (230, N'Центрально-Африканская Республика', N'Central African Republic', N'CF', 140)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (231, N'Чад', N'Chad', N'TD', 148)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (232, N'Черногория', N'Montenegro', N'ME', 499)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (233, N'Чешская Республика', N'Czech Republic', N'CZ', 203)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (234, N'Чили', N'Chile', N'CL', 152)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (235, N'Швейцария', N'Switzerland', N'CH', 756)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (236, N'Швеция', N'Sweden', N'SE', 752)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (237, N'Шпицберген и Ян Майен', N'Svalbard and Jan Mayen', N'SJ', 744)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (238, N'Шри-Ланка', N'Sri Lanka', N'LK', 144)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (239, N'Эквадор', N'Ecuador', N'EC', 218)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (240, N'Экваториальная Гвинея', N'Equatorial Guinea', N'GQ', 226)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (241, N'Эландские острова', N'Åland Islands', N'AX', 248)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (242, N'Эль-Сальвадор', N'El Salvador', N'SV', 222)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (243, N'Эритрея', N'Eritrea', N'ER', 232)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (244, N'Эстония', N'Estonia', N'EE', 233)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (245, N'Эфиопия', N'Ethiopia', N'ET', 231)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (246, N'Южная Африка', N'South Africa', N'ZA', 710)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (247, N'Южная Джорджия и Южные Сандвичевы острова', N'South Georgia and the South Sandwich Islands', N'GS', 239)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (248, N'Южная Осетия', N'South Ossetia', N'OS', 896)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (249, N'Южный Судан', N'South Sudan', N'SS', 728)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (250, N'Ямайка', N'Jamaica', N'JM', 388)
INSERT [dbo].[country] ([id_country], [country_name], [country_eng_name], [country_code], [country_code2]) VALUES (251, N'Япония', N'Japan', N'JP', 392)
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[direction_m] ON 

INSERT [dbo].[direction_m] ([id_direction_m], [direction_m_name]) VALUES (1, N'Аналитика')
INSERT [dbo].[direction_m] ([id_direction_m], [direction_m_name]) VALUES (2, N'Биг Дата')
INSERT [dbo].[direction_m] ([id_direction_m], [direction_m_name]) VALUES (3, N'Дизайн')
INSERT [dbo].[direction_m] ([id_direction_m], [direction_m_name]) VALUES (4, N'Информационная безопасность')
INSERT [dbo].[direction_m] ([id_direction_m], [direction_m_name]) VALUES (5, N'ИТ')
SET IDENTITY_INSERT [dbo].[direction_m] OFF
GO
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (1, N'Всероссийский хакатон neuromedia 2017 по разработке продуктов на стыке информационных технологий, медиа и нейронных сетей ', CAST(N'2022-10-26' AS Date), 1, 34)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (2, N'Встреча #3 клуба ITBizRadio на тему:  «уборка» — выкидываем ненужные навыки, инструменты и ограничения» ', CAST(N'2022-07-14' AS Date), 3, 34)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (3, N'Встреча клуба «Leader stories»: Мотивирующее руководство ', CAST(N'2023-11-09' AS Date), 2, 2)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (4, N'Встреча клуба руководителей «Leader Stories»: Постановка целей команде ', CAST(N'2023-07-06' AS Date), 2, 66)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (5, N'Быстрее, выше, сильнее: как спорт помогает бизнесу и корпорациям ', CAST(N'2023-04-13' AS Date), 3, 4)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (6, N'Встреча клуба Leader Stories «Мотивирующее руководство» ', CAST(N'2022-02-20' AS Date), 3, 76)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (7, N'Встреча клуба Leader Stories в формате настольной трансформационной коучинговой игры «УниверсУм» ', CAST(N'2023-10-10' AS Date), 2, 78)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (8, N'Встреча пользователей PTV в России ', CAST(N'2022-04-16' AS Date), 3, 50)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (9, N'Встреча сообщества CocoaHeads Russia ', CAST(N'2023-07-01' AS Date), 3, 78)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (10, N'Встреча СПб СоА 16 апреля. Репетиция докладов к Analyst Days ', CAST(N'2022-10-18' AS Date), 1, 78)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (11, N'Встреча JUG.ru с Венкатом Субраманиамом — Design Patterns in the Light of Lambda Expressions ', CAST(N'2023-08-26' AS Date), 1, 56)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (12, N'Встреча №3 HR-клуба Моего круга ', CAST(N'2022-11-27' AS Date), 1, 45)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (13, N'Встреча №4 HR-клуба «Моего круга» ', CAST(N'2023-10-31' AS Date), 2, 78)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (14, N'Встреча SPb Python Community ', CAST(N'2022-07-02' AS Date), 3, 9)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (15, N'Встреча SpbDotNet №36 ', CAST(N'2022-10-14' AS Date), 3, 8)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (16, N'Встреча SpbDotNet №40 ', CAST(N'2023-05-08' AS Date), 2, 23)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (17, N'Встреча SpbDotNet №44 ', CAST(N'2022-05-10' AS Date), 2, 56)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (18, N'Вторая международная конференция и выставка «ЦОД: модели, сервисы, инфраструктура - 2018» ', CAST(N'2022-03-03' AS Date), 2, 33)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (19, N'Выбор и создание методов решения аналитических задач ', CAST(N'2023-09-13' AS Date), 2, 22)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (20, N'Выгорание: от бесплатного печенья до депрессии ', CAST(N'2023-11-11' AS Date), 3, 4)
INSERT [dbo].[event] ([id_event], [event_name], [event_date], [event_days], [event_city]) VALUES (21, N'Вторая международная конференция и выставка «ЦОД: модели, сервисы, инфраструктура - 2018» ', CAST(N'2023-12-22' AS Date), 3, 16)
GO
SET IDENTITY_INSERT [dbo].[event_m] ON 

INSERT [dbo].[event_m] ([id_event_m], [event_m_name]) VALUES (1, N'IT в бизнесе')
INSERT [dbo].[event_m] ([id_event_m], [event_m_name]) VALUES (2, N'IT-инфраструктура')
INSERT [dbo].[event_m] ([id_event_m], [event_m_name]) VALUES (3, N'Информационная безопасность')
INSERT [dbo].[event_m] ([id_event_m], [event_m_name]) VALUES (4, N'Разработка приложений')
INSERT [dbo].[event_m] ([id_event_m], [event_m_name]) VALUES (5, N'Стартапы')
SET IDENTITY_INSERT [dbo].[event_m] OFF
GO
SET IDENTITY_INSERT [dbo].[people] ON 

INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (1, 2, N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'foto9.jpg', N'женский     ', 5, 1)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (2, 2, N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'foto10.jpg', N'мужской     ', 5, 1)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (3, 2, N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'foto8.jpg', N'женский     ', 2, 4)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (4, 2, N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'foto11.jpg', N'мужской     ', 3, 2)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (5, 2, N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'foto12.jpg', N'мужской     ', 2, 4)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (6, 2, N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'foto13.jpg', N'мужской     ', 1, 5)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (7, 2, N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'foto14.jpg', N'женский     ', 5, 1)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (8, 2, N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'foto16.jpg', N'женский     ', 4, 3)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (9, 2, N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'foto17.jpg', N'женский     ', 2, 4)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (10, 2, N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'foto18.jpg', N'женский     ', 1, 5)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (11, 2, N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'foto19.jpg', N'мужской     ', 1, 5)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (12, 2, N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'foto20.jpg', N'мужской     ', 4, 3)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (13, 2, N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'foto21.jpg', N'мужской     ', 3, 2)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (14, 2, N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'foto22.jpg', N'мужской     ', 3, 2)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (15, 2, N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'foto23.jpg', N'женский     ', 3, 2)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (16, 2, N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'foto24.jpg', N'женский     ', 4, 3)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (17, 2, N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'foto25.jpg', N'женский     ', 4, 3)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (18, 2, N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'foto26.jpg', N'мужской     ', 2, 4)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (19, 2, N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'foto27.jpg', N'мужской     ', 1, 5)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (20, 2, N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'foto28.jpg', N'женский     ', 4, 3)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (21, 2, N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'foto29.jpg', N'мужской     ', 2, 4)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (22, 1, N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', N'foto1.jpg', N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (23, 1, N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 13, N'+7(765)-629-25-01', N'Tj78jXeH68', N'foto2.jpg', N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (24, 1, N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', N'foto3.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (25, 1, N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', N'foto4.jpg', N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (26, 1, N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', N'foto5.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (27, 1, N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', N'foto6.jpg', N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (28, 1, N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', N'foto7.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (29, 1, N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', N'foto8.jpg', N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (30, 1, N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', N'foto9.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (31, 1, N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', N'foto10.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (32, 3, N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'9.60424e+009', N'tKKevv8%', N'foto60.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (33, 3, N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'9.30662e+009', N'huSfHm4$', N'foto61.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (34, 3, N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'9.57266e+009', N'TlUwMw77%', N'foto62.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (35, 3, N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'9.11744e+009', N'%afF#@6', N'foto63.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (36, 3, N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'9.84878e+009', N'SU4Jpw"', N'foto64.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (37, 3, N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'9.405e+009', N'wL#O0V', N'foto65.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (38, 3, N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'9.56057e+009', N'p5r{zY', N'foto66.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (39, 3, N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'9.65493e+009', N'wTVK~M1', N'foto67.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (40, 3, N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'9.9733e+009', N'8*Zfaj', N'foto68.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (41, 3, N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'9.64572e+009', N'4sBGr*', N'foto69.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (42, 3, N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'9.18419e+009', N'BpC8e8]', N'foto70.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (43, 3, N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'9.18414e+008', N'cI1CTd', N'foto1.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (44, 3, N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'9.18418e+009', N'MPmfYk', N'foto2.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (45, 3, N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'9.18419e+010', N'omtSW3', N'foto3.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (46, 3, N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'9.18418e+009', N'cErGgC', N'foto4.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (47, 3, N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'9.18418e+009', N'q2se3v', N'foto5.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (48, 3, N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'9.18418e+009', N'KnqfAk', N'foto6.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (49, 3, N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'9.18418e+009', N'6YxPwE', N'foto7.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (50, 3, N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-10-30' AS Date), 54, N'9.18419e+009', N'pBQpPx', N'foto8.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (51, 3, N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'9.18239e+009', N'FkX6Ms', N'foto9.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (52, 4, N'Галкина Верона Васильевна', N'obuckridge@sipes.com', CAST(N'1969-05-18' AS Date), 35, N'7(880)544-61-83', N'HHikbP', N'foto21.jpg', N'женский     ', 3, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (53, 4, N'Герасимова Айлин Ефимовна', N'loraine.aufderhar@johnston.info', CAST(N'1966-06-09' AS Date), 53, N'7(835)478-61-60', N'TuhRzy', N'foto22.jpg', N'женский     ', 3, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (54, 4, N'Большаков Августин Алексеевич', N'juanita.kuvalis@yahoo.com', CAST(N'1978-07-12' AS Date), 52, N'7(173)770-55-13', N'4Y83lz', N'foto23.jpg', N'мужской     ', 5, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (55, 4, N'Морозов Ким Демьянович', N'ibode@lebsack.com', CAST(N'1981-10-11' AS Date), 67, N'7(518)761-85-69', N'z0q7Co', N'foto24.jpg', N'мужской     ', 5, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (56, 4, N'Кошелев Лука Артёмович', N'lilly.rodriguez@yahoo.com', CAST(N'1995-05-30' AS Date), 81, N'7(375)644-35-80', N'uB8I2Z', N'foto25.jpg', N'мужской     ', 5, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (57, 4, N'Ларионова Марина Владимировна', N'sandrine84@gmail.com', CAST(N'1950-06-06' AS Date), 94, N'7(521)121-28-90', N'o7Cjwu', N'foto26.jpg', N'женский     ', 5, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (58, 4, N'Маслова Марфа Феликсовна', N'pearlie.watsica@wintheiser.com', CAST(N'1997-11-22' AS Date), 52, N'7(615)741-11-77', N'zC4bi7', N'foto27.jpg', N'женский     ', 2, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (59, 4, N'Гришин Вениамин Петрович', N'kaela97@hotmail.com', CAST(N'1954-10-15' AS Date), 72, N'7(420)788-04-09', N'ubeQbm', N'foto28.jpg', N'мужской     ', 4, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (60, 4, N'Гришин Владислав Аркадьевич', N'gino.baumbach@gmail.com', CAST(N'1950-08-31' AS Date), 34, N'7(207)088-79-39', N'16BLjl', N'foto29.jpg', N'мужской     ', 5, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (61, 4, N'Корнилова Габи Георгьевна', N'deja76@mante.info', CAST(N'1962-12-26' AS Date), 64, N'7(809)651-85-96', N'XLleqI', N'foto30.jpg', N'женский     ', 4, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (62, 4, N'test', N'test@mail.ru', CAST(N'2000-01-01' AS Date), 1, N'+7(   )-   -  -', N'tewSb#4', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (63, 4, N'test', N'test@mail.ru', CAST(N'2000-01-01' AS Date), 1, N'+7(958)-965-76-57', N'test@$!S4', NULL, N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (64, 4, N'TEST', N'test@mail.ru', CAST(N'2000-01-01' AS Date), 19, N'+7(864)-756-53-63', N'narS!m213AA', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (65, 2, N'testm', N'tesm@mail.ru', CAST(N'2000-01-01' AS Date), 22, N'+7(965)-742-52-52', N'M7sx4@', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (66, 2, N'test', N'testm@mail.ru', CAST(N'2000-01-01' AS Date), 23, N'+7(753)-736-34-65', N'ntwet2zAx!', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (67, 2, N'test', N'test@mail.ru', CAST(N'2000-01-01' AS Date), 1, N'+7(643)-643-63-64', N'twm6!S', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (68, 4, N'Тестжюри', N'jurytest@rambler.ru', CAST(N'2005-04-01' AS Date), 22, N'+7(875)-474-42-12', N'jury!3dsaM', N'foto10.jpg', N'женский     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (69, 4, N'jurytest', N'jurytest@gmail.com', CAST(N'2005-01-01' AS Date), 24, N'+7(895)-321-34-33', N'tntS@b2', NULL, N'мужской     ', NULL, NULL)
INSERT [dbo].[people] ([id_people], [people_role], [people_fio], [people_post], [people_dob], [people_country], [people_phone], [people_pass], [people_photo], [people_gender], [people_direction], [people_event]) VALUES (70, 2, N'Анатолий Артемьев Евгеньевич', N'anatoly1966lesru@rambler.ru', CAST(N'1966-05-23' AS Date), 171, N'+7(997)-645-65-44', N'StrongPass1966@', N'foto24.jpg', N'мужской     ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[people] OFF
GO
SET IDENTITY_INSERT [dbo].[role_m] ON 

INSERT [dbo].[role_m] ([id_role_m], [role_m_name]) VALUES (1, N'организатор')
INSERT [dbo].[role_m] ([id_role_m], [role_m_name]) VALUES (2, N'модератор')
INSERT [dbo].[role_m] ([id_role_m], [role_m_name]) VALUES (3, N'участник')
INSERT [dbo].[role_m] ([id_role_m], [role_m_name]) VALUES (4, N'жюри')
SET IDENTITY_INSERT [dbo].[role_m] OFF
GO
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (1, N'Встреча клуба «Leader stories»: Мотивирующее руководство ', CAST(N'2023-11-09T00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ершова Нора Федотовна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Лидерство в бизнесе', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Царева Виктория Давидовна', N'Галкина Верона Васильевна', NULL, N'Маслова Марфа Феликсовна', N'Ларионова Марина Владимировна', N'Ларионова Марина Владимировна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Технология принятия решений', 2, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Зорин Дмитрий Маркович', N'Герасимова Айлин Ефимовна', N'Большаков Августин Алексеевич', N'Гришин Вениамин Петрович', N'Маслова Марфа Феликсовна', N'Маслова Марфа Феликсовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Искусство коучинга', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Зотова Анна Тимуровна', N'Большаков Августин Алексеевич', N'Морозов Ким Демьянович', NULL, N'Гришин Вениамин Петрович', N'Гришин Вениамин Петрович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (2, N'Быстрее, выше, сильнее: как спорт помогает бизнесу и корпорациям ', CAST(N'2023-04-13T00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Афанасьева Жанна Валентиновна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Переговоры от "А" до "Я"', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Соловьев Тимур Константинович', NULL, N'Ларионова Марина Владимировна', N'Морозов Ким Демьянович', N'Герасимова Айлин Ефимовна', N'Кошелев Лука Артёмович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Телефонные переговоры', 2, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Малахов Александр Фёдорович', N'Большаков Августин Алексеевич', N'Маслова Марфа Феликсовна', N'Кошелев Лука Артёмович', N'Большаков Августин Алексеевич', N'Ларионова Марина Владимировна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Навыки подготовки', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Зорин Марк Ярославович', N'Морозов Ким Демьянович', N'Гришин Вениамин Петрович', NULL, NULL, N'Маслова Марфа Феликсовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (3, N'Встреча пользователей PTV в России ', CAST(N'2022-04-16T00:00:00.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Крылова Рая Всеволодовна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Новые продукты и версии', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Егорова Ева Михайловна', N'Кошелев Лука Артёмович', N'Галкина Верона Васильевна', N'Маслова Марфа Феликсовна', N'Ларионова Марина Владимировна', N'Кошелев Лука Артёмович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Big Data', 2, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Гущина Кристина Львовна', N'Ларионова Марина Владимировна', N'Герасимова Айлин Ефимовна', N'Гришин Вениамин Петрович', N'Маслова Марфа Феликсовна', N'Ларионова Марина Владимировна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Must Have 21 века', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Кудрявцева Виктория Романовна', NULL, N'Большаков Августин Алексеевич', NULL, N'Гришин Вениамин Петрович', N'Маслова Марфа Феликсовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (4, N'Встреча СПб СоА 16 апреля. Репетиция докладов к Analyst Days ', CAST(N'2022-10-18T00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Попова Вида Тимофеевна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Управление знаниями', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Новикова Александра Александровна', NULL, NULL, N'Морозов Ким Демьянович', N'Кошелев Лука Артёмович', N'Ларионова Марина Владимировна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Коммуникативные неудачи', 1, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Масленников Родион Филиппович', N'Кошелев Лука Артёмович', N'Маслова Марфа Феликсовна', N'Кошелев Лука Артёмович', N'Ларионова Марина Владимировна', N'Маслова Марфа Феликсовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Дизайн-мышление', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Иванов Тимур Иванович', N'Ларионова Марина Владимировна', N'Гришин Вениамин Петрович', NULL, N'Маслова Марфа Феликсовна', NULL, NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (5, N'Встреча №3 HR-клуба Моего круга ', CAST(N'2022-11-27T00:00:00.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Давыдова Сандра Богуславовна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Технические собеседования', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Иванов Сергей Степанович', N'Галкина Верона Васильевна', NULL, N'Ларионова Марина Владимировна', N'Гришин Владислав Аркадьевич', N'Герасимова Айлин Ефимовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Исследование рынка', 2, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Спиридонов Ярослав Сергеевич', N'Герасимова Айлин Ефимовна', N'Маслова Марфа Феликсовна', N'Маслова Марфа Феликсовна', N'Корнилова Габи Георгьевна', N'Большаков Августин Алексеевич', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Рекрутинг', 3, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Виноградова Эмилия Валерьевна', N'Большаков Августин Алексеевич', N'Гришин Вениамин Петрович', N'Гришин Вениамин Петрович', NULL, N'Морозов Ким Демьянович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (6, N'Встреча №4 HR-клуба «Моего круга» ', CAST(N'2023-10-31T00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Прохорова Сабина Созоновна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Kanban', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Мартынова Ева Семёновна', NULL, N'Маслова Марфа Феликсовна', N'Ларионова Марина Владимировна', N'Галкина Верона Васильевна', N'Герасимова Айлин Ефимовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Способы поиска специалистов', 1, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Яковлева Анисия Григорьевна', N'Кошелев Лука Артёмович', N'Гришин Вениамин Петрович', N'Маслова Марфа Феликсовна', N'Герасимова Айлин Ефимовна', N'Большаков Августин Алексеевич', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Роли HR', 1, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Свиридов Тимофей Александрович', N'Ларионова Марина Владимировна', N'Гришин Владислав Аркадьевич', N'Гришин Вениамин Петрович', N'Большаков Августин Алексеевич', N'Морозов Ким Демьянович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (7, N'Встреча SPb Python Community ', CAST(N'2022-07-02T00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Громова Сильва Адольфовна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Осознанность личных целей', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Медведев Захар Даниилович', N'Морозов Ким Демьянович', N'Морозов Ким Демьянович', NULL, NULL, NULL, NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Soft skills', 1, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Тихонова Елизавета Александровна', N'Кошелев Лука Артёмович', N'Кошелев Лука Артёмович', N'Ларионова Марина Владимировна', N'Герасимова Айлин Ефимовна', N'Гришин Владислав Аркадьевич', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Развитие проактивности', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Рыжов Роман Константинович', N'Ларионова Марина Владимировна', NULL, N'Маслова Марфа Феликсовна', N'Большаков Августин Алексеевич', N'Корнилова Габи Георгьевна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (8, N'Встреча SpbDotNet №36 ', CAST(N'2022-10-14T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Фокина Алия Юлиановна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Введение в IT-субкультуру', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Иванов Тимур Иванович', N'Маслова Марфа Феликсовна', NULL, N'Морозов Ким Демьянович', N'Гришин Владислав Аркадьевич', N'Кошелев Лука Артёмович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Управление знаниями', 1, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Иванов Сергей Степанович', N'Гришин Вениамин Петрович', NULL, N'Кошелев Лука Артёмович', N'Корнилова Габи Георгьевна', N'Ларионова Марина Владимировна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Развитие проактивности', 1, CAST(N'1899-12-30T16:00:00.000' AS DateTime), N'Спиридонов Ярослав Сергеевич', N'Гришин Владислав Аркадьевич', N'Ларионова Марина Владимировна', NULL, NULL, N'Маслова Марфа Феликсовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (9, N'Встреча SpbDotNet №40 ', CAST(N'2023-05-08T00:00:00.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Горшкова Дина Тарасовна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Идельный результат', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Яковлева Анисия Григорьевна', N'Герасимова Айлин Ефимовна', N'Гришин Вениамин Петрович', N'Ларионова Марина Владимировна', NULL, N'Герасимова Айлин Ефимовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Тайны и секреты', 2, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Свиридов Тимофей Александрович', N'Большаков Августин Алексеевич', NULL, N'Маслова Марфа Феликсовна', N'Гришин Владислав Аркадьевич', N'Большаков Августин Алексеевич', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Рычаги', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Медведев Захар Даниилович', NULL, NULL, N'Гришин Вениамин Петрович', N'Корнилова Габи Георгьевна', N'Морозов Ким Демьянович', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (10, N'Выбор и создание методов решения аналитических задач ', CAST(N'2023-09-13T00:00:00.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Бурова Келен Натановна')
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Войти в ТОП', 1, CAST(N'1899-12-30T09:00:00.000' AS DateTime), N'Зотова Анна Тимуровна', N'Маслова Марфа Феликсовна', N'Морозов Ким Демьянович', NULL, N'Кошелев Лука Артёмович', N'Герасимова Айлин Ефимовна', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Секреты продвижения', 1, CAST(N'1899-12-30T10:45:00.000' AS DateTime), N'Соловьев Тимур Константинович', N'Гришин Вениамин Петрович', N'Кошелев Лука Артёмович', N'Гришин Владислав Аркадьевич', N'Ларионова Марина Владимировна', N'Большаков Августин Алексеевич', NULL)
INSERT [dbo].[Активности_import] ([№], [Наименование мероприятия], [Дата начала], [Дни], [Активность], [День], [Время начала], [Модератор], [Жюри 1], [Жюри 2], [Жюри 3], [Жюри 4], [Жюри 5], [Победитель]) VALUES (NULL, NULL, NULL, NULL, N'Руководство проектами', 2, CAST(N'1899-12-30T12:30:00.000' AS DateTime), N'Малахов Александр Фёдорович', N'Гришин Владислав Аркадьевич', NULL, N'Корнилова Габи Георгьевна', N'Маслова Марфа Феликсовна', N'Морозов Ким Демьянович', NULL)
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1, NULL, N'Абаза')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (2, NULL, N'Абакан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (3, NULL, N'Абдулино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (4, NULL, N'Абинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (5, NULL, N'Агидель')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (6, NULL, N'Агрыз')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (7, NULL, N'Адыгейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (8, NULL, N'Азнакаево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (9, NULL, N'Азов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (10, NULL, N'Ак-Довурак')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (11, NULL, N'Аксай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (12, NULL, N'Алагир')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (13, NULL, N'Алапаевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (14, NULL, N'Алатырь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (15, NULL, N'Алдан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (16, NULL, N'Алейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (17, NULL, N'Александров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (18, NULL, N'Александровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (19, NULL, N'Александровск-Сахалинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (20, NULL, N'Алексеевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (21, NULL, N'Алексин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (22, NULL, N'Алзамай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (23, NULL, N'Алупкане призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (24, NULL, N'Алуштане призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (25, NULL, N'Альметьевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (26, NULL, N'Амурск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (27, NULL, N'Анадырь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (28, NULL, N'Анапа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (29, NULL, N'Ангарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (30, NULL, N'Андреаполь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (31, NULL, N'Анжеро-Судженск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (32, NULL, N'Анива')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (33, NULL, N'Апатиты')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (34, NULL, N'Апрелевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (35, NULL, N'Апшеронск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (36, NULL, N'Арамиль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (37, NULL, N'Аргун')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (38, NULL, N'Ардатов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (39, NULL, N'Ардон')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (40, NULL, N'Арзамас')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (41, NULL, N'Аркадак')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (42, NULL, N'Армавир')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (43, NULL, N'Армянскне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (44, NULL, N'Арсеньев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (45, NULL, N'Арск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (46, NULL, N'Артём')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (47, NULL, N'Артёмовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (48, NULL, N'Артёмовский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (49, NULL, N'Архангельск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (50, NULL, N'Асбест')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (51, NULL, N'Асино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (52, NULL, N'Астрахань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (53, NULL, N'Аткарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (54, NULL, N'Ахтубинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (55, NULL, N'Ачинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (56, NULL, N'Аша')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (57, NULL, N'Бабаево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (58, NULL, N'Бабушкин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (59, NULL, N'Бавлы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (60, NULL, N'Багратионовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (61, NULL, N'Байкальск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (62, NULL, N'Баймак')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (63, NULL, N'Бакал')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (64, NULL, N'Баксан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (65, NULL, N'Балабаново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (66, NULL, N'Балаково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (67, NULL, N'Балахна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (68, NULL, N'Балашиха')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (69, NULL, N'Балашов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (70, NULL, N'Балей')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (71, NULL, N'Балтийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (72, NULL, N'Барабинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (73, NULL, N'Барнаул')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (74, NULL, N'Барыш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (75, NULL, N'Батайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (76, NULL, N'Бахчисарайне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (77, NULL, N'Бежецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (78, NULL, N'Белая Калитва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (79, NULL, N'Белая Холуница')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (80, NULL, N'Белгород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (81, NULL, N'Белебей')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (82, NULL, N'Белёв')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (83, NULL, N'Белинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (84, NULL, N'Белово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (85, NULL, N'Белогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (86, NULL, N'Белогорскне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (87, NULL, N'Белозерск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (88, NULL, N'Белокуриха')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (89, NULL, N'Беломорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (90, NULL, N'Белоозёрский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (91, NULL, N'Белорецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (92, NULL, N'Белореченск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (93, NULL, N'Белоусово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (94, NULL, N'Белоярский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (95, NULL, N'Белый')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (96, NULL, N'Бердск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (97, NULL, N'Березники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (98, NULL, N'Берёзовский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (99, NULL, N'Берёзовский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (100, NULL, N'Беслан')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (101, NULL, N'Бийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (102, NULL, N'Бикин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (103, NULL, N'Билибино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (104, NULL, N'Биробиджан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (105, NULL, N'Бирск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (106, NULL, N'Бирюсинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (107, NULL, N'Бирюч')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (108, NULL, N'Благовещенск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (109, NULL, N'Благовещенск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (110, NULL, N'Благодарный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (111, NULL, N'Бобров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (112, NULL, N'Богданович')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (113, NULL, N'Богородицк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (114, NULL, N'Богородск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (115, NULL, N'Боготол')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (116, NULL, N'Богучар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (117, NULL, N'Бодайбо')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (118, NULL, N'Бокситогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (119, NULL, N'Болгар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (120, NULL, N'Бологое')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (121, NULL, N'Болотное')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (122, NULL, N'Болохово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (123, NULL, N'Болхов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (124, NULL, N'Большой Камень')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (125, NULL, N'Бор')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (126, NULL, N'Борзя')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (127, NULL, N'Борисоглебск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (128, NULL, N'Боровичи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (129, NULL, N'Боровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (130, NULL, N'Бородино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (131, NULL, N'Братск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (132, NULL, N'Бронницы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (133, NULL, N'Брянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (134, NULL, N'Бугульма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (135, NULL, N'Бугуруслан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (136, NULL, N'Будённовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (137, NULL, N'Бузулук')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (138, NULL, N'Буинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (139, NULL, N'Буй')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (140, NULL, N'Буйнакск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (141, NULL, N'Бутурлиновка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (142, NULL, N'Валдай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (143, NULL, N'Валуйки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (144, NULL, N'Велиж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (145, NULL, N'Великие Луки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (146, NULL, N'Великий Новгород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (147, NULL, N'Великий Устюг')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (148, NULL, N'Вельск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (149, NULL, N'Венёв')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (150, NULL, N'Верещагино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (151, NULL, N'Верея')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (152, NULL, N'Верхнеуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (153, NULL, N'Верхний Тагил')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (154, NULL, N'Верхний Уфалей')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (155, NULL, N'Верхняя Пышма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (156, NULL, N'Верхняя Салда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (157, NULL, N'Верхняя Тура')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (158, NULL, N'Верхотурье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (159, NULL, N'Верхоянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (160, NULL, N'Весьегонск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (161, NULL, N'Ветлуга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (162, NULL, N'Видное')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (163, NULL, N'Вилюйск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (164, NULL, N'Вилючинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (165, NULL, N'Вихоревка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (166, NULL, N'Вичуга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (167, NULL, N'Владивосток')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (168, NULL, N'Владикавказ')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (169, NULL, N'Владимир')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (170, NULL, N'Волгоград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (171, NULL, N'Волгодонск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (172, NULL, N'Волгореченск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (173, NULL, N'Волжск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (174, NULL, N'Волжский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (175, NULL, N'Вологда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (176, NULL, N'Володарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (177, NULL, N'Волоколамск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (178, NULL, N'Волосово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (179, NULL, N'Волхов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (180, NULL, N'Волчанск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (181, NULL, N'Вольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (182, NULL, N'Воркута')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (183, NULL, N'Воронеж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (184, NULL, N'Ворсма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (185, NULL, N'Воскресенск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (186, NULL, N'Воткинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (187, NULL, N'Всеволожск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (188, NULL, N'Вуктыл')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (189, NULL, N'Выборг')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (190, NULL, N'Выкса')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (191, NULL, N'Высоковск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (192, NULL, N'Высоцк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (193, NULL, N'Вытегра')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (194, NULL, N'Вышний Волочёк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (195, NULL, N'Вяземский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (196, NULL, N'Вязники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (197, NULL, N'Вязьма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (198, NULL, N'Вятские Поляны')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (199, NULL, N'Гаврилов Посад')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (200, NULL, N'Гаврилов-Ям')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (201, NULL, N'Гагарин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (202, NULL, N'Гаджиево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (203, NULL, N'Гай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (204, NULL, N'Галич')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (205, NULL, N'Гатчина')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (206, NULL, N'Гвардейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (207, NULL, N'Гдов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (208, NULL, N'Геленджик')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (209, NULL, N'Георгиевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (210, NULL, N'Глазов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (211, NULL, N'Голицыно')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (212, NULL, N'Горбатов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (213, NULL, N'Горно-Алтайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (214, NULL, N'Горнозаводск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (215, NULL, N'Горняк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (216, NULL, N'Городец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (217, NULL, N'Городище')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (218, NULL, N'Городовиковск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (219, NULL, N'Гороховец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (220, NULL, N'Горячий Ключ')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (221, NULL, N'Грайворон')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (222, NULL, N'Гремячинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (223, NULL, N'Грозный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (224, NULL, N'Грязи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (225, NULL, N'Грязовец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (226, NULL, N'Губаха')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (227, NULL, N'Губкин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (228, NULL, N'Губкинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (229, NULL, N'Гудермес')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (230, NULL, N'Гуково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (231, NULL, N'Гулькевичи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (232, NULL, N'Гурьевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (233, NULL, N'Гурьевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (234, NULL, N'Гусев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (235, NULL, N'Гусиноозёрск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (236, NULL, N'Гусь-Хрустальный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (237, NULL, N'Давлеканово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (238, NULL, N'Дагестанские Огни')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (239, NULL, N'Далматово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (240, NULL, N'Дальнегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (241, NULL, N'Дальнереченск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (242, NULL, N'Данилов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (243, NULL, N'Данков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (244, NULL, N'Дегтярск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (245, NULL, N'Дедовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (246, NULL, N'Демидов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (247, NULL, N'Дербент')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (248, NULL, N'Десногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (249, NULL, N'Джанкойне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (250, NULL, N'Дзержинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (251, NULL, N'Дзержинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (252, NULL, N'Дивногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (253, NULL, N'Дигора')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (254, NULL, N'Димитровград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (255, NULL, N'Дмитриев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (256, NULL, N'Дмитров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (257, NULL, N'Дмитровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (258, NULL, N'Дно')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (259, NULL, N'Добрянка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (260, NULL, N'Долгопрудный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (261, NULL, N'Долинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (262, NULL, N'Домодедово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (263, NULL, N'Донецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (264, NULL, N'Донской')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (265, NULL, N'Дорогобуж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (266, NULL, N'Дрезна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (267, NULL, N'Дубна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (268, NULL, N'Дубовка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (269, NULL, N'Дудинка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (270, NULL, N'Духовщина')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (271, NULL, N'Дюртюли')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (272, NULL, N'Дятьково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (273, NULL, N'Евпаторияне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (274, NULL, N'Егорьевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (275, NULL, N'Ейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (276, NULL, N'Екатеринбург')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (277, NULL, N'Елабуга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (278, NULL, N'Елец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (279, NULL, N'Елизово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (280, NULL, N'Ельня')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (281, NULL, N'Еманжелинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (282, NULL, N'Емва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (283, NULL, N'Енисейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (284, NULL, N'Ермолино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (285, NULL, N'Ершов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (286, NULL, N'Ессентуки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (287, NULL, N'Ефремов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (288, NULL, N'Железноводск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (289, NULL, N'Железногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (290, NULL, N'Железногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (291, NULL, N'Железногорск-Илимский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (292, NULL, N'Жердевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (293, NULL, N'Жигулёвск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (294, NULL, N'Жиздра')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (295, NULL, N'Жирновск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (296, NULL, N'Жуков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (297, NULL, N'Жуковка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (298, NULL, N'Жуковский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (299, NULL, N'Завитинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (300, NULL, N'Заводоуковск')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (301, NULL, N'Заволжск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (302, NULL, N'Заволжье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (303, NULL, N'Задонск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (304, NULL, N'Заинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (305, NULL, N'Закаменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (306, NULL, N'Заозёрный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (307, NULL, N'Заозёрск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (308, NULL, N'Западная Двина')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (309, NULL, N'Заполярный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (310, NULL, N'Зарайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (311, NULL, N'Заречный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (312, NULL, N'Заречный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (313, NULL, N'Заринск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (314, NULL, N'Звенигово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (315, NULL, N'Звенигород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (316, NULL, N'Зверево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (317, NULL, N'Зеленогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (318, NULL, N'Зеленоградск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (319, NULL, N'Зеленодольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (320, NULL, N'Зеленокумск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (321, NULL, N'Зерноград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (322, NULL, N'Зея')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (323, NULL, N'Зима')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (324, NULL, N'Златоуст')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (325, NULL, N'Злынка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (326, NULL, N'Змеиногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (327, NULL, N'Знаменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (328, NULL, N'Зубцов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (329, NULL, N'Зуевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (330, NULL, N'Ивангород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (331, NULL, N'Иваново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (332, NULL, N'Ивантеевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (333, NULL, N'Ивдель')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (334, NULL, N'Игарка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (335, NULL, N'Ижевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (336, NULL, N'Избербаш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (337, NULL, N'Изобильный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (338, NULL, N'Иланский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (339, NULL, N'Инза')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (340, NULL, N'Иннополис')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (341, NULL, N'Инсар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (342, NULL, N'Инта')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (343, NULL, N'Ипатово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (344, NULL, N'Ирбит')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (345, NULL, N'Иркутск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (346, NULL, N'Исилькуль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (347, NULL, N'Искитим')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (348, NULL, N'Истра')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (349, NULL, N'Ишим')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (350, NULL, N'Ишимбай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (351, NULL, N'Йошкар-Ола')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (352, NULL, N'Кадников')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (353, NULL, N'Казань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (354, NULL, N'Калач')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (355, NULL, N'Калач-на-Дону')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (356, NULL, N'Калачинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (357, NULL, N'Калининград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (358, NULL, N'Калининск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (359, NULL, N'Калтан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (360, NULL, N'Калуга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (361, NULL, N'Калязин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (362, NULL, N'Камбарка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (363, NULL, N'Каменка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (364, NULL, N'Каменногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (365, NULL, N'Каменск-Уральский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (366, NULL, N'Каменск-Шахтинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (367, NULL, N'Камень-на-Оби')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (368, NULL, N'Камешково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (369, NULL, N'Камызяк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (370, NULL, N'Камышин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (371, NULL, N'Камышлов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (372, NULL, N'Канаш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (373, NULL, N'Кандалакша')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (374, NULL, N'Канск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (375, NULL, N'Карабаново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (376, NULL, N'Карабаш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (377, NULL, N'Карабулак')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (378, NULL, N'Карасук')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (379, NULL, N'Карачаевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (380, NULL, N'Карачев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (381, NULL, N'Каргат')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (382, NULL, N'Каргополь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (383, NULL, N'Карпинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (384, NULL, N'Карталы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (385, NULL, N'Касимов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (386, NULL, N'Касли')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (387, NULL, N'Каспийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (388, NULL, N'Катав-Ивановск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (389, NULL, N'Катайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (390, NULL, N'Качканар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (391, NULL, N'Кашин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (392, NULL, N'Кашира')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (393, NULL, N'Кедровый')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (394, NULL, N'Кемерово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (395, NULL, N'Кемь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (396, NULL, N'Керчьне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (397, NULL, N'Кизел')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (398, NULL, N'Кизилюрт')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (399, NULL, N'Кизляр')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (400, NULL, N'Кимовск')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (401, NULL, N'Кимры')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (402, NULL, N'Кингисепп')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (403, NULL, N'Кинель')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (404, NULL, N'Кинешма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (405, NULL, N'Киреевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (406, NULL, N'Киренск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (407, NULL, N'Киржач')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (408, NULL, N'Кириллов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (409, NULL, N'Кириши')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (410, NULL, N'Киров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (411, NULL, N'Киров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (412, NULL, N'Кировград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (413, NULL, N'Кирово-Чепецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (414, NULL, N'Кировск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (415, NULL, N'Кировск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (416, NULL, N'Кирс')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (417, NULL, N'Кирсанов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (418, NULL, N'Киселёвск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (419, NULL, N'Кисловодск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (420, NULL, N'Клин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (421, NULL, N'Клинцы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (422, NULL, N'Княгинино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (423, NULL, N'Ковдор')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (424, NULL, N'Ковров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (425, NULL, N'Ковылкино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (426, NULL, N'Когалым')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (427, NULL, N'Кодинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (428, NULL, N'Козельск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (429, NULL, N'Козловка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (430, NULL, N'Козьмодемьянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (431, NULL, N'Кола')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (432, NULL, N'Кологрив')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (433, NULL, N'Коломна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (434, NULL, N'Колпашево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (435, NULL, N'Кольчугино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (436, NULL, N'Коммунар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (437, NULL, N'Комсомольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (438, NULL, N'Комсомольск-на-Амуре')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (439, NULL, N'Конаково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (440, NULL, N'Кондопога')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (441, NULL, N'Кондрово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (442, NULL, N'Константиновск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (443, NULL, N'Копейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (444, NULL, N'Кораблино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (445, NULL, N'Кореновск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (446, NULL, N'Коркино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (447, NULL, N'Королёв')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (448, NULL, N'Короча')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (449, NULL, N'Корсаков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (450, NULL, N'Коряжма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (451, NULL, N'Костерёво')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (452, NULL, N'Костомукша')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (453, NULL, N'Кострома')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (454, NULL, N'Котельники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (455, NULL, N'Котельниково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (456, NULL, N'Котельнич')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (457, NULL, N'Котлас')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (458, NULL, N'Котово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (459, NULL, N'Котовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (460, NULL, N'Кохма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (461, NULL, N'Красавино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (462, NULL, N'Красноармейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (463, NULL, N'Красноармейск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (464, NULL, N'Красновишерск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (465, NULL, N'Красногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (466, NULL, N'Краснодар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (467, NULL, N'Краснозаводск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (468, NULL, N'Краснознаменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (469, NULL, N'Краснознаменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (470, NULL, N'Краснокаменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (471, NULL, N'Краснокамск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (472, NULL, N'Красноперекопскне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (473, NULL, N'Краснослободск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (474, NULL, N'Краснослободск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (475, NULL, N'Краснотурьинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (476, NULL, N'Красноуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (477, NULL, N'Красноуфимск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (478, NULL, N'Красноярск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (479, NULL, N'Красный Кут')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (480, NULL, N'Красный Сулин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (481, NULL, N'Красный Холм')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (482, NULL, N'Кремёнки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (483, NULL, N'Кропоткин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (484, NULL, N'Крымск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (485, NULL, N'Кстово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (486, NULL, N'Кубинка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (487, NULL, N'Кувандык')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (488, NULL, N'Кувшиново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (489, NULL, N'Кудрово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (490, NULL, N'Кудымкар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (491, NULL, N'Кузнецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (492, NULL, N'Куйбышев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (493, NULL, N'Кукмор')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (494, NULL, N'Кулебаки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (495, NULL, N'Кумертау')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (496, NULL, N'Кунгур')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (497, NULL, N'Купино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (498, NULL, N'Курган')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (499, NULL, N'Курганинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (500, NULL, N'Курильск')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (501, NULL, N'Курлово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (502, NULL, N'Куровское')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (503, NULL, N'Курск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (504, NULL, N'Куртамыш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (505, NULL, N'Курчалой')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (506, NULL, N'Курчатов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (507, NULL, N'Куса')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (508, NULL, N'Кушва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (509, NULL, N'Кызыл')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (510, NULL, N'Кыштым')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (511, NULL, N'Кяхта')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (512, NULL, N'Лабинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (513, NULL, N'Лабытнанги')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (514, NULL, N'Лагань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (515, NULL, N'Ладушкин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (516, NULL, N'Лаишево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (517, NULL, N'Лакинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (518, NULL, N'Лангепас')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (519, NULL, N'Лахденпохья')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (520, NULL, N'Лебедянь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (521, NULL, N'Лениногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (522, NULL, N'Ленинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (523, NULL, N'Ленинск-Кузнецкий')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (524, NULL, N'Ленск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (525, NULL, N'Лермонтов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (526, NULL, N'Лесной')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (527, NULL, N'Лесозаводск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (528, NULL, N'Лесосибирск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (529, NULL, N'Ливны')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (530, NULL, N'Ликино-Дулёво')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (531, NULL, N'Липецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (532, NULL, N'Липки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (533, NULL, N'Лиски')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (534, NULL, N'Лихославль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (535, NULL, N'Лобня')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (536, NULL, N'Лодейное Поле')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (537, NULL, N'Лосино-Петровский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (538, NULL, N'Луга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (539, NULL, N'Луза')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (540, NULL, N'Лукоянов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (541, NULL, N'Луховицы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (542, NULL, N'Лысково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (543, NULL, N'Лысьва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (544, NULL, N'Лыткарино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (545, NULL, N'Льгов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (546, NULL, N'Любань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (547, NULL, N'Люберцы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (548, NULL, N'Любим')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (549, NULL, N'Людиново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (550, NULL, N'Лянтор')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (551, NULL, N'Магадан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (552, NULL, N'Магас')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (553, NULL, N'Магнитогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (554, NULL, N'Майкоп')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (555, NULL, N'Майский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (556, NULL, N'Макаров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (557, NULL, N'Макарьев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (558, NULL, N'Макушино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (559, NULL, N'Малая Вишера')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (560, NULL, N'Малгобек')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (561, NULL, N'Малмыж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (562, NULL, N'Малоархангельск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (563, NULL, N'Малоярославец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (564, NULL, N'Мамадыш')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (565, NULL, N'Мамоново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (566, NULL, N'Мантурово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (567, NULL, N'Мариинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (568, NULL, N'Мариинский Посад')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (569, NULL, N'Маркс')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (570, NULL, N'Махачкала')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (571, NULL, N'Мглин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (572, NULL, N'Мегион')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (573, NULL, N'Медвежьегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (574, NULL, N'Медногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (575, NULL, N'Медынь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (576, NULL, N'Межгорье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (577, NULL, N'Междуреченск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (578, NULL, N'Мезень')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (579, NULL, N'Меленки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (580, NULL, N'Мелеуз')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (581, NULL, N'Менделеевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (582, NULL, N'Мензелинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (583, NULL, N'Мещовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (584, NULL, N'Миасс')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (585, NULL, N'Микунь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (586, NULL, N'Миллерово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (587, NULL, N'Минеральные Воды')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (588, NULL, N'Минусинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (589, NULL, N'Миньяр')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (590, NULL, N'Мирный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (591, NULL, N'Мирный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (592, NULL, N'Михайлов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (593, NULL, N'Михайловка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (594, NULL, N'Михайловск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (595, NULL, N'Михайловск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (596, NULL, N'Мичуринск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (597, NULL, N'Могоча')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (598, NULL, N'Можайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (599, NULL, N'Можга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (600, NULL, N'Моздок')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (601, NULL, N'Мончегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (602, NULL, N'Морозовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (603, NULL, N'Моршанск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (604, NULL, N'Мосальск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (605, NULL, N'Москва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (606, NULL, N'Муравленко')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (607, NULL, N'Мураши')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (608, NULL, N'Мурино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (609, NULL, N'Мурманск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (610, NULL, N'Муром')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (611, NULL, N'Мценск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (612, NULL, N'Мыски')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (613, NULL, N'Мытищи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (614, NULL, N'Мышкин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (615, NULL, N'Набережные Челны')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (616, NULL, N'Навашино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (617, NULL, N'Наволоки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (618, NULL, N'Надым')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (619, NULL, N'Назарово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (620, NULL, N'Назрань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (621, NULL, N'Называевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (622, NULL, N'Нальчик')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (623, NULL, N'Нариманов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (624, NULL, N'Наро-Фоминск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (625, NULL, N'Нарткала')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (626, NULL, N'Нарьян-Мар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (627, NULL, N'Находка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (628, NULL, N'Невель')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (629, NULL, N'Невельск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (630, NULL, N'Невинномысск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (631, NULL, N'Невьянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (632, NULL, N'Нелидово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (633, NULL, N'Неман')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (634, NULL, N'Нерехта')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (635, NULL, N'Нерчинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (636, NULL, N'Нерюнгри')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (637, NULL, N'Нестеров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (638, NULL, N'Нефтегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (639, NULL, N'Нефтекамск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (640, NULL, N'Нефтекумск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (641, NULL, N'Нефтеюганск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (642, NULL, N'Нея')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (643, NULL, N'Нижневартовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (644, NULL, N'Нижнекамск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (645, NULL, N'Нижнеудинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (646, NULL, N'Нижние Серги')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (647, NULL, N'Нижний Ломов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (648, NULL, N'Нижний Новгород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (649, NULL, N'Нижний Тагил')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (650, NULL, N'Нижняя Салда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (651, NULL, N'Нижняя Тура')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (652, NULL, N'Николаевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (653, NULL, N'Николаевск-на-Амуре')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (654, NULL, N'Никольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (655, NULL, N'Никольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (656, NULL, N'Никольское')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (657, NULL, N'Новая Ладога')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (658, NULL, N'Новая Ляля')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (659, NULL, N'Новоалександровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (660, NULL, N'Новоалтайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (661, NULL, N'Новоаннинский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (662, NULL, N'Нововоронеж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (663, NULL, N'Новодвинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (664, NULL, N'Новозыбков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (665, NULL, N'Новокубанск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (666, NULL, N'Новокузнецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (667, NULL, N'Новокуйбышевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (668, NULL, N'Новомичуринск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (669, NULL, N'Новомосковск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (670, NULL, N'Новопавловск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (671, NULL, N'Новоржев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (672, NULL, N'Новороссийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (673, NULL, N'Новосибирск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (674, NULL, N'Новосиль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (675, NULL, N'Новосокольники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (676, NULL, N'Новотроицк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (677, NULL, N'Новоузенск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (678, NULL, N'Новоульяновск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (679, NULL, N'Новоуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (680, NULL, N'Новохопёрск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (681, NULL, N'Новочебоксарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (682, NULL, N'Новочеркасск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (683, NULL, N'Новошахтинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (684, NULL, N'Новый Оскол')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (685, NULL, N'Новый Уренгой')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (686, NULL, N'Ногинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (687, NULL, N'Нолинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (688, NULL, N'Норильск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (689, NULL, N'Ноябрьск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (690, NULL, N'Нурлат')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (691, NULL, N'Нытва')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (692, NULL, N'Нюрба')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (693, NULL, N'Нягань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (694, NULL, N'Нязепетровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (695, NULL, N'Няндома')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (696, NULL, N'Облучье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (697, NULL, N'Обнинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (698, NULL, N'Обоянь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (699, NULL, N'Обь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (700, NULL, N'Одинцово')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (701, NULL, N'Озёрск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (702, NULL, N'Озёрск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (703, NULL, N'Озёры')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (704, NULL, N'Октябрьск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (705, NULL, N'Октябрьский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (706, NULL, N'Окуловка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (707, NULL, N'Олёкминск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (708, NULL, N'Оленегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (709, NULL, N'Олонец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (710, NULL, N'Омск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (711, NULL, N'Омутнинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (712, NULL, N'Онега')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (713, NULL, N'Опочка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (714, NULL, N'Орёл')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (715, NULL, N'Оренбург')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (716, NULL, N'Орехово-Зуево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (717, NULL, N'Орлов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (718, NULL, N'Орск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (719, NULL, N'Оса')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (720, NULL, N'Осинники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (721, NULL, N'Осташков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (722, NULL, N'Остров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (723, NULL, N'Островной')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (724, NULL, N'Острогожск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (725, NULL, N'Отрадное')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (726, NULL, N'Отрадный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (727, NULL, N'Оха')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (728, NULL, N'Оханск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (729, NULL, N'Очёр')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (730, NULL, N'Павлово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (731, NULL, N'Павловск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (732, NULL, N'Павловский Посад')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (733, NULL, N'Палласовка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (734, NULL, N'Партизанск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (735, NULL, N'Певек')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (736, NULL, N'Пенза')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (737, NULL, N'Первомайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (738, NULL, N'Первоуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (739, NULL, N'Перевоз')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (740, NULL, N'Пересвет')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (741, NULL, N'Переславль-Залесский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (742, NULL, N'Пермь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (743, NULL, N'Пестово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (744, NULL, N'Петров Вал')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (745, NULL, N'Петровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (746, NULL, N'Петровск-Забайкальский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (747, NULL, N'Петрозаводск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (748, NULL, N'Петропавловск-Камчатский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (749, NULL, N'Петухово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (750, NULL, N'Петушки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (751, NULL, N'Печора')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (752, NULL, N'Печоры')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (753, NULL, N'Пикалёво')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (754, NULL, N'Пионерский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (755, NULL, N'Питкяранта')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (756, NULL, N'Плавск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (757, NULL, N'Пласт')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (758, NULL, N'Плёс')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (759, NULL, N'Поворино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (760, NULL, N'Подольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (761, NULL, N'Подпорожье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (762, NULL, N'Покачи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (763, NULL, N'Покров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (764, NULL, N'Покровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (765, NULL, N'Полевской')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (766, NULL, N'Полесск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (767, NULL, N'Полысаево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (768, NULL, N'Полярные Зори')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (769, NULL, N'Полярный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (770, NULL, N'Поронайск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (771, NULL, N'Порхов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (772, NULL, N'Похвистнево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (773, NULL, N'Почеп')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (774, NULL, N'Починок')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (775, NULL, N'Пошехонье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (776, NULL, N'Правдинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (777, NULL, N'Приволжск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (778, NULL, N'Приморск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (779, NULL, N'Приморск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (780, NULL, N'Приморско-Ахтарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (781, NULL, N'Приозерск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (782, NULL, N'Прокопьевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (783, NULL, N'Пролетарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (784, NULL, N'Протвино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (785, NULL, N'Прохладный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (786, NULL, N'Псков')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (787, NULL, N'Пугачёв')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (788, NULL, N'Пудож')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (789, NULL, N'Пустошка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (790, NULL, N'Пучеж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (791, NULL, N'Пушкино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (792, NULL, N'Пущино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (793, NULL, N'Пыталово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (794, NULL, N'Пыть-Ях')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (795, NULL, N'Пятигорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (796, NULL, N'Радужный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (797, NULL, N'Радужный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (798, NULL, N'Райчихинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (799, NULL, N'Раменское')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (800, NULL, N'Рассказово')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (801, NULL, N'Ревда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (802, NULL, N'Реж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (803, NULL, N'Реутов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (804, NULL, N'Ржев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (805, NULL, N'Родники')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (806, NULL, N'Рославль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (807, NULL, N'Россошь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (808, NULL, N'Ростов-на-Дону')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (809, NULL, N'Ростов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (810, NULL, N'Рошаль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (811, NULL, N'Ртищево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (812, NULL, N'Рубцовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (813, NULL, N'Рудня')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (814, NULL, N'Руза')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (815, NULL, N'Рузаевка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (816, NULL, N'Рыбинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (817, NULL, N'Рыбное')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (818, NULL, N'Рыльск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (819, NULL, N'Ряжск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (820, NULL, N'Рязань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (821, NULL, N'Сакине призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (822, NULL, N'Салават')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (823, NULL, N'Салаир')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (824, NULL, N'Салехард')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (825, NULL, N'Сальск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (826, NULL, N'Самара')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (827, NULL, N'Санкт-Петербург')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (828, NULL, N'Саранск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (829, NULL, N'Сарапул')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (830, NULL, N'Саратов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (831, NULL, N'Саров')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (832, NULL, N'Сасово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (833, NULL, N'Сатка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (834, NULL, N'Сафоново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (835, NULL, N'Саяногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (836, NULL, N'Саянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (837, NULL, N'Светлогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (838, NULL, N'Светлоград')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (839, NULL, N'Светлый')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (840, NULL, N'Светогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (841, NULL, N'Свирск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (842, NULL, N'Свободный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (843, NULL, N'Себеж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (844, NULL, N'Севастопольне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (845, NULL, N'Северо-Курильск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (846, NULL, N'Северобайкальск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (847, NULL, N'Северодвинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (848, NULL, N'Североморск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (849, NULL, N'Североуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (850, NULL, N'Северск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (851, NULL, N'Севск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (852, NULL, N'Сегежа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (853, NULL, N'Сельцо')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (854, NULL, N'Семёнов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (855, NULL, N'Семикаракорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (856, NULL, N'Семилуки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (857, NULL, N'Сенгилей')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (858, NULL, N'Серафимович')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (859, NULL, N'Сергач')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (860, NULL, N'Сергиев Посад')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (861, NULL, N'Сердобск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (862, NULL, N'Серов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (863, NULL, N'Серпухов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (864, NULL, N'Сертолово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (865, NULL, N'Сибай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (866, NULL, N'Сим')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (867, NULL, N'Симферопольне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (868, NULL, N'Сковородино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (869, NULL, N'Скопин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (870, NULL, N'Славгород')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (871, NULL, N'Славск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (872, NULL, N'Славянск-на-Кубани')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (873, NULL, N'Сланцы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (874, NULL, N'Слободской')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (875, NULL, N'Слюдянка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (876, NULL, N'Смоленск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (877, NULL, N'Снежинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (878, NULL, N'Снежногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (879, NULL, N'Собинка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (880, NULL, N'Советск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (881, NULL, N'Советск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (882, NULL, N'Советск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (883, NULL, N'Советская Гавань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (884, NULL, N'Советский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (885, NULL, N'Сокол')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (886, NULL, N'Солигалич')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (887, NULL, N'Соликамск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (888, NULL, N'Солнечногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (889, NULL, N'Соль-Илецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (890, NULL, N'Сольвычегодск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (891, NULL, N'Сольцы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (892, NULL, N'Сорочинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (893, NULL, N'Сорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (894, NULL, N'Сортавала')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (895, NULL, N'Сосенский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (896, NULL, N'Сосновка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (897, NULL, N'Сосновоборск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (898, NULL, N'Сосновый Бор')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (899, NULL, N'Сосногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (900, NULL, N'Сочи')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (901, NULL, N'Спас-Деменск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (902, NULL, N'Спас-Клепики')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (903, NULL, N'Спасск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (904, NULL, N'Спасск-Дальний')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (905, NULL, N'Спасск-Рязанский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (906, NULL, N'Среднеколымск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (907, NULL, N'Среднеуральск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (908, NULL, N'Сретенск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (909, NULL, N'Ставрополь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (910, NULL, N'Старая Купавна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (911, NULL, N'Старая Русса')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (912, NULL, N'Старица')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (913, NULL, N'Стародуб')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (914, NULL, N'Старый Крымне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (915, NULL, N'Старый Оскол')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (916, NULL, N'Стерлитамак')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (917, NULL, N'Стрежевой')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (918, NULL, N'Строитель')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (919, NULL, N'Струнино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (920, NULL, N'Ступино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (921, NULL, N'Суворов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (922, NULL, N'Судакне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (923, NULL, N'Суджа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (924, NULL, N'Судогда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (925, NULL, N'Суздаль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (926, NULL, N'Сунжа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (927, NULL, N'Суоярви')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (928, NULL, N'Сураж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (929, NULL, N'Сургут')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (930, NULL, N'Суровикино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (931, NULL, N'Сурск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (932, NULL, N'Сусуман')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (933, NULL, N'Сухиничи')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (934, NULL, N'Сухой Лог')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (935, NULL, N'Сызрань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (936, NULL, N'Сыктывкар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (937, NULL, N'Сысерть')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (938, NULL, N'Сычёвка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (939, NULL, N'Сясьстрой')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (940, NULL, N'Тавда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (941, NULL, N'Таганрог')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (942, NULL, N'Тайга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (943, NULL, N'Тайшет')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (944, NULL, N'Талдом')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (945, NULL, N'Талица')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (946, NULL, N'Тамбов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (947, NULL, N'Тара')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (948, NULL, N'Тарко-Сале')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (949, NULL, N'Таруса')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (950, NULL, N'Татарск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (951, NULL, N'Таштагол')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (952, NULL, N'Тверь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (953, NULL, N'Теберда')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (954, NULL, N'Тейково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (955, NULL, N'Темников')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (956, NULL, N'Темрюк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (957, NULL, N'Терек')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (958, NULL, N'Тетюши')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (959, NULL, N'Тимашёвск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (960, NULL, N'Тихвин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (961, NULL, N'Тихорецк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (962, NULL, N'Тобольск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (963, NULL, N'Тогучин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (964, NULL, N'Тольятти')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (965, NULL, N'Томари')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (966, NULL, N'Томмот')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (967, NULL, N'Томск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (968, NULL, N'Топки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (969, NULL, N'Торжок')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (970, NULL, N'Торопец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (971, NULL, N'Тосно')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (972, NULL, N'Тотьма')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (973, NULL, N'Трёхгорный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (974, NULL, N'Троицк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (975, NULL, N'Трубчевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (976, NULL, N'Туапсе')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (977, NULL, N'Туймазы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (978, NULL, N'Тула')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (979, NULL, N'Тулун')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (980, NULL, N'Туран')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (981, NULL, N'Туринск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (982, NULL, N'Тутаев')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (983, NULL, N'Тында')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (984, NULL, N'Тырныауз')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (985, NULL, N'Тюкалинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (986, NULL, N'Тюмень')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (987, NULL, N'Уварово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (988, NULL, N'Углегорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (989, NULL, N'Углич')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (990, NULL, N'Удачный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (991, NULL, N'Удомля')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (992, NULL, N'Ужур')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (993, NULL, N'Узловая')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (994, NULL, N'Улан-Удэ')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (995, NULL, N'Ульяновск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (996, NULL, N'Унеча')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (997, NULL, N'Урай')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (998, NULL, N'Урень')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (999, NULL, N'Уржум')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1000, NULL, N'Урус-Мартан')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1001, NULL, N'Урюпинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1002, NULL, N'Усинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1003, NULL, N'Усмань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1004, NULL, N'Усолье-Сибирское')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1005, NULL, N'Усолье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1006, NULL, N'Уссурийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1007, NULL, N'Усть-Джегута')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1008, NULL, N'Усть-Илимск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1009, NULL, N'Усть-Катав')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1010, NULL, N'Усть-Кут')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1011, NULL, N'Усть-Лабинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1012, NULL, N'Устюжна')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1013, NULL, N'Уфа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1014, NULL, N'Ухта')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1015, NULL, N'Учалы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1016, NULL, N'Уяр')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1017, NULL, N'Фатеж')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1018, NULL, N'Феодосияне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1019, NULL, N'Фокино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1020, NULL, N'Фокино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1021, NULL, N'Фролово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1022, NULL, N'Фрязино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1023, NULL, N'Фурманов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1024, NULL, N'Хабаровск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1025, NULL, N'Хадыженск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1026, NULL, N'Ханты-Мансийск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1027, NULL, N'Харабали')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1028, NULL, N'Харовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1029, NULL, N'Хасавюрт')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1030, NULL, N'Хвалынск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1031, NULL, N'Хилок')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1032, NULL, N'Химки')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1033, NULL, N'Холм')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1034, NULL, N'Холмск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1035, NULL, N'Хотьково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1036, NULL, N'Цивильск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1037, NULL, N'Цимлянск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1038, NULL, N'Циолковский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1039, NULL, N'Чадан')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1040, NULL, N'Чайковский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1041, NULL, N'Чапаевск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1042, NULL, N'Чаплыгин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1043, NULL, N'Чебаркуль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1044, NULL, N'Чебоксары')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1045, NULL, N'Чегем')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1046, NULL, N'Чекалин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1047, NULL, N'Челябинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1048, NULL, N'Чердынь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1049, NULL, N'Черемхово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1050, NULL, N'Черепаново')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1051, NULL, N'Череповец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1052, NULL, N'Черкесск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1053, NULL, N'Чёрмоз')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1054, NULL, N'Черноголовка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1055, NULL, N'Черногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1056, NULL, N'Чернушка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1057, NULL, N'Черняховск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1058, NULL, N'Чехов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1059, NULL, N'Чистополь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1060, NULL, N'Чита')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1061, NULL, N'Чкаловск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1062, NULL, N'Чудово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1063, NULL, N'Чулым')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1064, NULL, N'Чусовой')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1065, NULL, N'Чухлома')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1066, NULL, N'Шагонар')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1067, NULL, N'Шадринск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1068, NULL, N'Шали')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1069, NULL, N'Шарыпово')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1070, NULL, N'Шарья')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1071, NULL, N'Шатура')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1072, NULL, N'Шахты')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1073, NULL, N'Шахунья')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1074, NULL, N'Шацк')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1075, NULL, N'Шебекино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1076, NULL, N'Шелехов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1077, NULL, N'Шенкурск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1078, NULL, N'Шилка')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1079, NULL, N'Шимановск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1080, NULL, N'Шиханы')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1081, NULL, N'Шлиссельбург')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1082, NULL, N'Шумерля')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1083, NULL, N'Шумиха')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1084, NULL, N'Шуя')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1085, NULL, N'Щёкино')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1086, NULL, N'Щёлкиноне призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1087, NULL, N'Щёлково')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1088, NULL, N'Щигры')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1089, NULL, N'Щучье')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1090, NULL, N'Электрогорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1091, NULL, N'Электросталь')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1092, NULL, N'Электроугли')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1093, NULL, N'Элиста')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1094, NULL, N'Энгельс')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1095, NULL, N'Эртиль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1096, NULL, N'Югорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1097, NULL, N'Южа')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1098, NULL, N'Южно-Сахалинск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1099, NULL, N'Южно-Сухокумск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1100, NULL, N'Южноуральск')
GO
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1101, NULL, N'Юрга')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1102, NULL, N'Юрьев-Польский')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1103, NULL, N'Юрьевец')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1104, NULL, N'Юрюзань')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1105, NULL, N'Юхнов')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1106, NULL, N'Ядрин')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1107, NULL, N'Якутск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1108, NULL, N'Ялтане призн.')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1109, NULL, N'Ялуторовск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1110, NULL, N'Янаул')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1111, NULL, N'Яранск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1112, NULL, N'Яровое')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1113, NULL, N'Ярославль')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1114, NULL, N'Ярцево')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1115, NULL, N'Ясногорск')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1116, NULL, N'Ясный')
INSERT [dbo].[Город_import] ([F1], [F2], [F3]) VALUES (1117, NULL, N'Яхрома')
GO
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Галкина Верона Васильевна', N'женский', N'obuckridge@sipes.com', CAST(N'1969-05-18T00:00:00.000' AS DateTime), 35, N'7(880)544-61-83', N'Дизайн', N'HHikbP', N'foto21.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Герасимова Айлин Ефимовна', N'женский', N'loraine.aufderhar@johnston.info', CAST(N'1966-06-09T00:00:00.000' AS DateTime), 53, N'7(835)478-61-60', N'Дизайн', N'TuhRzy', N'foto22.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Большаков Августин Алексеевич', N'мужской', N'juanita.kuvalis@yahoo.com', CAST(N'1978-07-12T00:00:00.000' AS DateTime), 52, N'7(173)770-55-13', N'ИТ', N'4Y83lz', N'foto23.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Морозов Ким Демьянович', N'мужской', N'ibode@lebsack.com', CAST(N'1981-10-11T00:00:00.000' AS DateTime), 67, N'7(518)761-85-69', N'ИТ', N'z0q7Co', N'foto24.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Кошелев Лука Артёмович', N'мужской', N'lilly.rodriguez@yahoo.com', CAST(N'1995-05-30T00:00:00.000' AS DateTime), 81, N'7(375)644-35-80', N'ИТ', N'uB8I2Z', N'foto25.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Ларионова Марина Владимировна', N'женский', N'sandrine84@gmail.com', CAST(N'1950-06-06T00:00:00.000' AS DateTime), 94, N'7(521)121-28-90', N'ИТ', N'o7Cjwu', N'foto26.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Маслова Марфа Феликсовна', N'женский', N'pearlie.watsica@wintheiser.com', CAST(N'1997-11-22T00:00:00.000' AS DateTime), 52, N'7(615)741-11-77', N'Биг Дата', N'zC4bi7', N'foto27.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Гришин Вениамин Петрович', N'мужской', N'kaela97@hotmail.com', CAST(N'1954-10-15T00:00:00.000' AS DateTime), 72, N'7(420)788-04-09', N'Информационная безопасность', N'ubeQbm', N'foto28.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Гришин Владислав Аркадьевич', N'мужской', N'gino.baumbach@gmail.com', CAST(N'1950-08-31T00:00:00.000' AS DateTime), 34, N'7(207)088-79-39', N'ИТ', N'16BLjl', N'foto29.jpg')
INSERT [dbo].[Жюри_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [пароль], [фото]) VALUES (N'Корнилова Габи Георгьевна', N'женский', N'deja76@mante.info', CAST(N'1962-12-26T00:00:00.000' AS DateTime), 64, N'7(809)651-85-96', N'Информационная безопасность', N'XLleqI', N'foto30.jpg')
GO
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (1, N'Всероссийский хакатон neuromedia 2017 по разработке продуктов на стыке информационных технологий, медиа и нейронных сетей ', CAST(N'2022-10-26' AS Date), 1, 34)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (2, N'Встреча #3 клуба ITBizRadio на тему:  «уборка» — выкидываем ненужные навыки, инструменты и ограничения» ', CAST(N'2022-07-14' AS Date), 3, 34)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (3, N'Встреча клуба «Leader stories»: Мотивирующее руководство ', CAST(N'2023-11-09' AS Date), 2, 2)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (4, N'Встреча клуба руководителей «Leader Stories»: Постановка целей команде ', CAST(N'2023-07-06' AS Date), 2, 66)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (5, N'Быстрее, выше, сильнее: как спорт помогает бизнесу и корпорациям ', CAST(N'2023-04-13' AS Date), 3, 4)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (6, N'Встреча клуба Leader Stories «Мотивирующее руководство» ', CAST(N'2022-02-20' AS Date), 3, 76)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (7, N'Встреча клуба Leader Stories в формате настольной трансформационной коучинговой игры «УниверсУм» ', CAST(N'2023-10-10' AS Date), 2, 78)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (8, N'Встреча пользователей PTV в России ', CAST(N'2022-04-16' AS Date), 3, 50)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (9, N'Встреча сообщества CocoaHeads Russia ', CAST(N'2023-07-01' AS Date), 3, 78)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (10, N'Встреча СПб СоА 16 апреля. Репетиция докладов к Analyst Days ', CAST(N'2022-10-18' AS Date), 1, 78)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (11, N'Встреча JUG.ru с Венкатом Субраманиамом — Design Patterns in the Light of Lambda Expressions ', CAST(N'2023-08-26' AS Date), 1, 56)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (12, N'Встреча №3 HR-клуба Моего круга ', CAST(N'2022-11-27' AS Date), 1, 45)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (13, N'Встреча №4 HR-клуба «Моего круга» ', CAST(N'2023-10-31' AS Date), 2, 78)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (14, N'Встреча SPb Python Community ', CAST(N'2022-07-02' AS Date), 3, 9)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (15, N'Встреча SpbDotNet №36 ', CAST(N'2022-10-14' AS Date), 3, 8)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (16, N'Встреча SpbDotNet №40 ', CAST(N'2023-05-08' AS Date), 2, 23)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (17, N'Встреча SpbDotNet №44 ', CAST(N'2022-05-10' AS Date), 2, 56)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (18, N'Вторая международная конференция и выставка «ЦОД: модели, сервисы, инфраструктура - 2018» ', CAST(N'2022-03-03' AS Date), 2, 33)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (19, N'Выбор и создание методов решения аналитических задач ', CAST(N'2023-09-13' AS Date), 2, 22)
INSERT [dbo].[Мероприятия_import] ([№], [Событие], [DATE], [DAYS], [Город]) VALUES (20, N'Выгорание: от бесплатного печенья до депрессии ', CAST(N'2023-11-11' AS Date), 3, 4)
GO
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Царева Виктория Давидовна', N'женский', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03T00:00:00.000' AS DateTime), 33, N'7(567)103-73-32', N'ИТ', N'IT в бизнесе', N'FYi396Dd5u', N'foto9.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Зорин Дмитрий Маркович', N'мужской', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07T00:00:00.000' AS DateTime), 57, N'7(79)644-01-06', N'ИТ', N'IT в бизнесе', N'7gi7E8K4Ng', N'foto10.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Зотова Анна Тимуровна', N'женский', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21T00:00:00.000' AS DateTime), 11, N'7(488)643-19-98', N'Биг Дата', N'Разработка приложений', N'3L3eA5eEg3', N'foto8.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Соловьев Тимур Константинович', N'мужской', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03T00:00:00.000' AS DateTime), 45, N'7(1828)504-39-49', N'Дизайн', N'IT-инфраструктура', N'Si8S5kS83v', N'foto11.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Малахов Александр Фёдорович', N'мужской', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18T00:00:00.000' AS DateTime), 78, N'7(905)793-68-23', N'Биг Дата', N'Разработка приложений', N'T83vfX2Z3b', N'foto12.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Зорин Марк Ярославович', N'мужской', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09T00:00:00.000' AS DateTime), 82, N'7(54)522-60-54', N'Аналитика', N'Стартапы', N'25cPn58HxV', N'foto13.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Егорова Ева Михайловна', N'женский', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15T00:00:00.000' AS DateTime), 80, N'7(05)441-48-14', N'ИТ', N'IT в бизнесе', N'3z86YDzaX8', N'foto14.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Гущина Кристина Львовна', N'женский', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28T00:00:00.000' AS DateTime), 47, N'7(023)826-25-26', N'Информационная безопасность', N'Информационная безопасность', N't8F9hZXp89', N'foto16.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Кудрявцева Виктория Романовна', N'женский', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27T00:00:00.000' AS DateTime), 30, N'7(7804)582-64-90', N'Биг Дата', N'Разработка приложений', N'92mARR3gu4', N'foto17.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Новикова Александра Александровна', N'женский', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02T00:00:00.000' AS DateTime), 76, N'7(1472)122-56-07', N'Аналитика', N'Стартапы', N'Kf64Y6rhZ3', N'foto18.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Масленников Родион Филиппович', N'мужской', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09T00:00:00.000' AS DateTime), 24, N'7(23)912-71-67', N'Аналитика', N'Стартапы', N's7iAYE9d38', N'foto19.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Иванов Тимур Иванович', N'мужской', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30T00:00:00.000' AS DateTime), 6, N'7(5939)489-85-18', N'Информационная безопасность', N'Информационная безопасность', N'3Ga9jfT9D2', N'foto20.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Иванов Сергей Степанович', N'мужской', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01T00:00:00.000' AS DateTime), 83, N'7(4020)034-48-35', N'Дизайн', N'IT-инфраструктура', N'N6598CFsgi', N'foto21.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Спиридонов Ярослав Сергеевич', N'мужской', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22T00:00:00.000' AS DateTime), 64, N'7(17)843-77-26', N'Дизайн', N'IT-инфраструктура', N'DV5625Zfmj', N'foto22.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Виноградова Эмилия Валерьевна', N'женский', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25T00:00:00.000' AS DateTime), 90, N'7(16)788-42-97', N'Дизайн', N'IT-инфраструктура', N'22YyD83dMg', N'foto23.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Мартынова Ева Семёновна', N'женский', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24T00:00:00.000' AS DateTime), 54, N'7(087)267-87-85', N'Информационная безопасность', N'Информационная безопасность', N'522EmkEmA6', N'foto24.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Яковлева Анисия Григорьевна', N'женский', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13T00:00:00.000' AS DateTime), 53, N'7(798)711-92-89', N'Информационная безопасность', N'Информационная безопасность', N'uf9u227NYU', N'foto25.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Свиридов Тимофей Александрович', N'мужской', N'82zju4yritwo@mail.com', CAST(N'1991-07-22T00:00:00.000' AS DateTime), 84, N'7(68)882-28-10', N'Биг Дата', N'Разработка приложений', N'4UDk9p76mD', N'foto26.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Медведев Захар Даниилович', N'мужской', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11T00:00:00.000' AS DateTime), 63, N'7(36)230-79-77', N'Аналитика', N'Стартапы', N'cK49u3JU4n', N'foto27.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Тихонова Елизавета Александровна', N'женский', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07T00:00:00.000' AS DateTime), 34, N'7(2594)224-28-37', N'Информационная безопасность', N'Информационная безопасность', N'b2JHb32S8i', N'foto28.jpg')
INSERT [dbo].[Модераторы_import] ([ФИО], [пол], [почта], [дата рождения], [страна], [телефон], [направление], [мероприятие], [пароль], [фото]) VALUES (N'Рыжов Роман Константинович', N'мужской', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30T00:00:00.000' AS DateTime), 67, N'7(1009)025-64-70', N'Биг Дата', N'Разработка приложений', N'uASc9446eF', N'foto29.jpg')
GO
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16T00:00:00.000' AS DateTime), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', N'foto1.jpg', N'мужской')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03T00:00:00.000' AS DateTime), 33, N'7(6562)925-01-77', N'Tj78jXeH68', N'foto2.jpg', N'мужской')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13T00:00:00.000' AS DateTime), 43, N'7(12)981-33-56', N'DF9a8cJf82', N'foto3.jpg', N'женский')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19T00:00:00.000' AS DateTime), 3, N'7(698)667-22-45', N'B2bdk8FD27', N'foto4.jpg', N'мужской')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10T00:00:00.000' AS DateTime), 33, N'7(38)393-11-43', N'58vMHdK4g5', N'foto5.jpg', N'женский')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28T00:00:00.000' AS DateTime), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', N'foto6.jpg', N'мужской')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26T00:00:00.000' AS DateTime), 40, N'7(49)638-66-62', N'dj8PN3b4M9', N'foto7.jpg', N'женский')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14T00:00:00.000' AS DateTime), 27, N'7(65)706-55-85', N'uy69Pp8DY6', N'foto8.jpg', N'мужской')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05T00:00:00.000' AS DateTime), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', N'foto9.jpg', N'женский')
INSERT [dbo].[Организаторы_import] ([ФИО], [Почта], [Дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13T00:00:00.000' AS DateTime), 16, N'7(427)939-24-67', N'fvm774FV3R', N'foto10.jpg', N'женский')
GO
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Абхазия', N'Abkhazia', N'AB', 895)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Австралия', N'Australia', N'AU', 36)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Австрия', N'Austria', N'AT', 40)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Азербайджан', N'Azerbaijan', N'AZ', 31)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Албания', N'Albania', N'AL', 8)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Алжир', N'Algeria', N'DZ', 12)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Американское Самоа', N'American Samoa', N'AS', 16)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ангилья', N'Anguilla', N'AI', 660)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ангола', N'Angola', N'AO', 24)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Андорра', N'Andorra', N'AD', 20)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Антарктида', N'Antarctica', N'AQ', 10)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Антигуа и Барбуда', N'Antigua and Barbuda', N'AG', 28)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Аргентина', N'Argentina', N'AR', 32)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Армения', N'Armenia', N'AM', 51)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Аруба', N'Aruba', N'AW', 533)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Афганистан', N'Afghanistan', N'AF', 4)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Багамы', N'Bahamas', N'BS', 44)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бангладеш', N'Bangladesh', N'BD', 50)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Барбадос', N'Barbados', N'BB', 52)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бахрейн', N'Bahrain', N'BH', 48)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Беларусь', N'Belarus', N'BY', 112)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Белиз', N'Belize', N'BZ', 84)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бельгия', N'Belgium', N'BE', 56)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бенин', N'Benin', N'BJ', 204)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бермуды', N'Bermuda', N'BM', 60)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Болгария', N'Bulgaria', N'BG', 100)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Боливия, Многонациональное Государство', N'Bolivia, plurinational state of', N'BO', 68)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бонайре, Саба и Синт-Эстатиус', N'Bonaire, Sint Eustatius and Saba', N'BQ', 535)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Босния и Герцеговина', N'Bosnia and Herzegovina', N'BA', 70)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ботсвана', N'Botswana', N'BW', 72)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бразилия', N'Brazil', N'BR', 76)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Британская территория в Индийском океане', N'British Indian Ocean Territory', N'IO', 86)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бруней-Даруссалам', N'Brunei Darussalam', N'BN', 96)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Буркина-Фасо', N'Burkina Faso', N'BF', 854)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бурунди', N'Burundi', N'BI', 108)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Бутан', N'Bhutan', N'BT', 64)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Вануату', N'Vanuatu', N'VU', 548)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Венгрия', N'Hungary', N'HU', 348)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Венесуэла Боливарианская Республика', N'Venezuela', N'VE', 862)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Виргинские острова, Британские', N'Virgin Islands, British', N'VG', 92)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Виргинские острова, США', N'Virgin Islands, U.S.', N'VI', 850)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Вьетнам', N'Vietnam', N'VN', 704)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Габон', N'Gabon', N'GA', 266)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гаити', N'Haiti', N'HT', 332)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гайана', N'Guyana', N'GY', 328)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гамбия', N'Gambia', N'GM', 270)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гана', N'Ghana', N'GH', 288)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гваделупа', N'Guadeloupe', N'GP', 312)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гватемала', N'Guatemala', N'GT', 320)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гвинея', N'Guinea', N'GN', 324)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гвинея-Бисау', N'Guinea-Bissau', N'GW', 624)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Германия', N'Germany', N'DE', 276)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гернси', N'Guernsey', N'GG', 831)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гибралтар', N'Gibraltar', N'GI', 292)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гондурас', N'Honduras', N'HN', 340)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гонконг', N'Hong Kong', N'HK', 344)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гренада', N'Grenada', N'GD', 308)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гренландия', N'Greenland', N'GL', 304)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Греция', N'Greece', N'GR', 300)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Грузия', N'Georgia', N'GE', 268)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Гуам', N'Guam', N'GU', 316)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Дания', N'Denmark', N'DK', 208)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Джерси', N'Jersey', N'JE', 832)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Джибути', N'Djibouti', N'DJ', 262)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Доминика', N'Dominica', N'DM', 212)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Доминиканская Республика', N'Dominican Republic', N'DO', 214)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Египет', N'Egypt', N'EG', 818)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Замбия', N'Zambia', N'ZM', 894)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Западная Сахара', N'Western Sahara', N'EH', 732)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Зимбабве', N'Zimbabwe', N'ZW', 716)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Израиль', N'Israel', N'IL', 376)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Индия', N'India', N'IN', 356)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Индонезия', N'Indonesia', N'ID', 360)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Иордания', N'Jordan', N'JO', 400)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ирак', N'Iraq', N'IQ', 368)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Иран, Исламская Республика', N'Iran, Islamic Republic of', N'IR', 364)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ирландия', N'Ireland', N'IE', 372)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Исландия', N'Iceland', N'IS', 352)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Испания', N'Spain', N'ES', 724)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Италия', N'Italy', N'IT', 380)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Йемен', N'Yemen', N'YE', 887)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кабо-Верде', N'Cape Verde', N'CV', 132)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Казахстан', N'Kazakhstan', N'KZ', 398)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Камбоджа', N'Cambodia', N'KH', 116)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Камерун', N'Cameroon', N'CM', 120)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Канада', N'Canada', N'CA', 124)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Катар', N'Qatar', N'QA', 634)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кения', N'Kenya', N'KE', 404)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кипр', N'Cyprus', N'CY', 196)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Киргизия', N'Kyrgyzstan', N'KG', 417)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кирибати', N'Kiribati', N'KI', 296)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Китай', N'China', N'CN', 156)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кокосовые (Килинг) острова', N'Cocos (Keeling) Islands', N'CC', 166)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Колумбия', N'Colombia', N'CO', 170)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Коморы', N'Comoros', N'KM', 174)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Конго', N'Congo', N'CG', 178)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Конго, Демократическая Республика', N'Congo, Democratic Republic of the', N'CD', 180)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Корея, Народно-Демократическая Республика', N'Korea, Democratic People''s republic of', N'KP', 408)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Корея, Республика', N'Korea, Republic of', N'KR', 410)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Коста-Рика', N'Costa Rica', N'CR', 188)
GO
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кот д''Ивуар', N'Cote d''Ivoire', N'CI', 384)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Куба', N'Cuba', N'CU', 192)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кувейт', N'Kuwait', N'KW', 414)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Кюрасао', N'Curaçao', N'CW', 531)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Лаос', N'Lao People''s Democratic Republic', N'LA', 418)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Латвия', N'Latvia', N'LV', 428)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Лесото', N'Lesotho', N'LS', 426)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ливан', N'Lebanon', N'LB', 422)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ливийская Арабская Джамахирия', N'Libyan Arab Jamahiriya', N'LY', 434)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Либерия', N'Liberia', N'LR', 430)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Лихтенштейн', N'Liechtenstein', N'LI', 438)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Литва', N'Lithuania', N'LT', 440)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Люксембург', N'Luxembourg', N'LU', 442)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Маврикий', N'Mauritius', N'MU', 480)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мавритания', N'Mauritania', N'MR', 478)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мадагаскар', N'Madagascar', N'MG', 450)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Майотта', N'Mayotte', N'YT', 175)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Макао', N'Macao', N'MO', 446)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Малави', N'Malawi', N'MW', 454)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Малайзия', N'Malaysia', N'MY', 458)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мали', N'Mali', N'ML', 466)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Малые Тихоокеанские отдаленные острова Соединенных Штатов', N'United States Minor Outlying Islands', N'UM', 581)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мальдивы', N'Maldives', N'MV', 462)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мальта', N'Malta', N'MT', 470)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Марокко', N'Morocco', N'MA', 504)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мартиника', N'Martinique', N'MQ', 474)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Маршалловы острова', N'Marshall Islands', N'MH', 584)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мексика', N'Mexico', N'MX', 484)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Микронезия, Федеративные Штаты', N'Micronesia, Federated States of', N'FM', 583)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мозамбик', N'Mozambique', N'MZ', 508)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Молдова, Республика', N'Moldova', N'MD', 498)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Монако', N'Monaco', N'MC', 492)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Монголия', N'Mongolia', N'MN', 496)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Монтсеррат', N'Montserrat', N'MS', 500)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Мьянма', N'Myanmar', N'MM', 104)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Намибия', N'Namibia', N'NA', 516)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Науру', N'Nauru', N'NR', 520)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Непал', N'Nepal', N'NP', 524)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Нигер', N'Niger', N'NE', 562)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Нигерия', N'Nigeria', N'NG', 566)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Нидерланды', N'Netherlands', N'NL', 528)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Никарагуа', N'Nicaragua', N'NI', 558)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ниуэ', N'Niue', N'NU', 570)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Новая Зеландия', N'New Zealand', N'NZ', 554)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Новая Каледония', N'New Caledonia', N'NC', 540)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Норвегия', N'Norway', N'NO', 578)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Объединенные Арабские Эмираты', N'United Arab Emirates', N'AE', 784)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Оман', N'Oman', N'OM', 512)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Остров Буве', N'Bouvet Island', N'BV', 74)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Остров Мэн', N'Isle of Man', N'IM', 833)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Остров Норфолк', N'Norfolk Island', N'NF', 574)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Остров Рождества', N'Christmas Island', N'CX', 162)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Остров Херд и острова Макдональд', N'Heard Island and McDonald Islands', N'HM', 334)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Острова Кайман', N'Cayman Islands', N'KY', 136)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Острова Кука', N'Cook Islands', N'CK', 184)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Острова Теркс и Кайкос', N'Turks and Caicos Islands', N'TC', 796)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Пакистан', N'Pakistan', N'PK', 586)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Палау', N'Palau', N'PW', 585)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Палестинская территория, оккупированная', N'Palestinian Territory, Occupied', N'PS', 275)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Панама', N'Panama', N'PA', 591)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Папский Престол (Государство — город Ватикан)', N'Holy See (Vatican City State)', N'VA', 336)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Папуа-Новая Гвинея', N'Papua New Guinea', N'PG', 598)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Парагвай', N'Paraguay', N'PY', 600)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Перу', N'Peru', N'PE', 604)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Питкерн', N'Pitcairn', N'PN', 612)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Польша', N'Poland', N'PL', 616)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Португалия', N'Portugal', N'PT', 620)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Пуэрто-Рико', N'Puerto Rico', N'PR', 630)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Республика Македония', N'Macedonia, The Former Yugoslav Republic Of', N'MK', 807)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Реюньон', N'Reunion', N'RE', 638)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Россия', N'Russian Federation', N'RU', 643)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Руанда', N'Rwanda', N'RW', 646)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Румыния', N'Romania', N'RO', 642)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Самоа', N'Samoa', N'WS', 882)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сан-Марино', N'San Marino', N'SM', 674)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сан-Томе и Принсипи', N'Sao Tome and Principe', N'ST', 678)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Саудовская Аравия', N'Saudi Arabia', N'SA', 682)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Свазиленд', N'Swaziland', N'SZ', 748)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Святая Елена, Остров вознесения, Тристан-да-Кунья', N'Saint Helena, Ascension And Tristan Da Cunha', N'SH', 654)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Северные Марианские острова', N'Northern Mariana Islands', N'MP', 580)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сен-Бартельми', N'Saint Barthélemy', N'BL', 652)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сен-Мартен', N'Saint Martin (French Part)', N'MF', 663)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сенегал', N'Senegal', N'SN', 686)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сент-Винсент и Гренадины', N'Saint Vincent and the Grenadines', N'VC', 670)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сент-Люсия', N'Saint Lucia', N'LC', 662)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сент-Китс и Невис', N'Saint Kitts and Nevis', N'KN', 659)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сент-Пьер и Микелон', N'Saint Pierre and Miquelon', N'PM', 666)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сербия', N'Serbia', N'RS', 688)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сейшелы', N'Seychelles', N'SC', 690)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сингапур', N'Singapore', N'SG', 702)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Синт-Мартен', N'Sint Maarten', N'SX', 534)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сирийская Арабская Республика', N'Syrian Arab Republic', N'SY', 760)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Словакия', N'Slovakia', N'SK', 703)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Словения', N'Slovenia', N'SI', 705)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Соединенное Королевство', N'United Kingdom', N'GB', 826)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Соединенные Штаты', N'United States', N'US', 840)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Соломоновы острова', N'Solomon Islands', N'SB', 90)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сомали', N'Somalia', N'SO', 706)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Судан', N'Sudan', N'SD', 729)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Суринам', N'Suriname', N'SR', 740)
GO
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Сьерра-Леоне', N'Sierra Leone', N'SL', 694)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Таджикистан', N'Tajikistan', N'TJ', 762)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Таиланд', N'Thailand', N'TH', 764)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тайвань (Китай)', N'Taiwan, Province of China', N'TW', 158)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Танзания, Объединенная Республика', N'Tanzania, United Republic Of', N'TZ', 834)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тимор-Лесте', N'Timor-Leste', N'TL', 626)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Того', N'Togo', N'TG', 768)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Токелау', N'Tokelau', N'TK', 772)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тонга', N'Tonga', N'TO', 776)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тринидад и Тобаго', N'Trinidad and Tobago', N'TT', 780)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тувалу', N'Tuvalu', N'TV', 798)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Тунис', N'Tunisia', N'TN', 788)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Туркмения', N'Turkmenistan', N'TM', 795)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Турция', N'Turkey', N'TR', 792)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Уганда', N'Uganda', N'UG', 800)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Узбекистан', N'Uzbekistan', N'UZ', 860)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Украина', N'Ukraine', N'UA', 804)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Уоллис и Футуна', N'Wallis and Futuna', N'WF', 876)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Уругвай', N'Uruguay', N'UY', 858)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Фарерские острова', N'Faroe Islands', N'FO', 234)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Фиджи', N'Fiji', N'FJ', 242)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Филиппины', N'Philippines', N'PH', 608)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Финляндия', N'Finland', N'FI', 246)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Фолклендские острова (Мальвинские)', N'Falkland Islands (Malvinas)', N'FK', 238)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Франция', N'France', N'FR', 250)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Французская Гвиана', N'French Guiana', N'GF', 254)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Французская Полинезия', N'French Polynesia', N'PF', 258)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Французские Южные территории', N'French Southern Territories', N'TF', 260)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Хорватия', N'Croatia', N'HR', 191)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Центрально-Африканская Республика', N'Central African Republic', N'CF', 140)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Чад', N'Chad', N'TD', 148)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Черногория', N'Montenegro', N'ME', 499)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Чешская Республика', N'Czech Republic', N'CZ', 203)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Чили', N'Chile', N'CL', 152)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Швейцария', N'Switzerland', N'CH', 756)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Швеция', N'Sweden', N'SE', 752)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Шпицберген и Ян Майен', N'Svalbard and Jan Mayen', N'SJ', 744)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Шри-Ланка', N'Sri Lanka', N'LK', 144)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эквадор', N'Ecuador', N'EC', 218)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Экваториальная Гвинея', N'Equatorial Guinea', N'GQ', 226)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эландские острова', N'Åland Islands', N'AX', 248)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эль-Сальвадор', N'El Salvador', N'SV', 222)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эритрея', N'Eritrea', N'ER', 232)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эстония', N'Estonia', N'EE', 233)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Эфиопия', N'Ethiopia', N'ET', 231)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Южная Африка', N'South Africa', N'ZA', 710)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Южная Джорджия и Южные Сандвичевы острова', N'South Georgia and the South Sandwich Islands', N'GS', 239)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Южная Осетия', N'South Ossetia', N'OS', 896)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Южный Судан', N'South Sudan', N'SS', 728)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Ямайка', N'Jamaica', N'JM', 388)
INSERT [dbo].[Страны_import] ([Название страны], [Английское название], [Код], [Код2]) VALUES (N'Япония', N'Japan', N'JP', 392)
GO
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26T00:00:00.000' AS DateTime), 71, 9604240711, N'tKKevv8%', N'foto60.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04T00:00:00.000' AS DateTime), 34, 9306616931, N'huSfHm4$', N'foto61.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05T00:00:00.000' AS DateTime), 73, 9572656068, N'TlUwMw77%', N'foto62.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25T00:00:00.000' AS DateTime), 64, 9117440314, N'%afF#@6', N'foto63.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27T00:00:00.000' AS DateTime), 55, 9848778764, N'SU4Jpw"', N'foto64.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16T00:00:00.000' AS DateTime), 77, 9405002072, N'wL#O0V', N'foto65.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13T00:00:00.000' AS DateTime), 52, 9560567521, N'p5r{zY', N'foto66.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03T00:00:00.000' AS DateTime), 28, 9654933966, N'wTVK~M1', N'foto67.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27T00:00:00.000' AS DateTime), 53, 9973296978, N'8*Zfaj', N'foto68.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08T00:00:00.000' AS DateTime), 74, 9645715650, N'4sBGr*', N'foto69.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13T00:00:00.000' AS DateTime), 7, 9184188073, N'BpC8e8]', N'foto70.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03T00:00:00.000' AS DateTime), 38, 918413939, N'cI1CTd', N'foto1.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19T00:00:00.000' AS DateTime), 54, 9184181029, N'MPmfYk', N'foto2.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31T00:00:00.000' AS DateTime), 24, 91841882942, N'omtSW3', N'foto3.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02T00:00:00.000' AS DateTime), 24, 9184180129, N'cErGgC', N'foto4.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02T00:00:00.000' AS DateTime), 11, 9184181203, N'q2se3v', N'foto5.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17T00:00:00.000' AS DateTime), 1, 9184181035, N'KnqfAk', N'foto6.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18T00:00:00.000' AS DateTime), 2, 9184181038, N'6YxPwE', N'foto7.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-10-30T00:00:00.000' AS DateTime), 54, 9184189137, N'pBQpPx', N'foto8.jpg', N'женский')
INSERT [dbo].[Участники_import] ([ФИО], [Почта], [дата рождения], [страна], [телефон], [пароль], [фото], [пол]) VALUES (N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11T00:00:00.000' AS DateTime), 64, 9182394582, N'FkX6Ms', N'foto9.jpg', N'женский')
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD FOREIGN KEY([activity_winner])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[event] ([id_event])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_moder])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_j1])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_j2])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_j3])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_j4])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[activity_staff]  WITH CHECK ADD FOREIGN KEY([activity_j5])
REFERENCES [dbo].[people] ([id_people])
GO
ALTER TABLE [dbo].[event]  WITH CHECK ADD FOREIGN KEY([event_city])
REFERENCES [dbo].[city] ([id_city])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD FOREIGN KEY([people_country])
REFERENCES [dbo].[country] ([id_country])
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD FOREIGN KEY([people_direction])
REFERENCES [dbo].[direction_m] ([id_direction_m])
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD FOREIGN KEY([people_event])
REFERENCES [dbo].[event_m] ([id_event_m])
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD FOREIGN KEY([people_role])
REFERENCES [dbo].[role_m] ([id_role_m])
GO
/****** Object:  StoredProcedure [dbo].[CheckCredentials]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckCredentials]
	
	@login INT,
	@password NVARCHAR(64)

AS
BEGIN
	SELECT * 
	FROM dbo.people
	WHERE id_people=@login and people_pass=@password
END
GO
/****** Object:  StoredProcedure [dbo].[FilterDate]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FilterDate]
		@date NVARCHAR(150)
AS
BEGIN
 SELECT *
 FROM dbo.ViewEvents
 WHERE Дата = @date
END
GO
/****** Object:  StoredProcedure [dbo].[FilterDirection]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FilterDirection]
		@direction NVARCHAR(150)
AS
BEGIN
 SELECT *
 FROM dbo.ViewEvents
 WHERE Направление = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDirections]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllDirections]
AS
BEGIN
SELECT Направление
FROM dbo.ViewEventsAndDirectionsFixed
END
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCity]
AS
BEGIN
SELECT *
FROM dbo.ViewCities
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountry]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCountry]
AS
BEGIN
SELECT *
FROM dbo.ViewCountries
END
GO
/****** Object:  StoredProcedure [dbo].[GetDirections]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDirections]

@event INT

AS
BEGIN
SELECT Направление
FROM dbo.ViewEventsAndDirectionsFixed
WHERE [№] = @event
END
GO
/****** Object:  StoredProcedure [dbo].[GetEventName]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEventName]

AS
BEGIN
SELECT * 
FROM dbo.ViewEventName
END
GO
/****** Object:  StoredProcedure [dbo].[GetEvents]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEvents]
AS
BEGIN
	
	SELECT *
	FROM dbo.ViewEventsFixed
END
GO
/****** Object:  StoredProcedure [dbo].[GetEventsName]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEventsName]
AS
BEGIN
SELECT *
FROM dbo.ViewEventsName
END
GO
/****** Object:  StoredProcedure [dbo].[GetMaxPeople]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMaxPeople]
AS
BEGIN
	
	SELECT MAX([Id Number])
	FROM dbo.ViewPeople
END
GO
/****** Object:  StoredProcedure [dbo].[InsertActivity]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertActivity]

@date_event DATE,
@days_activity INT


AS
BEGIN
INSERT INTO dbo.ViewEvent2
VALUES ((SELECT MAX(id_activity+ 1 ) FROM dbo.activity), (SELECT MAX(id_event) FROM dbo.event), @date_event, @days_activity, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertActivityStaff]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertActivityStaff]

@activity_name VARCHAR(128),
@activity_day INT,
@time TIME(7)

AS
BEGIN
INSERT INTO dbo.ViewEvent3
VALUES ((SELECT MAX(id_activity) FROM dbo.activity), @activity_name, @activity_day, @time, NULL, NULL, NULL, NULL, NULL, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEvent]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertEvent]

@event_name NVARCHAR(150),
@date_event DATE,
@days_event INT,
@city INT

AS
BEGIN

INSERT INTO dbo.ViewEvent1
VALUES ((SELECT MAX(id_event + 1) FROM dbo.event), @event_name, @date_event, @days_event, @city)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJM]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertJM]
	@id INT,
	@fullname NVARCHAR(255),
	@gender CHAR(12),
	@role INT,
	@email NVARCHAR(255),
	@phone NVARCHAR(32),
	@country INT,
	@dob DATE,
	@photo NVARCHAR(255),
	@password NVARCHAR(64)

AS
BEGIN
	SET IDENTITY_INSERT dbo.people ON
	INSERT INTO dbo.ViewPeople ([Id Number], ФИО, Пол, Роль, Почта, Телефон, Страна, [Дата рождения], Фото, Пароль)
	VALUES (@id, @fullname, @gender, @role, @email, @phone, @country, @dob, @photo, @password)
	SET IDENTITY_INSERT dbo.people OFF
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJury1]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertJury1]

@event INT,
@direction VARCHAR(128),
@jury1 INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_j1 =
	CASE 
		WHEN activity_j1 IS NULL THEN @jury1
		ELSE @jury1
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJury2]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertJury2]

@event INT,
@direction VARCHAR(128),
@jury2 INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_j2 =
	CASE 
		WHEN activity_j2 IS NULL THEN @jury2
		ELSE @jury2
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJury3]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertJury3]

@event INT,
@direction VARCHAR(128),
@jury3 INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_j3 =
	CASE 
		WHEN activity_j3 IS NULL THEN @jury3
		ELSE @jury3
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJury4]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertJury4]

@event INT,
@direction VARCHAR(128),
@jury4 INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_j4 =
	CASE 
		WHEN activity_j4 IS NULL THEN @jury4
		ELSE @jury4
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[InsertJury5]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertJury5]

@event INT,
@direction VARCHAR(128),
@jury5 INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_j5 =
	CASE 
		WHEN activity_j5 IS NULL THEN @jury5
		ELSE @jury5
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[InsertModerator]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertModerator]

@event INT,
@direction VARCHAR(128),
@moder INT

AS
BEGIN
UPDATE dbo.ViewStaff
SET activity_moder =
	CASE 
		WHEN activity_moder IS NULL THEN @moder
		ELSE @moder
	END
WHERE event_id = @event AND activity_name = @direction
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePersonalArea]    Script Date: 08.03.2024 19:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdatePersonalArea]

@people INT,
@fullname NVARCHAR(255),
@post NVARCHAR(255),
@phone NVARCHAR(32),
@country INT,
@photo NVARCHAR(255),
@password NVARCHAR(64)

AS
BEGIN
UPDATE dbo.ViewPeople
SET ФИО = @fullname, Почта = @post, Телефон = @phone, Страна = @country, Фото = @photo, Пароль = @password
WHERE [Id Number] = @people
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[10] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 2655
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewActivities'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewActivities'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "city"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCities'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCities'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "country"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCountries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCountries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 28
               Left = 385
               Bottom = 158
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 25
               Left = 675
               Bottom = 155
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1995
         Alias = 4365
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 39
               Left = 304
               Bottom = 169
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 32
               Left = 548
               Bottom = 162
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 3285
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 28
               Left = 385
               Bottom = 158
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 25
               Left = 675
               Bottom = 155
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1995
         Alias = 4365
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventFull'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventFull'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventFull'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 5355
         Width = 5850
         Width = 2430
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 5295
         Width = 3975
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsAndDirections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsAndDirections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 4620
         Width = 4785
         Width = 5160
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsAndDirectionsFixed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsAndDirectionsFixed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "activity"
            Begin Extent = 
               Top = 129
               Left = 270
               Bottom = 259
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 180
               Left = 23
               Bottom = 316
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "event"
            Begin Extent = 
               Top = 19
               Left = 529
               Bottom = 149
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 4995
         Width = 3300
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsFixed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsFixed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 4905
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsNamee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEventsNamee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "people"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 325
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3405
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3855
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPeople'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPeople'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity"
            Begin Extent = 
               Top = 56
               Left = 282
               Bottom = 186
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "activity_staff"
            Begin Extent = 
               Top = 30
               Left = 513
               Bottom = 160
               Right = 687
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewStaff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewStaff'
GO
