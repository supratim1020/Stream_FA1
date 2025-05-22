using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infosys.EAgriculture.DAL.CustomDataTransferObjectClass
{
    public class FarmerReviewsDetails
    {
        [Key]
        public string ReviewId { get; set; }
        public string TraderId { get; set; }
        public string TraderName { get; set; }
        public decimal Rating { get; set; }
        public string ReviewText { get; set; }
        public DateTime? CreatedAt { get; set; }

    }
}
