CREATE FUNCTION ufn_FetchAllAppointments(
	@DoctorID CHAR(3),
	@DateofAppointment DATE
)
RETURNS @AppointmentDetails TABLE(DoctorName VARCHAR(50), Specialization VARCHAR(40),PatientID CHAR(4), PatientName VARCHAR(40),AppointmentNo INT)
AS
BEGIN
	INSERT @AppointmentDetails
	SELECT D.DoctorName, D.Specialization, A.PatientID, P.PatientName, A.AppointmentNo FROM
			Doctors D  INNER JOIN Appointments A ON D.DoctorID=A.DoctorID
			INNER JOIN Patients P ON A.PatientID=P.PatientID
			WHERE A.DoctorID=@DoctorID AND A.DateofAppointment=@DateofAppointment
	RETURN
END
GO


select * from ufn_FetchAllAppointments('D1','4/21/2025')
DROP FUNCTION ufn_FetchAllAppointments

SELECT D.DoctorName, D.Specialization, A.PatientID, P.PatientName, A.AppointmentNo FROM
Doctors D  INNER JOIN Appointments A ON D.DoctorID=A.DoctorID
INNER JOIN Patients P ON A.PatientID=P.PatientID
WHERE DateofAppointment='4/21/2025'