using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class GuideReview
{
    public string ReviewId { get; set; }

    public string GuideId { get; set; }

    public string FarmerId { get; set; }

    public int Rating { get; set; }

    public string Comment { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual ExpertGuide Guide { get; set; }
}
