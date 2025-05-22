using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class CropAvailabilityDetail
{
    public string ListingId { get; set; }

    public string FarmerId { get; set; }

    public string CropName { get; set; }

    public decimal Quantity { get; set; }

    public string Unit { get; set; }

    public decimal PricePerUnit { get; set; }

    public DateOnly HarvestDate { get; set; }

    public string Location { get; set; }

    public string Description { get; set; }

    public string Status { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual ICollection<Transaction> Transactions { get; set; } = new List<Transaction>();
}
