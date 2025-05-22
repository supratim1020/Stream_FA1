using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class DiscussionForum
{
    public string ThreadId { get; set; }

    public string FarmerId { get; set; }

    public string Title { get; set; }

    public string Category { get; set; }

    public string InitialMessage { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User Farmer { get; set; }
}
