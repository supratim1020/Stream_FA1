using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class FarmerProfile
{
    public string FarmerProfileId { get; set; }

    public string FarmName { get; set; }

    public decimal? FarmSize { get; set; }

    public string FarmingType { get; set; }

    public string Location { get; set; }

    public int? YearsOfExperience { get; set; }

    public string LanguagesSpoken { get; set; }

    public virtual User FarmerProfileNavigation { get; set; }
}
