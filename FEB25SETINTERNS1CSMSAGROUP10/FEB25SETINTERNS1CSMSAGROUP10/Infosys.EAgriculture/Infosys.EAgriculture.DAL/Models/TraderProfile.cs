using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class TraderProfile
{
    public string TraderProfileId { get; set; }

    public string BusinessName { get; set; }

    public string BusinessLicenseNumber { get; set; }

    public virtual User TraderProfileNavigation { get; set; }
}
