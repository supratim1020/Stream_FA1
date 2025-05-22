using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class Policy
{
    public string PolicyId { get; set; }

    public string AdminId { get; set; }

    public string Title { get; set; }

    public string Content { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User Admin { get; set; }
}
