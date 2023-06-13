CREATE FUNCTION [dbo].[getAllLoginByIPFunction]
(
	@IP_address nvarchar(50)
)
RETURNS @InfoByIP_address TABLE
(
	[login] NVARCHAR(50),
	[Id] INT,
	[last_login_time] DATETIMEOFFSET,
	[device_settings] NVARCHAR(50)
)
AS
BEGIN
	INSERT @InfoByIP_address
	SELECT [User].[login], [User].[Id], [HistoryLogin].[last_login_time], [HistoryLogin].[device_settings] 
	FROM [dbo].[HistoryLogin] JOIN [dbo].[User] 
	ON [HistoryLogin].user_id = [User].Id
	WHERE [HistoryLogin].IP = @IP_address
	RETURN
END
