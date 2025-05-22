using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infosys.EAgriculture.DAL.CustomDataTransferObjectClass
{
    public class OrderTrackingDetails
    {
        public string TransactionID { get; set; }
        public string OrderStatus { get; set; }
        public DateTime? RequestDate { get; set; }
        public DateTime? CompletedDate { get; set; }
        public string ShipmentStatus { get; set; }
        public DateTime? ShipmentStatusUpdatedAt { get; set; }
    }
}
