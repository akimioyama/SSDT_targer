CREATE TABLE [dbo].[Role]
(
	[role_id] INT NOT NULL, 
    [role_name] VARCHAR(50) NOT NULL, 
    [change_events] BIT NOT NULL, 
    [change_users] BIT NOT NULL, 
    [read_events] BIT NOT NULL, 
    [commented_events] BIT NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([role_id])
)
