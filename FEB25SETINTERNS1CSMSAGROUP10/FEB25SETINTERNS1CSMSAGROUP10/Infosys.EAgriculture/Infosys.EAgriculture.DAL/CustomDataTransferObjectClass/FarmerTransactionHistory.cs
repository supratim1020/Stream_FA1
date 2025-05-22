using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infosys.EAgriculture.DAL.CustomDataTransferObjectClass
{
    public class FarmerTransactionHistory
    {
        [Key]
        public string TransactionID { get; set; }
        public string CropName { get; set; }
        public decimal QuantityRequested { get; set; }
        public decimal? OfferedPrice { get; set; }
        public decimal? TotalAmount { get; set; }
        public DateTime? RequestDate { get; set; }
        public string? UserID { get; set; }
        public string FullName { get; set; }
        public string Status { get; set; }
    }
}
