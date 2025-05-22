using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class WeatherDatum
{
    public string WeatherId { get; set; }

    public string Region { get; set; }

    public string WeatherType { get; set; }

    public DateTime EventDate { get; set; }

    public string Description { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<WeatherAlert> WeatherAlerts { get; set; } = new List<WeatherAlert>();
}
