using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class SchemeAlert
{
    public string AlertId { get; set; }

    public string FarmerId { get; set; }

    public string SchemeId { get; set; }

    public string AlertMessage { get; set; }

    public DateTime? SentAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual GovernmentScheme Scheme { get; set; }
}
