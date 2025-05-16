-- Scalar Function - Exercise: 1
CREATE FUNCTION ufn_CheckEmailId(
    @EmailId VARCHAR(50)
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT
    IF NOT EXISTS (SELECT EmailId FROM Users WHERE EmailId=@EmailId)
        SET @Result=0
    ELSE
        SET @Result=1
    RETURN @Result
END 
GO

SELECT dbo.ufn_CheckEmailId('Albert@gmail.com') AS Result
SELECT dbo.ufn_CheckEmailId('Albert3@gmail.com') AS Result

SELECT * FROM Users
GO


-- Scalar Function - Exercise: 2
CREATE FUNCTION ufn_ValidateUserCredentials(
	@EmailId VARCHAR(50),
	@UserPassword VARCHAR(15)

)
RETURNS INT
AS
BEGIN
	DECLARE @ReturnValue INT
	IF EXISTS(SELECT 1 FROM Users WHERE EmailId=@EmailId AND UserPassword=@UserPassword)
		SELECT @ReturnValue=RoleId FROM Users WHERE EmailId=@EmailId AND UserPassword=@UserPassword
	ELSE
	 SET @ReturnValue=-1
	RETURN @ReturnValue
END
GO

SELECT dbo.ufn_ValidateUserCredentials('Carine@gmail.com','VICTE@1234') AS Result
GO

-- Efficent because it has single query
CREATE FUNCTION ufn_ValidateUserCredentials(
    @EmailId VARCHAR(50),
    @UserPassword VARCHAR(15)
)
RETURNS INT
AS
BEGIN
    DECLARE @ReturnValue INT

    SELECT @ReturnValue = RoleId 
    FROM Users 
    WHERE EmailId = @EmailId AND UserPassword = @UserPassword

    IF @ReturnValue IS NULL
        SET @ReturnValue = -1

    RETURN @ReturnValue
END
GO
