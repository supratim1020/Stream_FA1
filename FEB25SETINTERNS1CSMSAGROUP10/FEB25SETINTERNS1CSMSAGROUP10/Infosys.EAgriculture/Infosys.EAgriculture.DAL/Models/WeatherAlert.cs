using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class WeatherAlert
{
    public string AlertId { get; set; }

    public string FarmerId { get; set; }

    public string WeatherId { get; set; }

    public string AlertMessage { get; set; }

    public DateTime? SentAt { get; set; }

    public virtual User Farmer { get; set; }

    public virtual WeatherDatum Weather { get; set; }
}
