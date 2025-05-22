using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class Announcement
{
    public string AnnouncementId { get; set; }

    public string AdminId { get; set; }

    public string Title { get; set; }

    public string Content { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Admin { get; set; }
}
