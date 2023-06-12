CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL, 
    [role_id] INT NOT NULL, 
    [login] NVARCHAR(50) NOT NULL, 
    [password] NVARCHAR(50) NOT NULL, 
    [email] NVARCHAR(50) NULL, 
    [FIO] NVARCHAR(50) NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id]), 
	CONSTRAINT [AK_Users_Login] UNIQUE ([login]),
    CONSTRAINT [FK_Users_ToRoles] FOREIGN KEY ([role_id]) REFERENCES [Role]([role_id])
)
