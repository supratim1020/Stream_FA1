using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class GovernmentScheme
{
    public string SchemeId { get; set; }

    public string Title { get; set; }

    public string Description { get; set; }

    public string TargetLocation { get; set; }

    public string Eligibility { get; set; }

    public DateOnly StartDate { get; set; }

    public DateOnly EndDate { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<SchemeAlert> SchemeAlerts { get; set; } = new List<SchemeAlert>();
}
