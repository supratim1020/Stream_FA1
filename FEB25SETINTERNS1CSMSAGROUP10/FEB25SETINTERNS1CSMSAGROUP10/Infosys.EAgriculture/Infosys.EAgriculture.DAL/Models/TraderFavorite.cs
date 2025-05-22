using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class TraderFavorite
{
    public string FavoriteId { get; set; }

    public string TraderId { get; set; }

    public string FarmerId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual User Trader { get; set; }
}
