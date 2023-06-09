CREATE PROCEDURE [dbo].[delOldLogins]
AS
BEGIN 
	DELETE FROM dbo.HistoryLogin WHERE HistoryLogin.last_login_time <= GETUTCDATE()
END
