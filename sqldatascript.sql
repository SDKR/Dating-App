use master
go

drop database dateingappDatabase
go

create database dateingappDatabase
go

use dateingappDatabase
go

create table [User](
	PK_Profile_name nvarchar(50) PRIMARY KEY not null,
	[Password] nvarchar(50) not null, 
	Creation_Date datetime not null,
	User_aktiv int not null
	)

create table Postcode_City(
	PK_Post_code int PRIMARY KEY not null,
	City nvarchar(50) not null
)

create table User_Information(
	PK_InfoID int Identity PRIMARY KEY not null,
	First_name nvarchar(50) not null,
	Last_name nvarchar(50) not null,
	Birthdate date not null,
	Gender nvarchar(50) not null,
	Seeking nvarchar(50) not null,
	FK_Post_Code int not null,
	FOREIGN KEY (FK_Post_Code) REFERENCES Postcode_City(PK_Post_code),
	Email nvarchar(100) not null,
	[Status] nvarchar(50) not null,
	Sexual_orientation nvarchar(50) not null,
	Height int not null,
	[Weight] int not null,
	Eyecolor nvarchar(50) not null,
	Haircolor nvarchar(50) not null,
	Children nvarchar(50) not null,
	Body_Type nvarchar(50) not null,
	About_Yourself nvarchar(400) not null,
	FK_Profile_name nvarchar(50),
	FOREIGN KEY (FK_Profile_name) REFERENCES [User](PK_Profile_name)
)

create table [Message](
	PK_MessageID int identity PRIMARY KEY not null,
	FK_Sender nvarchar(50) not null,
	FOREIGN KEY (FK_Sender) REFERENCES [User](PK_Profile_name),
	FK_Reciver nvarchar(50) not null,
	FOREIGN KEY (FK_Reciver) REFERENCES [User](PK_Profile_name),
	[Message] nvarchar(1000) not null
)

create table Picture(
	PK_Picture_ID int identity PRIMARY KEY not null,
	FK_InfoID int not null,
	FOREIGN KEY (FK_InfoID) REFERENCES User_Information(PK_InfoID),
	Picture image not null
)
go

INSERT INTO [User] VALUES
('Frækfyr42','Password',getdate(), 1),
('smukkesøde17', 'Password',getdate(), 1),
('Flottefyr', 'Password',getdate(), 1),
('SweetKristy', 'Password',getdate(), 1),
('KristyHoney', 'Password',getdate(), 1),
('BubblySnowflake', 'Password',getdate(), 1),
('AngelicPrincessKristy', 'Password',getdate(), 1),
('FairyPrincessKristy', 'Password',getdate(), 1),
('BabyKristyButterfly', 'Password',getdate(), 1),
('BamboozledByPaperClips', 'Password',getdate(), 1),
('SmartyPants', 'Password',getdate(), 1),
('NerdyNinjaHugs', 'Password',getdate(), 1),
('LaughingMyAssOff', 'Password',getdate(), 1),
('LipsPotatoChips', 'Password',getdate(), 1),
('RascalRoger', 'Password',getdate(), 1),
('RazzleDazzle', 'Password',getdate(), 1),
('NotASnobRob', 'Password',getdate(), 1)
go
--('LoverBoy69', 'Password',getdate(), 1),
--('DaGift2Womens', 'Password',getdate(), 1),
--('justTHE1fourU', 'Password',getdate(), 1),
--('Cyber_Gypsy', 'Password',getdate(), 1),
--('Digital_Knight_In_Shining_Armor', 'Password',getdate(), 1),
--('Gotta_Love_Kitty_Cats', 'Password',getdate(), 1),
--('I_Do_Yoga', 'Password',getdate(), 1),
--('I_Subscribe_To_Food_Magazines', 'Password',getdate(), 1),
--('Kiss_The_Cook', 'Password',getdate(), 1),
--('Legally_Blonde_Executive_Hottie', 'Password',getdate(), 1),
--('Moms_Love_Me', 'Password',getdate(), 1),
--('More_Fun_Than_Your_Ex', 'Password',getdate(), 1),
--('Looking_For_Meet_Cute', 'Password',getdate(), 1),
--('Sleeps_In_Cat_Pajamas', 'Password',getdate(), 1),
--('WillWork4Sushi', 'Password',getdate(), 1),
--('PlayToWin', 'Password',getdate(), 1),
--('UrMomWillLuvMe', 'Password',getdate(), 1),
--('BigMeat187', 'Password',getdate(), 1),
--('LaidBlackguy24', 'Password',getdate(), 1),
--('PapaSmurf69', 'Password',getdate(), 1),
--('BikesBrewsBoobs', 'Password',getdate(), 1),
--('WannaFriendUrButt', 'Password',getdate(), 1),
--('TiredOfTrying18', 'Password',getdate(), 1),
--('BarelyBreathing88', 'Password',getdate(), 1),
--('BlackAgainstWhite', 'Password',getdate(), 1),
--('UBetterTwerk4Me', 'Password',getdate(), 1),
--('RUReady2Cum', 'Password',getdate(), 1),
--('TheLordIsReal', 'Password',getdate(), 1),
--('TinyTrekkie', 'Password',getdate(), 1),
--('herpes_free_since_03', 'Password',getdate(), 1),
--('sleeping_beauty', 'Password',getdate(), 1),
--('i_got_pie', 'Password',getdate(), 1),
--('pixie_dust', 'Password',getdate(), 1),
--('real_name_hidden', 'Password',getdate(), 1),
--('1_wish_genie', 'Password',getdate(), 1),
--('wanton_butt', 'Password',getdate(), 1)

INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1000, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1001, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1002, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1003, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1004, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1005, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1006, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1007, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1008, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1009, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1010, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1011, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1012, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1013, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1014, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1015, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1016, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1017, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1018, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1019, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1020, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1050, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1051, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1052, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1053, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1054, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1055, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1056, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1057, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1058, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1059, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1060, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1061, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1062, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1063, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1064, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1065, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1066, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1067, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1068, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1069, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1070, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1071, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1072, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1073, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1074, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1093, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1095, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1097, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1099, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1100, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1101, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1102, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1103, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1104, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1105, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1106, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1107, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1108, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1109, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1110, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1111, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1112, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1113, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1114, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1115, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1116, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1117, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1118, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1119, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1120, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1121, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1122, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1123, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1124, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1125, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1126, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1127, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1128, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1129, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1130, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1131, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1147, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1148, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1150, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1151, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1152, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1153, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1154, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1155, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1156, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1157, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1158, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1159, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1160, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1161, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1162, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1163, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1164, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1165, N'København K.')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1166, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1167, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1168, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1169, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1170, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1171, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1172, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1173, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1174, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1175, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1177, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1198, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1199, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1200, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1201, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1202, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1203, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1204, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1205, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1206, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1207, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1208, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1209, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1210, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1211, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1212, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1213, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1214, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1215, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1216, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1217, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1218, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1219, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1220, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1248, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1250, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1251, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1252, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1253, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1254, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1255, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1256, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1257, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1258, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1259, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1260, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1261, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1262, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1263, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1264, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1265, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1266, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1267, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1268, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1270, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1271, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1295, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1298, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1299, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1300, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1301, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1302, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1303, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1304, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1305, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1306, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1307, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1308, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1309, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1310, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1311, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1312, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1313, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1314, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1315, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1316, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1317, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1318, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1319, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1320, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1321, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1322, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1323, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1324, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1325, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1326, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1327, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1328, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1329, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1347, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1349, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1350, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1352, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1353, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1354, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1355, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1356, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1357, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1358, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1359, N'København K.')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1360, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1361, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1362, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1363, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1364, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1365, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1366, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1367, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1368, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1369, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1370, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1371, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1400, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1401, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1402, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1403, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1404, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1405, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1406, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1407, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1408, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1409, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1410, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1411, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1412, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1413, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1414, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1415, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1416, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1417, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1418, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1419, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1420, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1421, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1422, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1423, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1424, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1425, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1426, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1427, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1428, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1429, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1430, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1431, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1432, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1433, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1448, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1450, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1451, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1452, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1453, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1454, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1455, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1456, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1457, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1458, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1459, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1460, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1461, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1462, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1463, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1464, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1465, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1466, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1467, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1468, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1470, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1471, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1472, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1473, N'København K.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1501, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1502, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1503, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1529, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1530, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1534, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1550, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1551, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1552, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1553, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1554, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1555, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1556, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1557, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1558, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1559, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1560, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1561, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1562, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1563, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1564, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1567, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1568, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1569, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1570, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1571, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1572, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1573, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1574, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1575, N'København V.')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1576, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1577, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1590, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1593, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1596, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1600, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1601, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1602, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1603, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1604, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1605, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1606, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1607, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1608, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1609, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1610, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1611, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1612, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1613, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1614, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1615, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1616, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1617, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1618, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1619, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1620, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1623, N'København V')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1625, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1635, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1643, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1645, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1648, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1650, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1651, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1652, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1653, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1654, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1655, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1656, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1657, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1658, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1659, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1660, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1661, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1662, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1663, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1664, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1665, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1666, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1667, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1668, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1669, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1670, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1671, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1672, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1673, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1674, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1675, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1676, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1677, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1700, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1701, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1702, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1703, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1704, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1705, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1706, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1707, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1708, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1709, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1710, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1711, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1712, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1713, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1714, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1715, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1716, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1717, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1718, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1719, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1720, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1721, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1722, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1723, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1724, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1725, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1726, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1727, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1728, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1729, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1730, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1731, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1732, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1733, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1734, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1735, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1736, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1737, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1738, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1739, N'København V.')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1750, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1751, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1752, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1753, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1754, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1755, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1756, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1757, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1758, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1759, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1760, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1761, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1762, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1763, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1764, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1765, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1766, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1770, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1771, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1772, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1773, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1774, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1775, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1776, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1777, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1778, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1799, N'København V.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1800, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1801, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1802, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1803, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1804, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1805, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1806, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1807, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1808, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1809, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1810, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1811, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1812, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1813, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1814, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1815, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1816, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1817, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1818, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1819, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1820, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1821, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1822, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1823, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1824, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1825, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1826, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1827, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1828, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1829, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1850, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1851, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1852, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1853, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1854, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1855, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1856, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1857, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1860, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1861, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1862, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1863, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1864, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1865, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1866, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1867, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1868, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1870, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1871, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1872, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1873, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1874, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1875, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1876, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1877, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1878, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1879, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1899, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1900, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1901, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1902, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1903, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1904, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1905, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1906, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1908, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1909, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1910, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1911, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1912, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1913, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1914, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1915, N'Frederiksberg C.')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1916, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1917, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1918, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1920, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1921, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1922, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1923, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1924, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1925, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1926, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1927, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1928, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1950, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1951, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1952, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1953, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1954, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1955, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1956, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1957, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1958, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1959, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1960, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1961, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1962, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1963, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1964, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1965, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1966, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1967, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1970, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1971, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1972, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1973, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1974, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1975, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (1976, N'Frederiksberg C.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2000, N'Frederiksberg.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2100, N'København Ø.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2200, N'København N.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2300, N'København S.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2400, N'København NV.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2450, N'København SV.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2500, N'Valby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2600, N'Glostrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2605, N'Brøndby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2610, N'Rødovre')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2620, N'Albertslund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2625, N'Vallensbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2630, N'Tåstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2635, N'Ishøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2640, N'Hedehusene')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2650, N'Hvidovre')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2660, N'Brøndby Strand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2665, N'Vallensbæk Strand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2670, N'Greve Strand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2680, N'Solrød Strand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2690, N'Karlslunde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2700, N'Brønshøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2720, N'Vanløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2730, N'Herlev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2740, N'Skovlunde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2750, N'Ballerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2760, N'Måløv')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2765, N'Smørum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2770, N'Kastrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2791, N'Dragør')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2800, N'Lyngby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2820, N'Gentofte')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2830, N'Virum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2840, N'Holte')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2850, N'Nærum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2860, N'Søborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2880, N'Bagsværd')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2900, N'Hellerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2920, N'Charlottenlund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2930, N'Klampenborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2942, N'Skodsborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2950, N'Vedbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2960, N'Rungsted Kyst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2970, N'Hørsholm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2980, N'Kokkedal')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (2990, N'Nivå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3000, N'Helsingør')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3050, N'Humlebæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3060, N'Espergærde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3070, N'Snekkersten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3080, N'Tikøb')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3100, N'Hornbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3120, N'Dronningmølle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3140, N'Ålsgårde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3150, N'Hellebæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3200, N'Helsinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3210, N'Vejby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3220, N'Tisvildeleje')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3230, N'Græsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3250, N'Gilleleje')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3300, N'Frederiksværk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3310, N'Ølsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3320, N'Skævinge')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3330, N'Gørløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3360, N'Liseleje')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3370, N'Melby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3390, N'Hundested')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3400, N'Hillerød')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3450, N'Allerød')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3460, N'Birkerød')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3480, N'Fredensborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3490, N'Kvistgård')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3500, N'Værløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3520, N'Farum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3540, N'Lynge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3550, N'Slangerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3600, N'Frederikssund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3630, N'Jægerspris')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3650, N'Ølstykke')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3660, N'Stenløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3670, N'Veksø Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3700, N'Rønne')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3720, N'Åkirkeby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3730, N'Neksø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3740, N'Svaneke')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3751, N'Øster-Marie')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3760, N'Gudhjem')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3770, N'Allinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3782, N'Klemensker')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3790, N'Hasle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3900, N'Nuuk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3905, N'Nuussuaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3910, N'Kangerlussuaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3911, N'Sisimiut')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3912, N'Maniitsoq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3913, N'Tasiilaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3915, N'Kulusuk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3920, N'Qaqortoq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3921, N'Narsaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3922, N'Nanortalik')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3923, N'Narsarsuaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3924, N'Ikerasassuaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3927, N'Angisoq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3930, N'Kangilinnguit')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3932, N'Arsuk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3940, N'Paamiut')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3950, N'Aasiaat')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3951, N'Qasigiannguit')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3952, N'Ilulissat')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3953, N'Qeqertarsuaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3955, N'Kangaatsiaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3961, N'Uummannaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3962, N'Upernavik')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3970, N'Pitufik')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3971, N'Qaanaaq')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3980, N'Ittoqqortoormiit')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3984, N'Danmarkshavn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3985, N'Constable Pynt')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (3992, N'Slædepatruljen Siriu')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4000, N'Roskilde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4040, N'Jyllinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4050, N'Skibby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4060, N'Kirke-Såby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4070, N'Kirke-Hyllinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4100, N'Ringsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4130, N'Viby Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4140, N'Borup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4160, N'Herlufmagle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4171, N'Glumsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4173, N'Fjenneslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4174, N'Jystrup Midtsj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4180, N'Sorø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4190, N'Munke-Bjergby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4200, N'Slagelse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4220, N'Korsør')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4230, N'Skælskør')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4241, N'Vemmelev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4242, N'Boeslunde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4243, N'Rude')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4250, N'Fuglebjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4261, N'Dalmose')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4262, N'Sandved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4270, N'Høng')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4281, N'Gørlev Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4291, N'Ruds-Vedby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4292, N'Skellebjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4293, N'Dianalund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4294, N'Vedde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4295, N'Stenlille')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4296, N'Nyrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4300, N'Holbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4320, N'Lejre')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4330, N'Hvalsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4340, N'Tølløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4350, N'Uggerløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4360, N'Kirke-Eskildstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4370, N'Store-Merløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4380, N'Nytup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4390, N'Vipperød')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4400, N'Kalundborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4420, N'Regstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4440, N'Mørkøv')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4450, N'Jyderup')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4460, N'Snertinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4470, N'Svebølle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4480, N'Store-Fuglede')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4490, N'Jerslev Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4500, N'Nykøbing Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4520, N'Svinninge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4532, N'Gislinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4534, N'Hørve')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4540, N'Fårevejle St')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4550, N'Asnæs')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4560, N'Vig St')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4571, N'Grevinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4572, N'Nørre-Asmindrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4573, N'Højby Sjælland')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4581, N'Rørvig')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4583, N'Sjællands Odde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4591, N'Føllenslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4592, N'Sejerø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4593, N'Eskebjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4600, N'Køge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4621, N'Gadstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4622, N'Havdrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4623, N'Lille-Skensved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4632, N'Bjæverskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4640, N'Fakse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4652, N'Hårlev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4653, N'Karise')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4654, N'Fakse Ladeplads')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4660, N'Store-Heddinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4670, N'Strøby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4671, N'Strøby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4672, N'Klippinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4673, N'Rødvig Stevns')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4681, N'Herfølge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4682, N'Tureby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4683, N'Rønnede')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4684, N'Holme-Olstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4690, N'Haslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4700, N'Næstved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4720, N'Præstø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4731, N'Brandelev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4733, N'Tappernøje')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4734, N'Allerslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4735, N'Mern')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4736, N'Karrebæksminde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4750, N'Lundby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4760, N'Vordingborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4771, N'Kalvehave')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4772, N'Langebæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4773, N'Stensved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4780, N'Stege')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4791, N'Borre')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4792, N'Askeby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4793, N'Bogø By')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4800, N'Nykøbing F')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4840, N'Nørre-Alslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4850, N'Stubbekøbing')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4862, N'Guldborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4863, N'Eskilstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4871, N'Horbelev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4872, N'Idestrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4873, N'Væggerløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4874, N'Gedser')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4880, N'Nysted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4891, N'Toreby L')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4892, N'Kettinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4894, N'Øster-Ulslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4895, N'Errindlev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4900, N'Nakskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4912, N'Harpelunde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4913, N'Horslunde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4920, N'Søllested')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4930, N'Maribo')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4941, N'Bandholm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4943, N'Torrig L')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4944, N'Fejø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4951, N'Nørreballe')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4952, N'Stokkemarke')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4953, N'Vesterborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4960, N'Holeby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4970, N'Rødby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4983, N'Dannemare')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (4990, N'Sakskøbing')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5000, N'Odense C')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5100, N'Odense C (postboks)')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5200, N'Odense V')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5210, N'Odense NV')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5220, N'Odense SØ')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5230, N'Odense M')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5240, N'Odense NØ')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5250, N'Odense SV')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5260, N'Odense S.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5270, N'Odense N')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5290, N'Marslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5300, N'Kerteminde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5320, N'Agedrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5330, N'Munkebo')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5350, N'Rynkeby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5370, N'Mesinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5380, N'Dalby')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5390, N'Martofte')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5400, N'Bogense')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5450, N'Otterup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5462, N'Morud')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5463, N'Harndrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5464, N'Brenderup Fyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5466, N'Asperup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5467, N'Røjle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5471, N'Søndersø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5474, N'Veflinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5475, N'Gamby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5482, N'Lumby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5483, N'Kappendrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5484, N'Uggerslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5485, N'Skamby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5486, N'Grindløse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5491, N'Blommenlyst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5492, N'Vissenbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5500, N'Middelfart')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5540, N'Ullerslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5550, N'Langeskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5560, N'Årup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5580, N'Nørre-Åby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5591, N'Gelsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5592, N'Ejby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5600, N'Fåborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5610, N'Assens')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5620, N'Glamsbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5631, N'Ebberup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5640, N'Horne Fyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5642, N'Millinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5653, N'Nørre-Lydelse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5672, N'Broby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5681, N'Bellinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5683, N'Hårby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5690, N'Tommerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5700, N'Svendborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5750, N'Ringe')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5762, N'Vester-Skerninge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5771, N'Stenstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5772, N'Kværndrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5792, N'Årslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5793, N'Højby Fyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5800, N'Nyborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5853, N'Ørbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5854, N'Gislev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5856, N'Ryslinge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5863, N'Ferritslev Fyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5871, N'Frørup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5874, N'Hesselager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5881, N'Skårup Fyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5882, N'Vejstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5883, N'Oure')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5884, N'Gudme')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5892, N'Gudbjerg Sydfyn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5900, N'Rudkøbing')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5932, N'Humble')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5935, N'Bagenkop')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5953, N'Tranekær')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5960, N'Marstal')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5970, N'Ærøskøbing')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (5985, N'Søby Ærø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6000, N'Kolding')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6040, N'Egtved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6051, N'Almind')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6052, N'Viuf')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6064, N'Jordrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6065, N'Veerst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6070, N'Christiansfeld')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6091, N'Bjert')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6092, N'Sønder Stenderup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6093, N'Sjølund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6094, N'Hejls')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6100, N'Haderslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6200, N'Åbenrå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6230, N'Rødekro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6240, N'Løgumkloster')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6252, N'Bedsted Lø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6254, N'Øster-Højst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6261, N'Bredebro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6270, N'Tønder')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6280, N'Højer')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6300, N'Gråsten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6310, N'Broager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6320, N'Egernsund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6330, N'Padborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6340, N'Kruså')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6360, N'Tinglev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6372, N'Bylderup-Bov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6382, N'Tørsbøl')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6392, N'Bolderslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6400, N'Sønderborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6430, N'Nordborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6440, N'Augustenborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6470, N'Syd Als')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6473, N'Tandslet')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6474, N'Skovby Als')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6500, N'Vojens')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6510, N'Gram')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6520, N'Toftlund')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6534, N'Agerskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6535, N'Branderup J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6541, N'Bevtoft')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6560, N'Sommersted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6580, N'Vamdrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6600, N'Vejen')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6621, N'Gesten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6622, N'Bække')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6623, N'Vorbasse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6630, N'Rødding')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6640, N'Lunderskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6650, N'Brørup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6660, N'Lintrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6670, N'Holsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6681, N'Holsted St')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6682, N'Hovborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6683, N'Føvling')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6690, N'Gørding')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6700, N'Esbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6701, N'Esbjerg (postboks)')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6705, N'Esbjerg Ø.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6710, N'Esbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6715, N'Esbjerg N.')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6720, N'Fanø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6731, N'Tjæreborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6732, N'Guldager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6740, N'Bramming')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6752, N'Glejbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6753, N'Agerbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6760, N'Ribe')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6771, N'Gredstedbro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6775, N'Døstrup Sønderj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6780, N'Skærbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6781, N'Kongsmark')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6792, N'Havneby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6800, N'Varde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6823, N'Ansager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6830, N'Nørre-Nebel')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6840, N'Oksbøl')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6851, N'Janderup Vestj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6852, N'Billum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6853, N'Vejers Strand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6854, N'Henne')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6855, N'Ovtrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6857, N'Blåvand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6862, N'Tistrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6870, N'Ølgod')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6880, N'Tarm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6893, N'Hemmet')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6900, N'Skjern')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6920, N'Videbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6933, N'Kibæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6940, N'Lem St')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6950, N'Ringkøbing')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6960, N'Hvide Sande')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6971, N'Spjald')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6973, N'Ørnhøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6980, N'Tim')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (6990, N'Ulfborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7000, N'Fredericia')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7080, N'Børkop')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7100, N'Vejle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7120, N'Vejle Øst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7130, N'Juelsminde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7140, N'Stouby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7150, N'Barrit')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7160, N'Tørring')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7171, N'Uldum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7173, N'Vonge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7182, N'Bredsten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7183, N'Ranbøl')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7184, N'Vandel')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7190, N'Billund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7200, N'Grindsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7250, N'Hejnsvig')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7260, N'Sdr. Omme')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7270, N'Stakroge')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7280, N'Sønder-Felding')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7300, N'Jelling')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7321, N'Gadbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7323, N'Give')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7330, N'Brande')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7361, N'Ejstrupholm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7362, N'Hampen')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7400, N'Herning')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7430, N'Ikast')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7441, N'Bording')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7442, N'Engesvang')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7451, N'Sunds')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7470, N'Karup J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7480, N'Vildbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7490, N'Avlum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7500, N'Holstebro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7540, N'Haderup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7550, N'Sørvad')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7560, N'Hjerm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7570, N'Vemb')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7600, N'Struer')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7620, N'Lemvig')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7650, N'Bøvlingbjerg')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7660, N'Bækmarksbro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7673, N'Harboøre')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7680, N'Thyborøn Havn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7700, N'Thisted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7730, N'Hanstholm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7741, N'Frøstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7742, N'Vesløs')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7752, N'Snedsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7755, N'Bedsted Thy')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7760, N'Hurup Thy')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7770, N'Vestervig')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7790, N'Thyholm')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7800, N'Skive')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7830, N'Vinderup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7840, N'Højslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7850, N'Stoholm Jyll')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7860, N'Spøttrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7861, N'Balling')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7870, N'Roslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7884, N'Fur')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7900, N'Nykøbing M')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7950, N'Erslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7960, N'Karby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7970, N'Redsted M')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7980, N'Vils')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (7990, N'Øster-Assels')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8000, N'Århus C')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8100, N'Århus C (postboks)')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8200, N'Århus N')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8210, N'Århus V')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8220, N'Brabrand')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8230, N'Åbyhøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8240, N'Risskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8250, N'Egå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8260, N'Viby J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8270, N'Højbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8280, N'Trige')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8300, N'Odder')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8305, N'Samsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8310, N'Tranbjerg J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8320, N'Mårslet')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8330, N'Beder')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8340, N'Malling')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8355, N'Solbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8361, N'Hasselager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8362, N'Hørning')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8370, N'Hadsten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8381, N'Mundelstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8382, N'Hinnerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8400, N'Ebeltoft')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8410, N'Rønde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8420, N'Knebel')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8444, N'Balle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8450, N'Hammel')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8462, N'Harlev J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8464, N'Galten')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8471, N'Sabro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8472, N'Sporup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8500, N'Grenå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8520, N'Lystrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8530, N'Hjortshøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8541, N'Skødstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8543, N'Hornslet')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8544, N'Mørke')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8550, N'Ryomgård')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8560, N'Kolind')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8570, N'Trustrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8581, N'Nimtofte')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8584, N'Tranehuse')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8585, N'Glesborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8586, N'Ørum Djurs')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8592, N'Anholt')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8600, N'Silkeborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8620, N'Kjellerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8632, N'Lemming')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8641, N'Sorring')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8643, N'Ans By')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8653, N'Them')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8654, N'Bryrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8660, N'Skanderborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8670, N'Låsby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8680, N'Ry')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8700, N'Horsens')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8721, N'Daugård')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8722, N'Hedensted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8723, N'Løsning')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8732, N'Hovedgård')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8740, N'Brædstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8751, N'Gedved')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8752, N'Østbirk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8762, N'Flemming')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8763, N'Rask Mølle')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8765, N'Klovborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8766, N'Nørre-Snede')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8771, N'Hundslund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8781, N'Stenderup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8783, N'Hornsyld')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8791, N'Tranebjerg Samsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8795, N'Nordbu Samsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8799, N'Tunø Kattegat')
GO
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8800, N'Viborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8830, N'Tjele')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8831, N'Løgstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8832, N'Skals')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8833, N'Ørum Sønderlyng')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8834, N'Hammershøj')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8840, N'Rødkærsbro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8850, N'Bjerringbro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8860, N'Ulstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8870, N'Langå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8881, N'Thorsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8882, N'Fårvang')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8883, N'Gjern')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8900, N'Randers')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8950, N'Ørsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8961, N'Allingåbro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8963, N'Auning')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8970, N'Havndal')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8981, N'Spentrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8983, N'Gjerlev J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (8990, N'Fårup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9000, N'Ålborg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9100, N'Ålborg (postboks)')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9200, N'Ålborg SV')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9210, N'Ålborg SØ')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9220, N'Ålborg Øst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9230, N'Svenstrup J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9240, N'Nibe')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9260, N'Gistrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9270, N'Klarup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9280, N'Storvorde')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9293, N'Kongerslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9300, N'Sæby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9310, N'Vodskov')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9320, N'Hjallerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9330, N'Dronninglund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9340, N'Aså')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9352, N'Dybvad')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9362, N'Gandrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9370, N'Hals')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9380, N'Vestbjerg')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9382, N'Tylstrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9400, N'Nørresundby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9430, N'Vadum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9440, N'Åbybro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9460, N'Brovst')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9480, N'Løkken')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9490, N'Pandrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9491, N'Pandrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9492, N'Blokhus')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9493, N'Saltum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9500, N'Hobro')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9510, N'Arden')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9520, N'Skørping')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9530, N'Støvring')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9541, N'Suldrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9550, N'Mariager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9560, N'Hadsund')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9574, N'Bælum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9575, N'Terndrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9600, N'Års')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9610, N'Nørager')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9620, N'Ålestrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9631, N'Gedsted')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9632, N'Møldrup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9640, N'Farsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9670, N'Løgstør')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9681, N'Ranum')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9690, N'Fjerritslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9700, N'Brønderslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9740, N'Jerslev J')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9750, N'Øster-Vrå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9760, N'Vrå')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9800, N'Hjørring')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9821, N'Ålborg SØ')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9830, N'Tårs')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9850, N'Hirtshals')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9870, N'Sindal')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9876, N'Paddrup Ø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9881, N'Bindslev')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9891, N'Tolne')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9900, N'Frederikshavn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9940, N'Læsø')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9950, N'Vesterø Havn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9960, N'Østerby Havn')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9970, N'Stransby')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9981, N'Jerup')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9982, N'Ålbæk')
INSERT [dbo].[Postcode_City] ([PK_Post_code], [City]) VALUES (9990, N'Skagen')
go

