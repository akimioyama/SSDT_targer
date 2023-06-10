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

PRINT 'Заполнение';

SET NOCOUNT ON
GO
MERGE INTO [dbo].[Role] AS Target
USING (VALUES
    (1,'admin',1,1,1,1),
    (2,'manager',1,0,1,1),
    (3,'ordinary_user',0,0,1,1)
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
    VALUES(Source.[role_id], Source.[role_name], Source.[change_events], 
    Source.[read_events], Source.[commented_events]);
GO

MERGE INTO [dbo].Users AS Target
USING (VALUES
    (1,1, 'admin', '123123','qwe@qwe.ru', 'Иванов Иван Иванович'),
    (2,2, 'manager', '123123','qwe1@qwe.ru', 'Кириллов Кирилл Кириллович'),
    (3,3, 'ordinary_user', '12313','qwe2@qwe.ru', 'Антон')
) AS Source ([Id], [role_id] , [login] , [password] ,[email], [FIO])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED THEN
 UPDATE SET
    [role_id] = Source.[role_id],
    [login] = Source.[login],
    [password] = Source.[password],
    [email] = Source.[email],
    [FIO] = Source.[FIO]

 WHEN NOT MATCHED BY TARGET THEN
    INSERT([Id], [role_id] , [login] , [password] ,[email], [FIO])
    VALUES(Source.[Id], Source.[role_id] , Source.[login] , Source.[password] , Source.[email],Source.[FIO]);
GO
SET NOCOUNT OFF
GO

