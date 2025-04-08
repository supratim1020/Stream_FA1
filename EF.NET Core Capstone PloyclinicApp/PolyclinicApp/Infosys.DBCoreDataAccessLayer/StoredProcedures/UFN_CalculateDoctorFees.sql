CREATE FUNCTION ufn_CalculateDoctorFees(
	@DoctorID CHAR(3),
	@DateofAppointment DATE
)
RETURNS INT
AS
BEGIN
	DECLARE @FeesAmount INT
		SELECT @FeesAmount=SUM(D.Fees)*0.6 
		FROM Doctors D LEFT JOIN Appointments A 
		ON D.DoctorID=A.DoctorID
		WHERE D.DoctorID=@DoctorID
		AND A.DateofAppointment=@DateofAppointment
		GROUP BY D.DoctorID

	RETURN @FeesAmount
END
GO

SELECT dbo.ufn_CalculateDoctorFees('D2','2025-04-11')


-- Rough
SELECT SUM(D.Fees)*0.6 
FROM Doctors D LEFT JOIN Appointments A 
ON D.DoctorID=A.DoctorID
WHERE D.DoctorID='D2' 
AND A.DateofAppointment='2025-04-11'
GROUP BY D.DoctorID

SELECT * 
FROM Doctors D LEFT JOIN Appointments A 
ON D.DoctorID=A.DoctorID
WHERE D.DoctorID='D2' 
AND A.DateofAppointment='2025-04-11'