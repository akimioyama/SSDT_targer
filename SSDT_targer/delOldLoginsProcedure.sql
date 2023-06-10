CREATE PROCEDURE [dbo].[delOldLogins]
AS
BEGIN 
	DECLARE @target DATETIMEOFFSET
	SET @target = DATEADD(YEAR, -5, SYSDATETIMEOFFSET())

	DELETE FROM [dbo].[HistoryLogin]
	WHERE HistoryLogin.last_login_time <= @target
END