--Bulk insert Postcode_city
--from 'C:\Program Files\Microsoft SQL Server\Postnummer.txt'
--with
--(
--  codepage = 'ACP',
--  batchsize = 250,
--  datafiletype = 'char',
--  fieldterminator = ',',
--  rowterminator = '\n',
--  maxerrors = 50,
--  tablock )
--  go

insert into User_Information values
('Hans','Lassen','1992-02-22','Mand','Sexpartner',1100,'Hanslassen@gmail.com','Gift','Homoseksuel',180,90,'Grønne','Brunt','Ja, udebornde','Muskuløs','Jeg vil udforske min sexualitiy i mit kedelig gifte liv.','Frækfyr42'),
('Erna','Eriksen','1980-03-24','Kvinde','Forhold',1700,'minernamail@hotmail.com','Skildt','Heteroseksuel',165,80,'Brunne','Lyst','Nej','Slank','Søger en mand som gerne vil have børn.','smukkesøde17'),
('Frank','Ludzlow','1942-01-21','Mand','Venner',1900,'mingamlemail@hotmail.com','Skildt','Biseksuel',170,85,'Blå','Gråt','Ja, udeboende','Buttet','Søger nogle venner som jeg kan tale med.','Flottefyr'),
('Inger','Packard','1966-09-14','Kvinde','Sexpartner',2000,'ingermanglersex@gmail.com','Skildt','Heteroseksuel',175,115,'Brunt','Gråt','Nej','Buttet','Leder efter som er med på lidt vildt og frækt','SweetKristy'),
('Freja','Gade','1988-11-11','Kvinde','Sexpartner',2100,'Frejafræk@gmail.com','Single','Heteroseksuel',165,73,'Blå','Sort','Nej','Atletisk','Kunne godt tænke mig en som vil udforske min krop','KristyHoney'),
('Angel','Berg','1992-10-14','Kvinde','Forhold',2200,'flottemus@gmail.com','Single','Heteroseksuel',160,76,'Grønne','Brunt','Nej','Gennemsnitlig','Hej','BubblySnowflake'),
('Emma','Bundgård','1969-12-24','Kvinde','Venner',2300,'Emmabundgård@gmail.com','Skildt','Heteroseksuel',153,73,'Brunne','Sort','Nej','Gennemsnitlig',' ','AngelicPrincessKristy'),
('Ida','Jensen','1993-09-22','Kvinde','Forhold',1200,'idajensen@gmail.com','Single','Heteroseksuel',154,66,'Blå','Sort','Nej','Gennemsnitlig','Leder efter en kærste der vil opleve ting med mig','FairyPrincessKristy'),
('Anna','Iversen','1997-08-12','Kvinde','Venner',1400,'Annaiversen@gmail.com','Single','Homoseksuel',157,68,'Brunne','Lyst','Nej','Gennemsnitlig','Hej mit navn er anna og jeg kunne godt tænke mig nogle homoseksuel venner at hænge ud med','BabyKristyButterfly'),
('Alfred','Dahl','1996-06-11','Mand','Sexpartner',2400,'alfreddahl@gmail.com','I forhold','Heteroseksuel',166,76,'Brunne','Lyst','Nej','Gennemsnitlig','Davs kunne godt tænke mig at få lidt mere gang i den.','BamboozledByPaperClips'),
('Palle','Laan','1991-09-22','Mand','Forhold',2500,'pallelaan@gmail.com','Single','Biseksuel',167,88,'Grønne','Sort','Nej','Gennemsnitlig','Leder efter en partner','SmartyPants'),
('Anton','Overtraak','1993-07-15','Mand','Sexpartner',2600,'antonovertræk@gmail.com','Single','Homoseksuel',188,98,'Brunne','Lyst','Nej','Gennemsnitlig','Hej, din flottefyr ;)','NerdyNinjaHugs'),
('Elias','Anderassen','1989-03-19','Mand','Forhold',2700,'eliasanderassen@gmail.com','Single','Heteroseksuel',176,96,'Grønne','Andet','Nej','Gennemsnitlig','Hej, jeg er på udkig efter at dele min hverdage med og har det godt sammen med','LaughingMyAssOff'),
('Clare','Jakobsen','1987-04-13','Kvinde','Forhold',2800,'clarejakobsen@gmail.com','Single','Heteroseksuel',174,54,'Blå','Andet','Nej','Spinkel','Leder efter en sød dreng :)','LipsPotatoChips'),
('Malthe','Bjerregård','1986-01-11','Mand','Venner',2900,'malthebjerregård@gmail.com','Gift','Heteroseksuel',172,87,'Blå','Andet','Ja, Hjemmeboende','Kraftig','Davs der ude, leder efter nogle man kan sidde og hav en bejer med og på samme tid se lidt sport','RascalRoger'),
('Emil','Carlsen','1987-07-02','Mand','Forhold',3000,'emilcarlsen@gmail.com','Single','Heteroseksuel',169,85,'Brunne','Gråt','Nej','Buttet','Leder en sød dame jeg gerne vil stifte en familie med.','RazzleDazzle'),
('Alma','Ahmad','1984-08-03','Kvinde','Forhold',3100,'almaahmad@gmail.com','Single','Heteroseksuel',164,81,'Brunne','Sort','Nej','Kraftig','Hej mit navn er alma og jeg vil gerne have børn ja.','NotASnobRob')
go

