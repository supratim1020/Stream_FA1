using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class TraderCropPreference
{
    public string PreferenceId { get; set; }

    public string TraderId { get; set; }

    public string CropName { get; set; }

    public decimal? MinPrice { get; set; }

    public decimal? MaxPrice { get; set; }

    public decimal? MinQuantity { get; set; }

    public decimal? MaxQuantity { get; set; }

    public int? SourcingDistance { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Trader { get; set; }
}
