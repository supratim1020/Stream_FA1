using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Infosys.DBCoreDataAccessLayer.Models
{
    public class ListOfAppointments
    {
        [Key]
        public int AppointmentNo { get; set; }
        public string DoctorName { get; set; } = null!;
        public string Specialization { get; set; } = null!;
        public string PatientId { get; set; } = null!;
        public string PatientName { get; set; } = null!;
    }
}