insert into Picture(FK_InfoID, Picture) Values
(1,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_1.jpg', SINGLE_BLOB) as image)),
(2,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_2.jpg', SINGLE_BLOB) as image)),
(3,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_3.png', SINGLE_BLOB) as image)),
(4,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_4.jpg', SINGLE_BLOB) as image)),
(5,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_5.jpg', SINGLE_BLOB) as image)),
(6,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_6.jpg', SINGLE_BLOB) as image)),
(7,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_7.jpg', SINGLE_BLOB) as image)),
(8,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_8.jpg', SINGLE_BLOB) as image)),
(9,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_9.jpg', SINGLE_BLOB) as image)),
(10,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_10.jpg', SINGLE_BLOB) as image)),
(11,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_11.jpg', SINGLE_BLOB) as image)),
(12,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_12.jpg', SINGLE_BLOB) as image)),
(13,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_13.jpg', SINGLE_BLOB) as image)),
(14,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_14.jpg', SINGLE_BLOB) as image)),
(15,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_15.jpg', SINGLE_BLOB) as image)),
(16,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_16.jpg', SINGLE_BLOB) as image)),
(17,(SELECT * FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\Person_17.jpg', SINGLE_BLOB) as image))
go

insert into [Message] Values
('NerdyNinjaHugs','Frækfyr42','Hej'),
('Frækfyr42','NerdyNinjaHugs','Hej'),
('NerdyNinjaHugs','Frækfyr42','magisk sød besked'),
('Flottefyr','KristyHoney','Hej'),
('Flottefyr','KristyHoney','Ser godt ud :)'),
('KristyHoney','Flottefyr','Mange tak, du ser heller ikke værst ud'),
('BubblySnowflake','LaughingMyAssOff','Hej du :) '),
('LaughingMyAssOff','BubblySnowflake','How are you doing ? :)'),
('NerdyNinjaHugs','SmartyPants','Hej'),
('NerdyNinjaHugs','SmartyPants','Hvad laver du ? '),
('SmartyPants','NerdyNinjaHugs','Står på min profil :)'),
('BabyKristyButterfly','LaughingMyAssOff','Davs ser du også søger nogle venner, hvad kan du lide at lave og sådan ?'),
('LaughingMyAssOff','BabyKristyButterfly','Jeg kan lide at tage i byen og ude at spise.'),
('SweetKristy','BamboozledByPaperClips','Hej'),
('BamboozledByPaperClips','SweetKristy','Hej, tænkte på om en sød pige som dig ville mødes.'),
('smukkesøde17','SmartyPants','Hej'),
('smukkesøde17','SmartyPants','Jeg er lidt genert og har ikke prøvet at skrive om sådan her nogle sider før, men synes du så sød ud og tænkte om du ville skrive lidt med mig.'),
('SmartyPants','smukkesøde17','Hej Erna, det vil jeg meget gerne. Jeg tænkte på om vi måske skulle mødes over en kopkaffe så vi bedre kan lære hinanden at kende.'),
('AngelicPrincessKristy','BabyKristyButterfly','hej')
go

select * from [User]
select * from [Postcode_City]
select * from [User_Information]
select * from [Picture]
select * from [Message]

select DISTINCT FK_Reciver, FK_Sender from [Message] where FK_sender = 'Flottefyr' or FK_Reciver = 'Flottefyr';

go
--create index User_information_Index_
--on dbo.User_Information (Birthdate,Gender,Seeking,Status,Sexual_orientation,Children);
--go

DROP PROCEDURE spCreate_New_User
go
create PROCEDURE spCreate_New_User
(
	@PK_Profile_name nvarchar(50),
	@Password nvarchar(50),
	@Creation_Date datetime,
	@User_aktiv bit 
)
as
begin
	insert into [User] values(@PK_Profile_name,@Password,@Creation_Date,1)
	RETURN
end
go



DROP PROCEDURE spCreate_User_information
go

create PROCEDURE spCreate_User_information
	@First_name nvarchar(50),
	@Last_name nvarchar(50),
	@Birthdate date,
	@Gender nvarchar(50),
	@Seeking nvarchar(50),
	@FK_Post_Code int,
	@Email nvarchar(100),
	@Status nvarchar(50),
	@Sexual_orientation nvarchar(50),
	@Height int,
	@Weight int,
	@Eyecolor nvarchar(50),
	@Haircolor nvarchar(50),
	@Children nvarchar(50),
	@Body_Type nvarchar(50),
	@About_Yourself nvarchar(400),
	@FK_Profile_name nvarchar(50)
as
begin
	set nocount on;
	insert into [User_Information] ([First_name],[Last_name],[Birthdate],[Gender],[Seeking],[FK_Post_Code],[Email],[Status],[Sexual_orientation],[Height],[Weight],[Eyecolor],[Haircolor],[Children],[Body_Type],[About_Yourself],[FK_Profile_name])
	values 	
	(@First_name,@Last_name,@Birthdate,@Gender,@Seeking,@FK_Post_Code,@Email,@Status,@Sexual_orientation,@Height,@Weight,@Eyecolor, @Haircolor,@Children, @Body_Type,@About_Yourself,@FK_Profile_name);
end
go



DROP PROCEDURE spSearch_User
go

CREATE PROCEDURE spSearch_User
	@FK_Profile_name nvarchar(50),
	@Gender nvarchar(50),
	@Sexual_orientationSynd nvarchar(50)
as
begin
select b.FK_Profile_name, b.First_name, b.Last_name, b.Birthdate, b.Gender,b.Seeking,b.FK_Post_Code,b.Email,b.[Status], b.Sexual_orientation,b.Height,b.[Height],b.[Weight],b.Eyecolor,b.Haircolor,b.Children,b.Body_Type,b.About_Yourself,b.FK_Profile_name 
from User_Information a, User_Information b
where a.FK_Profile_name = @FK_Profile_name
AND (a.Sexual_orientation = b.Sexual_orientation or b.Sexual_orientation = @Sexual_orientationSynd)
AND a.Seeking = b.Seeking
AND b.Gender like @Gender
except 
select b.FK_Profile_name, b.First_name as bTable_First_name, b.Last_name, b.Birthdate, b.Gender,b.Seeking,b.FK_Post_Code,b.Email,b.[Status], b.Sexual_orientation,b.Height,b.[Height],b.[Weight],b.Eyecolor,b.Haircolor,b.Children,b.Body_Type,b.About_Yourself,b.FK_Profile_name 
from User_Information a, User_Information b
where b.FK_Profile_name = @FK_Profile_name
end
go


--as bTable_First_name

select b.FK_Profile_name, b.First_name as bTable_First_name, b.Last_name, b.Birthdate, b.Gender,b.Seeking,b.FK_Post_Code,b.Email,b.[Status], b.Sexual_orientation,b.Height,b.[Height],b.[Weight],b.Eyecolor,b.Haircolor,b.Children,b.Body_Type,b.About_Yourself,b.FK_Profile_name 
from User_Information a, User_Information b
where a.FK_Profile_name = 'Frækfyr42'
AND a.Sexual_orientation = b.Sexual_orientation
AND a.Seeking = b.Seeking
AND b.Gender like 'M%'
except 
select b.FK_Profile_name, b.First_name as bTable_First_name, b.Last_name, b.Birthdate, b.Gender,b.Seeking,b.FK_Post_Code,b.Email,b.[Status], b.Sexual_orientation,b.Height,b.[Height],b.[Weight],b.Eyecolor,b.Haircolor,b.Children,b.Body_Type,b.About_Yourself,b.FK_Profile_name 
from User_Information a, User_Information b
where b.FK_Profile_name = 'Frækfyr42'


--a.Sexual_orientation = b.Sexual_orientation
--and user = Sexual_orientation
--and Gender = Gender


-- Få alle schemanames Objectnames indexnames med keys og indexs
--
--
--SELECT  OBJECT_SCHEMA_NAME(ind.object_id) AS SchemaName
--      , OBJECT_NAME(ind.object_id) AS ObjectName
--      , ind.name AS IndexName
--      , ind.is_primary_key AS IsPrimaryKey
--      , ind.is_unique AS IsUniqueIndex
--      , col.name AS ColumnName
--      , ic.is_included_column AS IsIncludedColumn
--      , ic.key_ordinal AS ColumnOrder
--FROM    sys.indexes ind
--        INNER JOIN sys.index_columns ic
--            ON ind.object_id = ic.object_id
--               AND ind.index_id = ic.index_id
--        INNER JOIN sys.columns col
--            ON ic.object_id = col.object_id
--               AND ic.column_id = col.column_id
--        INNER JOIN sys.tables t
--            ON ind.object_id = t.object_id
--WHERE   t.is_ms_shipped = 0
--ORDER BY OBJECT_SCHEMA_NAME(ind.object_id) --SchemaName
--      , OBJECT_NAME(ind.object_id) --ObjectName
--      , ind.is_primary_key DESC
--      , ind.is_unique DESC
--      , ind.name --IndexName
--      , ic.key_ordinal
--go