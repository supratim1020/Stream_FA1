IF OBJECT_ID('ufn_GetShippmentTrackingDetails') IS NOT NULL DROP FUNCTION ufn_GetShippmentTrackingDetails
GO


create function ufn_GetShippmentTrackingDetails(@TraderID varchar(10))
returns @ShippmentDetails TABLE(ShipmentID varchar(10),TransactionID varchar(10),FarmName NVARCHAR(100),Status nvarchar(20),ExpectedDeliveryDate DATE)
as 
begin
	insert @ShippmentDetails
	select s.ShipmentID , s.TransactionID,f.FarmName , s.status ,s.ExpectedDeliveryDate from ShipmentTracking s 
	inner join Transactions t on s.TransactionID = t.TransactionID
	inner join FarmerProfiles f on f.FarmerProfileID = t.FarmerID
	where t.TraderID = @TraderID and (s.status = 'InTransit' or s.status = 'Delivered' or s.status = 'Delayed' or (s.status='Cancelled' and t.Status <> 'Rejected'))
	RETURN 
end
go