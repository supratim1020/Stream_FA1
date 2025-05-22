using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


namespace Infosys.EAgriculture.DAL.Models
{
    public class ShipmentTrackingDetailOfTrader
    {
        [Key]
        public string ShipmentId { get; set; }

        public string TransactionId { get; set; }

        public string FarmName { get; set; }

        public string Status { get; set; }

        public DateOnly? ExpectedDeliveryDate { get; set; }
    }
}
