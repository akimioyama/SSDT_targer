CREATE TABLE [dbo].[HistoryLogin]
(
	[Id] INT NOT NULL, 
    [user_id] INT NOT NULL, 
    [last_login_time] DATETIMEOFFSET NOT NULL, 
    [IP] VARCHAR(50) NOT NULL, 
    [device_settings] VARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_LoginsHistory] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_LoginsHistory_ToUsers] FOREIGN KEY ([user_id]) REFERENCES [User]([Id]))
