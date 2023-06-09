CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL, 
    [role_id] INT NOT NULL, 
    [login] VARCHAR(50) NOT NULL, 
    [password] VARCHAR(50) NOT NULL, 
    [email] VARCHAR(50) NULL, 
    [FIO] VARCHAR(80) NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id]), 
	CONSTRAINT [AK_Users_Login] UNIQUE ([login]),
    CONSTRAINT [FK_Users_ToRoles] FOREIGN KEY ([role_id]) REFERENCES [Role]([role_id])
)
