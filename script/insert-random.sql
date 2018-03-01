DECLARE @cnt INT = 0;
DECLARE @name varchar(20);
DECLARE @email varchar(50);

WHILE @cnt < 10000000

BEGIN
	SELECT @name = CONVERT(varchar(255), NEWID())
	SELECT @email = CONVERT(varchar(255), NEWID())
	insert into dbo.profile values(@cnt, @name, @email)
	SET @cnt = @cnt + 1;
END
