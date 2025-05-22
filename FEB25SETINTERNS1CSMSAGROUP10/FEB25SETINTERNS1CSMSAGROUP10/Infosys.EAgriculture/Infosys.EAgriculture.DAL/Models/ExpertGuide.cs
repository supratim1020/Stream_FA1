using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class ExpertGuide
{
    public string GuideId { get; set; }

    public string Title { get; set; }

    public string Author { get; set; }

    public string Summary { get; set; }

    public string Content { get; set; }

    public string Topic { get; set; }

    public DateOnly PublicationDate { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<GuideReview> GuideReviews { get; set; } = new List<GuideReview>();
}
