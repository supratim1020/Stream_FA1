using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class HarvestingReminder
{
    public string ReminderId { get; set; }

    public string FarmerId { get; set; }

    public string CropName { get; set; }

    public DateOnly HarvestDate { get; set; }

    public TimeOnly? ReminderTime { get; set; }

    public string ReminderMessage { get; set; }

    public string Status { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User Farmer { get; set; }
}
