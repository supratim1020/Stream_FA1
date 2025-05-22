namespace Infosys.EAgriculture.Services.Models
{
    public partial class FarmerReview
    {
        public string ReviewId { get; set; }

        public string TransactionId { get; set; }

        public string FarmerId { get; set; }

        public string TraderId { get; set; }

        public int Rating { get; set; }

        public string Comment { get; set; }

        public DateTime? CreatedAt { get; set; }
    }
}
