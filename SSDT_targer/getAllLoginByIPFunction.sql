CREATE FUNCTION [dbo].[getAllLoginByIPFunction]
(
	@IP_address nvarchar(50)
)
RETURNS @InfoByIP_address TABLE
(
	[Id] INT,
	[user_id] INT,
	[last_login_time] DATETIMEOFFSET,
	[device_settings] NVARCHAR(50)
)
AS
BEGIN
	INSERT @InfoByIP_address
	SELECT [Id],[user_id],[last_login_time],[device_settings] 
	FROM [dbo].[HistoryLogin] WHERE [HistoryLogin].Id = @IP_address
	RETURN
END
