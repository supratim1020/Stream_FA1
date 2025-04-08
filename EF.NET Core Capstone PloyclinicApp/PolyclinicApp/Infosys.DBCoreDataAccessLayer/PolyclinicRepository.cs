using Infosys.DBCoreDataAccessLayer.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infosys.DBCoreDataAccessLayer
{
    public class PolyclinicRepository
    {
        private PolyclinicDbContext context;
        public PolyclinicRepository(PolyclinicDbContext context) { 
            this.context = context;
        }

        // test
        //public List<Doctor> GetAllDoctors()
        //{
        //    List<Doctor> listOfDoctors=new List<Doctor>();
        //    listOfDoctors = context.Doctors.OrderBy(d => d.DoctorId).ToList();

        //    return listOfDoctors;            
        //}

        public bool AddNewPatientDetails(Patient patientObj)
        {
            bool status = false;
            try
            {
                context.Patients.Add(patientObj);
                context.SaveChanges();
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

        public Decimal CalculateDoctorFees(string doctorId, DateTime date)
        {
            Decimal doctorFees = 0.0M;
            try
            {
                doctorFees = (from fees in context.Doctors
                              select PolyclinicDbContext.ufn_CalculateDoctorFees(doctorId,date)).FirstOrDefault();
            }
            catch (Exception)
            {
                doctorFees = 0.0M;
            }
            return doctorFees;
        }

        public int CancelAppointment(int appointmentNo)
        {
            int status=0;
            Appointment appointmentObj = new Appointment();
            try
            {
                appointmentObj = context.Appointments.Find(appointmentNo);
                if (appointmentObj != null) 
                { 
                    context.Appointments.Remove(appointmentObj);
                    context.SaveChanges();
                    status = 1;
                }
            }
            catch (Exception)
            {
                status=0;
            }
            return status;


        }

        public List<ListOfAppointments> FetchAllAppointments(string doctorId, DateTime date)
        {
            List<ListOfAppointments>listOfAppointments = new List<ListOfAppointments>();
            try
            {
                SqlParameter prmDoctorID = new SqlParameter("@DoctorID", System.Data.SqlDbType.Char, 3);
                prmDoctorID.Value = doctorId;

                SqlParameter prmDateofAppointment = new SqlParameter("@DateofAppointment", System.Data.SqlDbType.Date);
                prmDateofAppointment.Value = date;

                listOfAppointments = context.ListOfAppointments.FromSqlRaw("SELECT * FROM ufn_FetchAllAppointments(@DoctorID,@DateofAppointment)", 
                                                                            prmDoctorID,prmDateofAppointment).ToList();
            }
            catch (Exception)
            {
                listOfAppointments = null;
            }
            return listOfAppointments;
        }

        public int GetDoctorAppointment(string patientId, string doctorId, DateTime dateOfAppointment, out int appointmentNo)
        {
            appointmentNo = 0;
            int noOfRowsAffected = 0;
            int returnResult = 0;

            try
            {
                SqlParameter prmPatientID = new SqlParameter("@PatientID",System.Data.SqlDbType.Char, 4);
                prmPatientID.Value = patientId;
                prmPatientID.Direction=System.Data.ParameterDirection.Input;

                SqlParameter prmDoctorID = new SqlParameter("@DoctorID",System.Data.SqlDbType.Char,3);
                prmDoctorID.Value = doctorId;
                prmDoctorID.Direction=System.Data.ParameterDirection.Input;

                SqlParameter prmDateOfAppointment = new SqlParameter("@DateOfAppointment", System.Data.SqlDbType.Date);
                prmDateOfAppointment.Value = dateOfAppointment;
                prmDateOfAppointment.Direction=System.Data.ParameterDirection.Input;

                SqlParameter prmAppointmentNo = new SqlParameter("@AppointmentNo", System.Data.SqlDbType.Int);
                prmAppointmentNo.Direction=System.Data.ParameterDirection.Output;

                SqlParameter prmReturnResult = new SqlParameter("@ReturnResult", System.Data.SqlDbType.Int);
                prmReturnResult.Direction = System.Data.ParameterDirection.Output;

                noOfRowsAffected = context.Database.ExecuteSqlRaw("EXEC @ReturnResult = usp_GetDoctorAppointment @PatientID, @DoctorID, @DateOfAppointment, @AppointmentNo OUT", 
                                                                    prmReturnResult, prmPatientID, prmDoctorID, prmDateOfAppointment, prmAppointmentNo);

                returnResult=Convert.ToInt32(prmReturnResult.Value);

                appointmentNo=Convert.ToInt32(prmAppointmentNo.Value);

            }
            catch (Exception)
            {
                returnResult = -99;
                appointmentNo = 0;
            }
            return returnResult;
        }

        public Patient GetPatientDetails(string patientId)
        {
            Patient patientObj = new Patient();
            try
            {
                patientObj = context.Patients.Where(p => p.PatientId == patientId).FirstOrDefault();
            }
            catch (Exception)
            {
                patientObj=null;
            }
            return patientObj;  
        }

        public bool UpdatePatientAge(string patientId, byte newAge)
        {
            bool status=false;
            Patient patientObj = new Patient();
            try
            {
                patientObj = context.Patients.Find(patientId);
                if (patientObj != null) 
                { 
                    patientObj.Age = newAge;
                    context.SaveChanges();
                    status=true;
                }
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

    }
}
