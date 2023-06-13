CREATE FUNCTION [dbo].[getAllLoginByIPFunction]
(
	@IP_address nvarchar(50)
)
RETURNS @InfoByIP_address TABLE
(
	[login] NVARCHAR(50),
	[Id] INT
)
AS
BEGIN
	INSERT @InfoByIP_address
	SELECT [User].[login], [User].[Id] 
	FROM [dbo].[HistoryLogin] JOIN [dbo].[User] 
	ON [HistoryLogin].user_id = [User].Id
	WHERE [HistoryLogin].IP = @IP_address
	RETURN
END
