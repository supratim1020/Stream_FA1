using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class TraderReview
{
    public string ReviewId { get; set; }

    public string TransactionId { get; set; }

    public string FarmerId { get; set; }

    public string TraderId { get; set; }

    public int Rating { get; set; }

    public string Comment { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual User Trader { get; set; }

    public virtual Transaction Transaction { get; set; }
}
