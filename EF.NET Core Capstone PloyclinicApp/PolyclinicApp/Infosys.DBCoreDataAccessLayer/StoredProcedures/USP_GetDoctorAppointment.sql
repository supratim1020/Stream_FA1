CREATE PROCEDURE usp_GetDoctorAppointment(
	@PatientID CHAR(4),
	@DoctorID CHAR(3),
	@DateOfAppoinment DATE,
	@AppointmentNo INT OUT
)
AS
BEGIN
	BEGIN TRY
	IF NOT EXISTS(SELECT PatientID FROM Patients WHERE PatientID=@PatientID)
		RETURN -1

	IF NOT EXISTS(SELECT DoctorID FROM Doctors WHERE DoctorID=@DoctorID)
		RETURN -2

	IF @DateOfAppoinment<CAST(GETDATE() AS DATE)
		RETURN -3
	
	IF EXISTS(SELECT 1 FROM Appointments WHERE PatientID=@PatientID AND DoctorID=@DoctorID AND DateofAppointment=@DateOfAppoinment)
		RETURN 2
	
	INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(@AppointmentNo,@PatientID,@DoctorID,@DateOfAppoinment)
	
	SELECT @AppointmentNo=ISNULL(MAX(AppointmentNo),0)+1 FROM Appointments
	
	RETURN 1
	END TRY
	
	BEGIN CATCH
		RETURN -99
	END CATCH
END
GO


DECLARE @Result INT, @ApptNo INT
EXEC @Result = usp_GetDoctorAppointment
					@PatientID='P101',
					@DoctorID='D1',
					@DateOfAppoinment='2025-04-06',
					@AppointmentNo=@ApptNo OUT

SELECT @Result AS StatusCode, @ApptNo AS GeneratedAppointmentNo;
				

DROP PROCEDURE usp_GetDoctorAppointment