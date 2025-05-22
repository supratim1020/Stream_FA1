using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infosys.EAgriculture.DAL.CustomDataTransferObjectClass
{
    public class FarmerOrderTransactionDetails
    {
        [Key]
        public string OrderId { get; set; }
        public string CropName { get; set; }
        public decimal QuantityAvailable { get; set; }
        public decimal PricePerUnit { get; set; }
        public decimal QuantityRequested {get; set;}
        public decimal? OfferedPricePerUnit { get; set;}
        public string TraderId { get; set; }
        public string TraderName { get; set; }
        public DateTime? OrderDate { get; set; }
        public string CurrentStatus { get; set; }
    }
}
