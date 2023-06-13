CREATE PROCEDURE [dbo].[getInfoLoginByIDProcedure]
	@id_user INT
AS
BEGIN
	SELECT [Id], [last_login_time], [IP], [device_settings]
	FROM [dbo].[HistoryLogin] 
	WHERE [HistoryLogin].user_id = @id_user
END
