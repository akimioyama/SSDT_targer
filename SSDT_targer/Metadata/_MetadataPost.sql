/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

PRINT N'Заполнение';

SET NOCOUNT ON
GO
MERGE INTO [dbo].[Role] AS Target
USING (VALUES
    (1, N'admin',1,1,1,1),
    (2, N'manager',1,0,1,1),
    (3, N'ordinary_user',0,0,1,1)
) AS Source ([role_id], [role_name], [change_events], [change_users], [read_events], [commented_events])
ON (Target.[role_id] = Source.[role_id])
WHEN MATCHED THEN
 UPDATE SET
    [role_name] = Source.[role_name],
    [change_events] = Source.[change_events],
    [change_users] = Source.[change_users],
    [read_events] = Source.[read_events],
    [commented_events] = Source.[commented_events]

 WHEN NOT MATCHED BY TARGET THEN
    INSERT([role_id], [role_name], [change_events], [change_users], [read_events], [commented_events])
    VALUES(Source.[role_id], Source.[role_name], Source.[change_events], Source.[change_users], 
    Source.[read_events], Source.[commented_events]);
GO

MERGE INTO [dbo].[User] AS Target
USING (VALUES
(1, 1, N'admin', N'123123', N'qwe@qwe.ru', N'Иванов Иван'),
(2, 2, N'manager', N'123123', N'qwe1@qwe.ru', N'Кириллов Кирилл'),
(3, 3, N'ordinary_user', N'12313', N'qwe2@qwe.ru', N'Антон')
) AS Source ([Id], [role_id], [login], [password], [email], [FIO])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED THEN
UPDATE SET
[role_id] = Source.[role_id],
[login] = Source.[login],
[password] = Source.[password],
[email] = Source.[email],
[FIO] = Source.[FIO]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([Id], [role_id], [login], [password], [email], [FIO])
VALUES (Source.[Id], Source.[role_id], Source.[login], Source.[password], Source.[email], Source.[FIO]);
GO
SET NOCOUNT OFF
GO

:r .\test.sql
