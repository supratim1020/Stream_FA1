using System;
using System.Collections.Generic;

namespace Infosys.EAgriculture.DAL.Models;

public partial class ShipmentTracking
{
    public string ShipmentId { get; set; }

    public string TransactionId { get; set; }

    public string Status { get; set; }

    public DateOnly? ExpectedDeliveryDate { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Transaction Transaction { get; set; }
}
