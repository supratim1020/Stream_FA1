using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class Transaction
{
    public string TransactionId { get; set; }

    public string FarmerId { get; set; }

    public string TraderId { get; set; }

    public string ListingId { get; set; }

    public decimal QuantityRequested { get; set; }

    public decimal? OfferedPrice { get; set; }

    public DateTime? RequestDate { get; set; }

    public string Status { get; set; }

    public DateTime? CompletedDate { get; set; }

    public virtual User Farmer { get; set; }

    public virtual ICollection<FarmerReview> FarmerReviews { get; set; } = new List<FarmerReview>();

    public virtual CropAvailabilityDetail Listing { get; set; }

    public virtual ICollection<ShipmentTracking> ShipmentTrackings { get; set; } = new List<ShipmentTracking>();

    public virtual User Trader { get; set; }

    public virtual ICollection<TraderReview> TraderReviews { get; set; } = new List<TraderReview>();
}
