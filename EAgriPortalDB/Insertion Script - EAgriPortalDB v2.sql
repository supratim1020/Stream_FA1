-- Insert 25 records into Users (15 Farmers, 8 Traders, 2 Admins)
USE EAgriPortalDB
GO
INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U101', 'Amit Sharma', 'amit.sharma@example.com', 'Amit@Sharma123', '9876543210', 'Village Kheda, Punjab', '1985-03-15', 'Farmer', 1, DATEADD(DAY, -5, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U102', 'Priya Patel', 'priya.patel@example.com', 'Priya#Patel456', '8765432109', 'Farm Road, Gujarat', '1990-07-22', 'Farmer', 1, DATEADD(DAY, -12, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U103', 'Vikram Singh', 'vikram.singh@example.com', 'Vikram$Singh789', '7654321098', 'Rural Path, Haryana', '1988-11-10', 'Farmer', 1, DATEADD(DAY, -20, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U104', 'Anjali Desai', 'anjali.desai@example.com', 'Anjali&Desai101', '6543210987', 'Village Anand, Maharashtra', '1992-04-05', 'Farmer', 0, DATEADD(DAY, -3, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U105', 'Rakesh Kumar', 'rakesh.kumar@example.com', 'Rakesh%Kumar202', '5432109876', 'Farm Lane, Uttar Pradesh', '1983-09-17', 'Farmer', 1, DATEADD(DAY, -25, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U106', 'Suman Yadav', 'suman.yadav@example.com', 'Suman*Yadav303', '4321098765', 'Rural Road, Rajasthan', '1987-12-30', 'Farmer', 1, DATEADD(DAY, -15, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U107', 'Kiran Mehta', 'kiran.mehta@example.com', 'Kiran^Mehta404', '3210987654', 'Village Sangli, Karnataka', '1995-02-14', 'Farmer', 0, DATEADD(DAY, -7, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U108', 'Deepak Joshi', 'deepak.joshi@example.com', 'Deepak_Joshi505', '2109876543', 'Farm Path, Madhya Pradesh', '1984-06-25', 'Farmer', 1, DATEADD(DAY, -18, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U109', 'Neha Gupta', 'neha.gupta@example.com', 'Neha#Gupta606', '1098765432', 'Village Nashik, Maharashtra', '1993-08-08', 'Farmer', 1, DATEADD(DAY, -10, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U110', 'Sanjay Patel', 'sanjay.patel@example.com', 'Sanjay@Patel707', '9988776655', 'Rural Area, Gujarat', '1986-10-19', 'Farmer', 1, DATEADD(DAY, -22, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U111', 'Manish Verma', 'manish.verma@example.com', 'Manish$Verma808', '8877665544', 'Village Ludhiana, Punjab', '1989-05-12', 'Farmer', 1, DATEADD(DAY, -9, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U112', 'Poonam Sharma', 'poonam.sharma@example.com', 'Poonam%Sharma909', '7766554433', 'Farm Village, Haryana', '1991-03-28', 'Farmer', 1, DATEADD(DAY, -14, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U113', 'Rajesh Thakur', 'rajesh.thakur@example.com', 'Rajesh*Thakur010', '6655443322', 'Rural Path, Himachal', '1987-07-16', 'Farmer', 0, DATEADD(DAY, -4, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U114', 'Shalini Nair', 'shalini.nair@example.com', 'Shalini^Nair111', '5544332211', 'Village Kochi, Kerala', '1994-11-02', 'Farmer', 1, DATEADD(DAY, -28, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U115', 'Vijay Reddy', 'vijay.reddy@example.com', 'Vijay_Reddy212', '4433221100', 'Farm Area, Andhra Pradesh', '1985-01-09', 'Farmer', 1, DATEADD(DAY, -16, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U116', 'Rahul Traders', 'rahul.traders@example.com', 'Rahul@Traders313', '3322110099', 'Market Street, Delhi', '1978-11-10', 'Trader', 1, DATEADD(DAY, -11, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U117', 'Suman Enterprises', 'suman.enterprises@example.com', 'Suman#Enterprises414', '2211009988', 'Commercial Hub, Mumbai', '1982-04-05', 'Trader', 1, DATEADD(DAY, -19, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U118', 'Vikas Agrawal', 'vikas.agrawal@example.com', 'Vikas$Agrawal515', '1122334455', 'Trade Center, Kolkata', '1980-01-15', 'Trader', 1, DATEADD(DAY, -8, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U119', 'Meena Exports', 'meena.exports@example.com', 'Meena%Exports616', '9988771122', 'Business Park, Chennai', '1985-05-20', 'Trader', 0, DATEADD(DAY, -23, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U120', 'Arjun Singh', 'arjun.singh@example.com', 'Arjun&Singh717', '8877662233', 'Market Road, Hyderabad', '1979-03-12', 'Trader', 1, DATEADD(DAY, -6, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U121', 'Pooja Sharma', 'pooja.sharma@example.com', 'Pooja*Sharma818', '7766553344', 'Trade Hub, Bangalore', '1983-07-30', 'Trader', 1, DATEADD(DAY, -17, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U122', 'Ravi Imports', 'ravi.imports@example.com', 'Ravi^Imports919', '6655444455', 'Commercial Street, Pune', '1981-09-25', 'Trader', 1, DATEADD(DAY, -13, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U123', 'Lakshmi Traders', 'lakshmi.traders@example.com', 'Lakshmi_Traders020', '5544335566', 'Market Lane, Jaipur', '1984-12-15', 'Trader', 1, DATEADD(DAY, -21, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U124', 'Nikhil Kumar', 'nikhil.kumar@example.com', 'Nikhil@Kumar121', '1234567890', 'Electronic City, Bangalore', '1975-01-01', 'Admin', 1, DATEADD(DAY, -2, GETDATE()), NULL);

INSERT INTO Users (UserID, FullName, Email, [Password], PhoneNumber, [Address], DOB, [Role], IsActive, CreatedAt, UpdatedAt)
VALUES ('U125', 'Varati Gupta', 'varati.gupta@example.com', 'Admin#Gupta222', '0987654321', 'Connaught Place, Delhi', '1970-06-10', 'Admin', 1, DATEADD(DAY, -1, GETDATE()), NULL);
GO

-- 15 records into FarmerProfiles for all farmers (U101 to U115) from Users table
USE EAgriPortalDB
GO

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U101', 'Sharma Organic Farms', 12.50, 'Organic', 'Village Kheda, Punjab', 10, 'Hindi, Punjabi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U102', 'Patel Agro', 8.75, 'Traditional', 'Farm Road, Gujarat', 5, 'Gujarati, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U103', 'Singh Farms', 15.00, 'Organic', 'Rural Path, Haryana', 8, 'Hindi, Punjabi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U104', 'Desai Hydro Farms', 3.20, 'Hydroponic', 'Village Anand, Maharashtra', 3, 'Marathi, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U105', 'Kumar Traditional Farms', 20.00, 'Traditional', 'Farm Lane, Uttar Pradesh', 12, 'Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U106', 'Yadav Agro', 10.25, 'Organic', 'Rural Road, Rajasthan', 7, 'Hindi, Rajasthani');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U107', 'Mehta Green Farms', 5.50, 'Organic', 'Village Sangli, Karnataka', 2, 'Kannada, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U108', 'Joshi Farms', 18.00, 'Traditional', 'Farm Path, Madhya Pradesh', 9, 'Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U109', 'Gupta Hydroponics', 4.00, 'Hydroponic', 'Village Nashik, Maharashtra', 4, 'Marathi, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U110', 'Patel Farms', 9.80, 'Traditional', 'Rural Area, Gujarat', 6, 'Gujarati, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U111', 'Verma Organic', 14.30, 'Organic', 'Village Ludhiana, Punjab', 8, 'Punjabi, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U112', 'Sharma Agro', 11.00, 'Traditional', 'Farm Village, Haryana', 5, 'Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U113', 'Thakur Farms', 7.60, 'Organic', 'Rural Path, Himachal', 6, 'Hindi, Pahari');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U114', 'Nair Coastal Farms', 6.25, 'Traditional', 'Village Kochi, Kerala', 3, 'Malayalam, Hindi');

INSERT INTO FarmerProfiles (FarmerProfileID, FarmName, FarmSize, FarmingType, Location, YearsOfExperience, LanguagesSpoken)
VALUES ('U115', 'Reddy Agro', 13.40, 'Organic', 'Farm Area, Andhra Pradesh', 10, 'Telugu, Hindi');



-- Insert 8 records into TraderProfiles for all traders (U116 to U123) from Users table
USE EAgriPortalDB
GO

INSERT INTO TraderProfiles (TraderProfileID, BusinessName, BusinessLicenseNumber)
VALUES 
('U116', 'Rahul Trading Co.', 'LIC123456'),
('U117', 'Suman Enterprises', 'LIC789012'),
('U118', 'Agrawal Agro Traders', 'LIC345678'),
('U119', 'Meena Exports Pvt Ltd', 'LIC901234'),
('U120', 'Singh Agri Mart', 'LIC567890'),
('U121', 'Sharma Trade Hub', 'LIC234567'),
('U122', 'Ravi Imports', 'LIC890123'),
('U123', 'Lakshmi Traders', 'LIC456789');
GO



-- Insert 15 records into CropAvailabilityDetails for all farmers (U101 to U115) from Users table
USE EAgriPortalDB
GO

INSERT INTO CropAvailabilityDetails (ListingID, FarmerID, CropName, Quantity, Unit, PricePerUnit, HarvestDate, [Location], [Description], [Status], CreatedAt, UpdatedAt)
VALUES 
('CR101', 'U101', 'Wheat', 1000.00, 'kg', 25.00, '2025-04-01', 'Village Kheda, Punjab', 'High-quality organic wheat', 'Available', DATEADD(DAY, -5, GETDATE()), NULL),
('CR102', 'U102', 'Rice', 500.00, 'kg', 40.00, '2025-05-15', 'Farm Road, Gujarat', 'Premium basmati rice', 'Available', DATEADD(DAY, -12, GETDATE()), NULL),
('CR103', 'U103', 'Wheat', 1200.00, 'kg', 22.50, '2025-03-20', 'Rural Path, Haryana', 'Organic wheat, high yield', 'Sold', DATEADD(DAY, -20, GETDATE()), NULL),
('CR104', 'U104', 'Tomato', 300.00, 'kg', 30.00, '2025-05-10', 'Village Anand, Maharashtra', 'Fresh hydroponic tomatoes', 'Available', DATEADD(DAY, -3, GETDATE()), NULL),
('CR105', 'U105', 'Sugarcane', 5000.00, 'kg', 35.00, '2025-06-01', 'Farm Lane, Uttar Pradesh', 'High-sugar content sugarcane', 'Available', DATEADD(DAY, -25, GETDATE()), NULL),
('CR106', 'U106', 'Millet', 800.00, 'kg', 28.00, '2025-04-15', 'Rural Road, Rajasthan', 'Organic pearl millet', 'Available', DATEADD(DAY, -15, GETDATE()), NULL),
('CR107', 'U107', 'Paddy', 600.00, 'kg', 38.00, '2025-05-20', 'Village Sangli, Karnataka', 'Organic paddy, short grain', 'Available', DATEADD(DAY, -7, GETDATE()), NULL),
('CR108', 'U108', 'Maize', 1500.00, 'kg', 20.00, '2025-04-10', 'Farm Path, Madhya Pradesh', 'Yellow maize, high quality', 'Sold', DATEADD(DAY, -18, GETDATE()), NULL),
('CR109', 'U109', 'Lettuce', 200.00, 'kg', 50.00, '2025-05-05', 'Village Nashik, Maharashtra', 'Hydroponic lettuce, fresh', 'Available', DATEADD(DAY, -10, GETDATE()), NULL),
('CR110', 'U110', 'Cotton', 1000.00, 'kg', 45.00, '2025-06-15', 'Rural Area, Gujarat', 'High-grade cotton', 'Available', DATEADD(DAY, -22, GETDATE()), NULL),
('CR111', 'U111', 'Pulses', 700.00, 'kg', 60.00, '2025-04-25', 'Village Ludhiana, Punjab', 'Organic lentils', 'Available', DATEADD(DAY, -9, GETDATE()), NULL),
('CR112', 'U112', 'Barley', 900.00, 'kg', 24.00, '2025-03-30', 'Farm Village, Haryana', 'Traditional barley crop', 'OutOfStock', DATEADD(DAY, -14, GETDATE()), NULL),
('CR113', 'U113', 'Apple', 400.00, 'kg', 80.00, '2025-05-25', 'Rural Path, Himachal', 'Organic apples, premium', 'Available', DATEADD(DAY, -4, GETDATE()), NULL),
('CR114', 'U114', 'Coconut', 1000.00, 'units', 15.00, '2025-05-30', 'Village Kochi, Kerala', 'Fresh coconuts', 'Available', DATEADD(DAY, -28, GETDATE()), NULL),
('CR115', 'U115', 'Groundnut', 600.00, 'kg', 55.00, '2025-04-20', 'Farm Area, Andhra Pradesh', 'High-oil content groundnuts', 'Available', DATEADD(DAY, -16, GETDATE()), NULL),
('CR116', 'U101', 'Soybean', 800.00, 'kg', 42.00, '2025-05-01', 'Village Kheda, Punjab', 'Non-GMO soybeans', 'Available', DATEADD(DAY, -8, GETDATE()), NULL),
('CR117', 'U102', 'Onion', 500.00, 'kg', 28.00, '2025-05-12', 'Farm Road, Gujarat', 'Red onions, high quality', 'Available', DATEADD(DAY, -6, GETDATE()), NULL),
('CR118', 'U103', 'Potato', 1500.00, 'kg', 18.00, '2025-04-28', 'Rural Path, Haryana', 'Freshly harvested potatoes', 'Sold', DATEADD(DAY, -17, GETDATE()), NULL),
('CR119', 'U104', 'Cucumber', 300.00, 'kg', 35.00, '2025-05-08', 'Village Anand, Maharashtra', 'Organic cucumbers', 'Available', DATEADD(DAY, -2, GETDATE()), NULL),
('CR120', 'U105', 'Jute', 2000.00, 'kg', 50.00, '2025-06-05', 'Farm Lane, Uttar Pradesh', 'High-fiber jute', 'Available', DATEADD(DAY, -21, GETDATE()), NULL),
('CR121', 'U106', 'Sorghum', 700.00, 'kg', 30.00, '2025-04-22', 'Rural Road, Rajasthan', 'Organic sorghum grains', 'Available', DATEADD(DAY, -13, GETDATE()), NULL),
('CR122', 'U107', 'Green Peas', 400.00, 'kg', 45.00, '2025-05-18', 'Village Sangli, Karnataka', 'Fresh green peas', 'Available', DATEADD(DAY, -5, GETDATE()), NULL),
('CR123', 'U108', 'Sunflower', 600.00, 'kg', 65.00, '2025-04-30', 'Farm Path, Madhya Pradesh', 'High-oil sunflower seeds', 'OutOfStock', DATEADD(DAY, -19, GETDATE()), NULL),
('CR124', 'U109', 'Spinach', 250.00, 'kg', 40.00, '2025-05-07', 'Village Nashik, Maharashtra', 'Hydroponic spinach', 'Available', DATEADD(DAY, -11, GETDATE()), NULL),
('CR125', 'U110', 'Sesame', 500.00, 'kg', 70.00, '2025-05-20', 'Rural Area, Gujarat', 'White sesame seeds', 'Available', DATEADD(DAY, -24, GETDATE()), NULL),
('CR126', 'U111', 'Chickpea', 900.00, 'kg', 55.00, '2025-04-18', 'Village Ludhiana, Punjab', 'Organic chickpeas', 'Available', DATEADD(DAY, -10, GETDATE()), NULL),
('CR127', 'U112', 'Oats', 600.00, 'kg', 32.00, '2025-04-05', 'Farm Village, Haryana', 'Whole grain oats', 'Sold', DATEADD(DAY, -26, GETDATE()), NULL),
('CR128', 'U113', 'Mango', 350.00, 'kg', 90.00, '2025-06-01', 'Rural Path, Himachal', 'Alphonso mangoes, premium', 'Available', DATEADD(DAY, -3, GETDATE()), NULL),
('CR129', 'U114', 'Banana', 1000.00, 'units', 5.00, '2025-05-28', 'Village Kochi, Kerala', 'Organic bananas', 'Available', DATEADD(DAY, -15, GETDATE()), NULL),
('CR130', 'U115', 'Mustard', 400.00, 'kg', 60.00, '2025-04-25', 'Farm Area, Andhra Pradesh', 'High-quality mustard seeds', 'Available', DATEADD(DAY, -20, GETDATE()), NULL),
('CR131', 'U101', 'Carrot', 300.00, 'kg', 38.00, '2025-05-10', 'Village Kheda, Punjab', 'Fresh organic carrots', 'Available', DATEADD(DAY, -7, GETDATE()), NULL),
('CR132', 'U102', 'Cauliflower', 500.00, 'kg', 25.00, '2025-05-15', 'Farm Road, Gujarat', 'Large head cauliflowers', 'Available', DATEADD(DAY, -4, GETDATE()), NULL),
('CR133', 'U103', 'Barley', 800.00, 'kg', 26.00, '2025-04-12', 'Rural Path, Haryana', 'Organic barley grains', 'OutOfStock', DATEADD(DAY, -22, GETDATE()), NULL),
('CR134', 'U104', 'Capsicum', 200.00, 'kg', 48.00, '2025-05-09', 'Village Anand, Maharashtra', 'Green capsicum, hydroponic', 'Available', DATEADD(DAY, -9, GETDATE()), NULL),
('CR135', 'U105', 'Ragi', 600.00, 'kg', 35.00, '2025-05-03', 'Farm Lane, Uttar Pradesh', 'Organic finger millet', 'Available', DATEADD(DAY, -12, GETDATE()), NULL);
GO


-- Transaction Table
USE EAgriPortalDB
GO

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN101', 'U101', 'U116', 'CR101', 500.00, 26.00, DATEADD(DAY, -4, GETDATE()), 'Completed', DATEADD(DAY, -2, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN102', 'U102', 'U117', 'CR102', 200.00, 38.00, DATEADD(DAY, -10, GETDATE()), 'Pending', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN103', 'U103', 'U118', 'CR103', 600.00, 22.00, DATEADD(DAY, -15, GETDATE()), 'Completed', DATEADD(DAY, -13, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN104', 'U104', 'U119', 'CR104', 150.00, 32.00, DATEADD(DAY, -2, GETDATE()), 'Approved', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN105', 'U105', 'U120', 'CR105', 2000.00, 34.00, DATEADD(DAY, -20, GETDATE()), 'Rejected', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN106', 'U106', 'U121', 'CR106', 400.00, 27.50, DATEADD(DAY, -12, GETDATE()), 'Pending', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN107', 'U107', 'U122', 'CR107', 300.00, 39.00, DATEADD(DAY, -5, GETDATE()), 'Completed', DATEADD(DAY, -3, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN108', 'U108', 'U123', 'CR108', 750.00, 19.50, DATEADD(DAY, -16, GETDATE()), 'Completed', DATEADD(DAY, -14, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN109', 'U109', 'U116', 'CR109', 100.00, 52.00, DATEADD(DAY, -8, GETDATE()), 'Approved', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN110', 'U110', 'U117', 'CR110', 500.00, 44.00, DATEADD(DAY, -18, GETDATE()), 'Cancelled', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN111', 'U111', 'U118', 'CR111', 350.00, 58.00, DATEADD(DAY, -7, GETDATE()), 'Pending', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN112', 'U112', 'U119', 'CR112', 450.00, 25.00, DATEADD(DAY, -13, GETDATE()), 'Rejected', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN113', 'U113', 'U120', 'CR113', 200.00, 82.00, DATEADD(DAY, -3, GETDATE()), 'Approved', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN114', 'U114', 'U121', 'CR114', 400.00, 14.50, DATEADD(DAY, -25, GETDATE()), 'Completed', DATEADD(DAY, -23, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN115', 'U115', 'U122', 'CR115', 300.00, 56.00, DATEADD(DAY, -14, GETDATE()), 'Pending', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN116', 'U101', 'U123', 'CR116', 400.00, 41.00, DATEADD(DAY, -6, GETDATE()), 'Approved', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN117', 'U102', 'U116', 'CR117', 250.00, 29.00, DATEADD(DAY, -5, GETDATE()), 'Completed', DATEADD(DAY, -4, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN118', 'U103', 'U117', 'CR118', 700.00, 17.50, DATEADD(DAY, -15, GETDATE()), 'Completed', DATEADD(DAY, -12, GETDATE()))

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN119', 'U104', 'U118', 'CR119', 150.00, 36.00, DATEADD(DAY, -1, GETDATE()), 'Pending', NULL)

INSERT INTO Transactions (TransactionID, FarmerID, TraderID, ListingID, QuantityRequested, OfferedPrice, RequestDate, [Status], CompletedDate)
VALUES ('TN120', 'U105', 'U119', 'CR120', 1000.00, 48.00, DATEADD(DAY, -19, GETDATE()), 'Approved', NULL)
GO

-- Insert 20 records into FarmerReviews for all transactions (TN101 to TN120) from Transactions table
USE EAgriPortalDB
GO

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR101', 'TN101', 'U101', 'U116', 5, 'Prompt payment for wheat, reliable trader', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR102', 'TN102', 'U102', 'U117', 3, 'Slow response for rice order, still pending', DATEADD(DAY, 2, '2025-05-05'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR103', 'TN103', 'U103', 'U118', 4, 'Good deal on wheat, timely delivery', DATEADD(DAY, 1, '2025-05-02'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR104', 'TN104', 'U104', 'U119', 4, 'Fair price for tomatoes, approved quickly', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR105', 'TN105', 'U105', 'U120', 2, 'Rejected sugarcane order, unclear reasons', DATEADD(DAY, 2, '2025-04-25'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR106', 'TN106', 'U106', 'U121', 3, 'Millet order pending, waiting for confirmation', DATEADD(DAY, 2, '2025-05-03'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR107', 'TN107', 'U107', 'U122', 5, 'Excellent trader, fast payment for paddy', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR108', 'TN108', 'U108', 'U123', 4, 'Smooth transaction for maize, good communication', DATEADD(DAY, 1, '2025-05-01'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR109', 'TN109', 'U109', 'U116', 4, 'Approved lettuce order, good initial response', DATEADD(DAY, 2, '2025-05-07'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR110', 'TN110', 'U110', 'U117', 1, 'Cancelled cotton order, very disappointing', DATEADD(DAY, 2, '2025-04-27'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR111', 'TN111', 'U111', 'U118', 3, 'Pulses order still pending, average communication', DATEADD(DAY, 2, '2025-05-08'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR112', 'TN112', 'U112', 'U119', 2, 'Barley order rejected, poor explanation', DATEADD(DAY, 2, '2025-05-02'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR113', 'TN113', 'U113', 'U120', 4, 'Approved apple order, promising trader', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR114', 'TN114', 'U114', 'U121', 5, 'Great experience with coconut order, highly recommend', DATEADD(DAY, 1, '2025-04-22'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR115', 'TN115', 'U115', 'U122', 3, 'Groundnut order pending, response could be faster', DATEADD(DAY, 2, '2025-05-01'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR116', 'TN116', 'U101', 'U123', 4, 'Good price for wheat order, approved quickly', DATEADD(DAY, 2, '2025-05-09'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR117', 'TN117', 'U102', 'U116', 5, 'Fast payment for rice, excellent trader', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR118', 'TN118', 'U103', 'U117', 4, 'Smooth wheat transaction, reliable trader', DATEADD(DAY, 1, '2025-05-03'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR119', 'TN119', 'U104', 'U118', 3, 'Tomato order pending, awaiting confirmation', DATEADD(DAY, 1, '2025-05-14'));

INSERT INTO FarmerReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('FR120', 'TN120', 'U105', 'U119', 4, 'Approved sugarcane order, good communication', DATEADD(DAY, 2, '2025-04-26'));
GO



-- TraderReviews Table
-- Insert 20 records into TraderReviews for all transactions (TN101 to TN120) from Transactions table
USE EAgriPortalDB
GO

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR101', 'TN101', 'U101', 'U116', 5, 'High-quality wheat delivered on time', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR102', 'TN102', 'U102', 'U117', 3, 'Rice quality pending confirmation, slow response', DATEADD(DAY, 2, '2025-05-05'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR103', 'TN103', 'U103', 'U118', 4, 'Reliable wheat supply, good packaging', DATEADD(DAY, 1, '2025-05-02'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR104', 'TN104', 'U104', 'U119', 4, 'Fresh tomatoes, approved with good communication', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR105', 'TN105', 'U105', 'U120', 2, 'Sugarcane quality issues, order rejected', DATEADD(DAY, 2, '2025-04-25'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR106', 'TN106', 'U106', 'U121', 3, 'Millet order pending, awaiting quality check', DATEADD(DAY, 2, '2025-05-03'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR107', 'TN107', 'U107', 'U122', 5, 'Excellent paddy quality, timely delivery', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR108', 'TN108', 'U108', 'U123', 4, 'Good maize supply, consistent quality', DATEADD(DAY, 1, '2025-05-01'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR109', 'TN109', 'U109', 'U116', 4, 'Hydroponic lettuce approved, high quality', DATEADD(DAY, 2, '2025-05-07'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR110', 'TN110', 'U117', 'U117', 1, 'Cotton order cancelled, unreliable supply', DATEADD(DAY, 2, '2025-04-27'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR111', 'TN111', 'U111', 'U118', 3, 'Pulses quality under review, pending order', DATEADD(DAY, 2, '2025-05-08'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR112', 'TN112', 'U112', 'U119', 2, 'Barley failed quality check, order rejected', DATEADD(DAY, 2, '2025-05-02'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR113', 'TN113', 'U113', 'U120', 4, 'Premium apples approved, good farmer', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR114', 'TN114', 'U114', 'U121', 5, 'Fresh coconuts, excellent supplier', DATEADD(DAY, 1, '2025-04-22'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR115', 'TN115', 'U115', 'U122', 3, 'Groundnut order pending, quality TBD', DATEADD(DAY, 2, '2025-05-01'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR116', 'TN116', 'U101', 'U123', 4, 'Wheat approved, consistent quality', DATEADD(DAY, 2, '2025-05-09'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR117', 'TN117', 'U102', 'U116', 5, 'Top-quality rice, fast delivery', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR118', 'TN118', 'U103', 'U117', 4, 'Wheat delivered as promised, good supplier', DATEADD(DAY, 1, '2025-05-03'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR119', 'TN119', 'U104', 'U118', 3, 'Tomato order pending, awaiting quality', DATEADD(DAY, 1, '2025-05-14'));

INSERT INTO TraderReviews (ReviewID, TransactionID, FarmerID, TraderID, Rating, Comment, CreatedAt)
VALUES ('TR120', 'TN120', 'U105', 'U119', 4, 'Sugarcane approved, reliable farmer', DATEADD(DAY, 2, '2025-04-26'));
GO

-- Insert 25 records into WeatherData for unique locations from Users table
USE EAgriPortalDB
GO

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W101', 'Village Kheda, Punjab', 'Heatwave', '2025-05-12', 'High temperatures, risk of wheat crop stress', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W102', 'Farm Road, Gujarat', 'Dry', '2025-05-13', 'No rainfall, ideal for cotton sowing', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W103', 'Rural Path, Haryana', 'Heatwave', '2025-05-11', 'Extreme heat, ensure irrigation for wheat', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W104', 'Village Anand, Maharashtra', 'Rain', '2025-05-14', 'Moderate showers, beneficial for paddy', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W105', 'Farm Lane, Uttar Pradesh', 'Clear', '2025-05-12', 'Stable weather, good for sugarcane harvest', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W106', 'Rural Road, Rajasthan', 'Dry', '2025-05-13', 'Arid conditions, conserve water for crops', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W107', 'Village Sangli, Karnataka', 'Rain', '2025-05-14', 'Light rain, supports coffee plantations', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W108', 'Farm Path, Madhya Pradesh', 'Clear', '2025-05-11', 'Favorable for soybean sowing', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W109', 'Village Nashik, Maharashtra', 'Rain', '2025-05-13', 'Pre-monsoon showers, good for grape vineyards', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W110', 'Rural Area, Gujarat', 'Dry', '2025-05-12', 'No rain expected, suitable for groundnut sowing', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W111', 'Village Ludhiana, Punjab', 'Heatwave', '2025-05-14', 'High heat, protect wheat from drying', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W112', 'Farm Village, Haryana', 'Heatwave', '2025-05-13', 'Extreme temperatures, irrigate mustard crops', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W113', 'Rural Path, Himachal', 'Storm', '2025-05-10', 'Thunderstorms, protect apple orchards', DATEADD(DAY, 2, '2025-05-10'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W114', 'Village Kochi, Kerala', 'Rain', '2025-05-15', 'Early monsoon, ideal for coconut farms', DATEADD(DAY, 0, '2025-05-15'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W115', 'Farm Area, Andhra Pradesh', 'Rain', '2025-05-13', 'Pre-monsoon showers, good for rice paddies', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W116', 'Market Street, Delhi', 'Heatwave', '2025-05-12', 'High temperatures, urban farming at risk', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W117', 'Commercial Hub, Mumbai', 'Rain', '2025-05-14', 'Light showers, supports vegetable markets', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W118', 'Trade Center, Kolkata', 'Storm', '2025-05-13', 'Cyclonic activity, caution for paddy fields', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W119', 'Business Park, Chennai', 'Rain', '2025-05-14', 'Moderate rain, supports turmeric crops', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W120', 'Market Road, Hyderabad', 'Clear', '2025-05-12', 'Stable conditions, good for maize markets', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W121', 'Trade Hub, Bangalore', 'Rain', '2025-05-13', 'Light rain, favorable for coffee trade', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W122', 'Commercial Street, Pune', 'Rain', '2025-05-14', 'Pre-monsoon showers, good for sugarcane', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W123', 'Market Lane, Jaipur', 'Dry', '2025-05-12', 'Arid conditions, conserve water for millet', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W124', 'Electronic City, Bangalore', 'Rain', '2025-05-13', 'Light showers, supports urban farming', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherData (WeatherID, Region, WeatherType, EventDate, Description, CreatedAt)
VALUES ('W125', 'Connaught Place, Delhi', 'Heatwave', '2025-05-14', 'High heat, protect rooftop gardens', DATEADD(DAY, 0, '2025-05-14'));
GO


-- Insert 15 records into WeatherAlerts for farmers corresponding to WeatherData locations
USE EAgriPortalDB
GO

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA101', 'U101', 'W101', 'Heatwave alert for Village Kheda, Punjab: High temperatures may stress wheat crops. Irrigate fields regularly.', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA102', 'U102', 'W102', 'Dry weather in Farm Road, Gujarat: No rain expected, ideal for cotton sowing. Prepare fields accordingly.', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA103', 'U103', 'W103', 'Heatwave in Rural Path, Haryana: Extreme heat may affect wheat. Ensure timely irrigation.', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA104', 'U104', 'W104', 'Rain in Village Anand, Maharashtra: Moderate showers support paddy. Monitor for waterlogging.', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA105', 'U105', 'W105', 'Clear weather in Farm Lane, Uttar Pradesh: Stable conditions for sugarcane harvest. Proceed with harvesting.', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA106', 'U106', 'W106', 'Dry conditions in Rural Road, Rajasthan: Arid weather requires water conservation for millet crops.', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA107', 'U107', 'W107', 'Rain in Village Sangli, Karnataka: Light showers benefit coffee plantations. Check drainage systems.', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA108', 'U108', 'W108', 'Clear weather in Farm Path, Madhya Pradesh: Favorable conditions for soybean sowing. Start preparations.', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA109', 'U109', 'W109', 'Rain in Village Nashik, Maharashtra: Pre-monsoon showers support grape vineyards. Avoid overwatering.', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA110', 'U110', 'W110', 'Dry weather in Rural Area, Gujarat: No rain, suitable for groundnut sowing. Prepare fields now.', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA111', 'U111', 'W111', 'Heatwave in Village Ludhiana, Punjab: High heat may dry wheat. Increase irrigation frequency.', DATEADD(DAY, 0, '2025-05-14'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA112', 'U112', 'W112', 'Heatwave in Farm Village, Haryana: Extreme temperatures may affect mustard. Irrigate promptly.', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA113', 'U113', 'W113', 'Storm in Rural Path, Himachal: Thunderstorms may damage apple orchards. Secure trees and harvest early.', DATEADD(DAY, 1, '2025-05-10'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA114', 'U114', 'W114', 'Rain in Village Kochi, Kerala: Early monsoon ideal for coconut farms. Ensure proper drainage.', DATEADD(DAY, 0, '2025-05-15'));

INSERT INTO WeatherAlerts (AlertID, FarmerID, WeatherID, AlertMessage, SentAt)
VALUES ('WA115', 'U115', 'W115', 'Rain in Farm Area, Andhra Pradesh: Pre-monsoon showers good for rice paddies. Monitor water levels.', DATEADD(DAY, 1, '2025-05-13'));
GO

-- ############################### GovernmentSchemes ###############################

INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S101', 'Pradhan Mantri Fasal Bima Yojana', 'Crop insurance scheme to protect farmers against natural calamities like floods and droughts.', 'Punjab', 'Farmers with cultivable land registered under state agricultural department.', '2025-06-01', '2027-05-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S102', 'Kisan Samridhi Yojana', 'Provides subsidies for organic farming inputs to promote sustainable agriculture.', 'Gujarat', 'Farmers practicing organic farming with certification.', '2025-07-15', '2026-12-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S103', 'Micro Irrigation Fund', 'Financial assistance for drip and sprinkler irrigation systems to conserve water.', 'Maharashtra', 'Small and marginal farmers with land holdings up to 5 hectares.', '2025-04-01', '2027-03-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S104', 'Soil Health Card Scheme', 'Free soil testing and recommendations for fertilizer use to improve soil fertility.', 'Haryana', 'All farmers with registered farmland.', '2025-05-10', '2026-05-09');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S105', 'Agri-Tech Training Program', 'Training workshops on modern farming techniques and technology adoption.', 'Uttar Pradesh', 'Farmers aged 18–60 with basic literacy.', '2025-08-01', '2026-07-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S106', 'Livestock Insurance Scheme', 'Insurance for cattle and poultry to mitigate losses due to diseases or calamities.', 'Rajasthan', 'Farmers owning livestock registered with local veterinary services.', '2025-06-15', '2027-06-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S107', 'Solar Pump Subsidy', 'Subsidies for installing solar-powered water pumps for irrigation.', 'Karnataka', 'Farmers in areas with no reliable electricity supply.', '2025-09-01', '2026-08-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S108', 'Kisan Credit Card', 'Low-interest loans for agricultural expenses like seeds and fertilizers.', 'Madhya Pradesh', 'Farmers with valid land ownership documents.', '2025-04-20', '2027-04-19');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S109', 'Monsoon Crop Protection', 'Financial aid for crop protection measures during heavy rainfall.', 'Mumbai', 'Farmers in monsoon-prone areas with registered crops.', '2025-06-25', '2026-06-24');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S110', 'Farm Mechanization Subsidy', 'Subsidies for purchasing tractors and other farm equipment.', 'Andhra Pradesh', 'Farmers with land holdings above 2 hectares.', '2025-07-10', '2027-07-09');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S111', 'Rural Warehouse Scheme', 'Grants for constructing storage facilities to reduce post-harvest losses.', 'Kerala', 'Farmer cooperatives or individual farmers with land.', '2025-05-15', '2026-05-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S112', 'Drought Relief Fund', 'Financial assistance for farmers affected by drought conditions.', 'Tamil Nadu', 'Farmers in declared drought-affected districts.', '2025-03-01', '2026-02-28');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S113', 'Agri-Export Promotion', 'Support for farmers to export high-value crops like spices and fruits.', 'Himachal Pradesh', 'Farmers with export-quality produce and registration.', '2025-08-15', '2027-08-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S114', 'Women Farmer Empowerment', 'Training and financial aid for women farmers to start agribusinesses.', 'West Bengal', 'Women farmers aged 18-55 with land or cooperative membership.', '2025-06-01', '2026-05-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S115', 'Pesticide Subsidy Program', 'Subsidies for eco-friendly pesticides to reduce chemical use.', 'Odisha', 'Farmers adopting integrated pest management practices.', '2025-07-01', '2026-06-30');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S116', 'Brazil Agri-Development', 'Grants for sustainable farming practices in tropical regions.', 'Brazil', 'Farmers in rural areas with land certification.', '2025-05-03', '2027-05-02');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S117', 'Nairobi Farmer Support', 'Subsidies for drought-resistant seeds to improve crop yields.', 'Nairobi', 'Smallholder farmers with less than 3 hectares.', '2025-03-25', '2026-03-24');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S118', 'Cape Town Irrigation Aid', 'Funding for irrigation systems in coastal farming areas.', 'Cape Town', 'Farmers in water-scarce regions with registered land.', '2025-03-15', '2026-03-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S119', 'Bangkok Rice Farmer Scheme', 'Financial aid for rice farmers to adopt climate-resilient varieties.', 'Bangkok', 'Rice farmers with at least 1 hectare of paddy land.', '2025-07-01', '2027-06-30');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S120', 'Cairo Desert Farming', 'Support for greenhouse farming in arid regions.', 'Cairo', 'Farmers with access to groundwater or irrigation systems.', '2025-04-10', '2026-04-09');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S121', 'Haryana Seed Subsidy', 'Subsidies for high-yield seed varieties to boost productivity.', 'Haryana', 'Farmers registered with state agricultural cooperatives.', '2025-06-10', '2026-06-09');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S122', 'Punjab Water Conservation', 'Incentives for adopting water-saving irrigation techniques.', 'Punjab', 'Farmers in groundwater-depleted areas.', '2025-05-20', '2027-05-19');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S123', 'Maharashtra Horticulture', 'Grants for fruit and vegetable cultivation to diversify income.', 'Maharashtra', 'Farmers with suitable land for horticulture.', '2025-07-15', '2026-07-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S124', 'Gujarat Dairy Development', 'Subsidies for dairy farming equipment and cattle feed.', 'Gujarat', 'Farmers engaged in dairy farming with at least 5 cattle.', '2025-04-01', '2026-03-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S125', 'Uttar Pradesh Agri-Loan', 'Interest-free loans for purchasing farming inputs.', 'Uttar Pradesh', 'Farmers with no outstanding agricultural loans.', '2025-08-01', '2027-07-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S126', 'Rajasthan Crop Diversification', 'Support for transitioning to high-value crops like pulses.', 'Rajasthan', 'Farmers willing to shift from water-intensive crops.', '2025-06-15', '2026-06-14');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S127', 'Karnataka Agroforestry', 'Grants for planting trees alongside crops to improve soil health.', 'Karnataka', 'Farmers with land suitable for agroforestry.', '2025-09-01', '2027-08-31');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S128', 'Madhya Pradesh Farm Insurance', 'Comprehensive insurance for crops and livestock.', 'Madhya Pradesh', 'Farmers enrolled in state insurance programs.', '2025-04-20', '2026-04-19');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S129', 'Andhra Pradesh Fish Farming', 'Subsidies for aquaculture development in coastal areas.', 'Andhra Pradesh', 'Farmers with access to ponds or water bodies.', '2025-07-10', '2026-07-09');
INSERT INTO GovernmentSchemes (SchemeID, Title, [Description], TargetLocation, Eligibility, StartDate, EndDate) 
    VALUES ('S130', 'Kerala Cooperative Farming', 'Support for farmer cooperatives to pool resources.', 'Kerala', 'Farmers who are members of registered cooperatives.', '2025-05-15', '2027-05-14');

-- ############################### SchemeAlerts ###############################

INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA101', 'U101', 'S101', 'Apply for Pradhan Mantri Fasal Bima Yojana in Punjab to protect your crops from floods. Visit the state agricultural office.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA102', 'U102', 'S102', 'Kisan Samridhi Yojana offers organic farming subsidies in Gujarat. Get certified and apply at the local agri department.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA103', 'U103', 'S104', 'Free soil testing under Soil Health Card Scheme in Haryana. Register your farmland to improve yields.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA104', 'U105', 'S105', 'Join Agri-Tech Training in Uttar Pradesh to learn modern farming techniques. Enroll by July 2025.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA105', 'U106', 'S106', 'Livestock Insurance Scheme in Rajasthan protects your cattle. Register with veterinary services to apply.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA106', 'U108', 'S108', 'Kisan Credit Card offers low-interest loans in Madhya Pradesh. Submit land documents to avail benefits.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA107', 'U109', 'S103', 'Micro Irrigation Fund in Maharashtra supports drip systems. Apply if you own up to 5 hectares.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA108', 'U110', 'S102', 'Gujarat`s Kisan Samridhi Yojana promotes organic farming. Apply for subsidies with your certification.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA109', 'U111', 'S101', 'Punjab`s crop insurance scheme, Pradhan Mantri Fasal Bima Yojana, is open. Protect your crops from calamities.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA110', 'U112', 'S121', 'Haryana Seed Subsidy offers high-yield seeds. Register with agricultural cooperatives to apply.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA111', 'U114', 'S111', 'Kerala`s Rural Warehouse Scheme funds storage facilities. Apply as a cooperative or individual farmer.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA112', 'U115', 'S110', 'Andhra Pradesh Farm Mechanization Subsidy supports tractor purchases. Apply if you own over 2 hectares.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA113', 'U101', 'S122', 'Punjab Water Conservation Scheme offers irrigation incentives. Apply to save groundwater.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA114', 'U102', 'S124', 'Gujarat Dairy Development provides subsidies for dairy equipment. Apply if you own 5+ cattle.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA115', 'U103', 'S104', 'Haryana`s Soil Health Card Scheme offers free soil testing. Register to optimize fertilizer use.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA116', 'U105', 'S125', 'Uttar Pradesh Agri-Loan provides interest-free loans. Apply if you have no outstanding loans.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA117', 'U106', 'S126', 'Rajasthan Crop Diversification supports pulses. Apply to shift from water-intensive crops.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA118', 'U108', 'S128', 'Madhya Pradesh Farm Insurance covers crops and livestock. Enroll in state programs to apply.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA119', 'U109', 'S123', 'Maharashtra Horticulture Scheme funds fruit cultivation. Apply if your land suits horticulture.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA120', 'U110', 'S124', 'Gujarat`s Dairy Development Scheme offers cattle feed subsidies. Apply with 5+ cattle.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA121', 'U111', 'S122', 'Punjab Water Conservation Scheme promotes efficient irrigation. Apply to conserve water.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA122', 'U112', 'S121', 'Haryana Seed Subsidy provides high-yield seeds. Join agricultural cooperatives to apply.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA123', 'U114', 'S130', 'Kerala Cooperative Farming supports resource pooling. Apply as a registered cooperative member.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA124', 'U115', 'S129', 'Andhra Pradesh Fish Farming Scheme funds aquaculture. Apply if you have access to ponds.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA125', 'U101', 'S109', 'Mumbai`s Monsoon Crop Protection Scheme aids during heavy rains. Register crops to apply.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA126', 'U102', 'S107', 'Karnataka Solar Pump Subsidy supports irrigation. Apply if you lack reliable electricity.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA127', 'U103', 'S112', 'Tamil Nadu Drought Relief Fund aids farmers. Apply if in a drought-affected district.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA128', 'U105', 'S113', 'Himachal Pradesh Agri-Export Scheme supports spice exports. Apply with export-quality produce.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA129', 'U106', 'S114', 'West Bengal Women Farmer Empowerment offers training. Apply if aged 18-55 with land.');
INSERT INTO SchemeAlerts (AlertID, FarmerID, SchemeID, AlertMessage) 
    VALUES ('SA130', 'U108', 'S115', 'Odisha Pesticide Subsidy promotes eco-friendly pesticides. Apply if using integrated pest management.');



-- ############################### HarvestingReminders ###############################

INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR101', 'U101', 'Wheat', '2025-04-15', '08:00:00', 'Prepare labor and equipment for wheat harvest in Punjab. Check weather forecast.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR102', 'U102', 'Cotton', '2025-10-20', NULL, 'Cotton harvest due in Gujarat. Monitor for pests before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR103', 'U103', 'Barley', '2025-04-10', '09:00:00', 'Barley harvest in Haryana. Arrange storage to avoid post-harvest losses.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR104', 'U105', 'Sugarcane', '2025-11-15', NULL, 'Sugarcane harvest in Uttar Pradesh. Coordinate with mills for timely delivery.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR105', 'U106', 'Bajra', '2025-10-05', '07:00:00', 'Bajra harvest in Rajasthan. Ensure proper drying before storage.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR106', 'U108', 'Soybean', '2025-10-25', NULL, 'Soybean harvest in Madhya Pradesh. Check moisture levels before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR107', 'U109', 'Grapes', '2025-03-20', '10:00:00', 'Grape harvest in Maharashtra. Arrange for quick transport to markets.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR108', 'U110', 'Groundnut', '2025-11-10', NULL, 'Groundnut harvest in Gujarat. Ensure proper curing to maintain quality.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR109', 'U111', 'Mustard', '2025-04-25', '08:30:00', 'Mustard harvest in Punjab. Monitor for aphid damage before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR110', 'U112', 'Wheat', '2025-04-12', NULL, 'Wheat harvest in Haryana. Plan for timely threshing to avoid losses.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR111', 'U114', 'Coconut', '2025-06-15', '11:00:00', 'Coconut harvest in Kerala. Arrange climbers and check for nut maturity.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR112', 'U115', 'Rice', '2025-11-30', NULL, 'Rice harvest in Andhra Pradesh. Ensure fields are drained before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR113', 'U101', 'Rice', '2025-12-05', '07:30:00', 'Rice harvest in Punjab. Coordinate with buyers for immediate sale.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR114', 'U102', 'Castor', '2025-11-15', NULL, 'Castor harvest in Gujarat. Check seed maturity before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR115', 'U103', 'Mustard', '2025-04-20', '09:30:00', 'Mustard harvest in Haryana. Arrange for proper storage to avoid spoilage.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR116', 'U105', 'Rice', '2025-12-10', NULL, 'Rice harvest in Uttar Pradesh. Monitor weather to avoid rain damage.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR117', 'U106', 'Guar', '2025-10-15', '08:00:00', 'Guar harvest in Rajasthan. Ensure proper drying to maintain seed quality.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR118', 'U108', 'Maize', '2025-10-30', NULL, 'Maize harvest in Madhya Pradesh. Check for cob maturity before harvesting.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR119', 'U109', 'Sugarcane', '2025-12-01', '10:30:00', 'Sugarcane harvest in Maharashtra. Coordinate with mills for crushing.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR120', 'U110', 'Cotton', '2025-10-25', NULL, 'Cotton harvest in Gujarat. Arrange for ginning to maintain fiber quality.', 'Active');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR121', 'U111', 'Wheat', '2025-04-18', '07:00:00', 'Wheat harvest in Punjab completed. Update records for next season.', 'Completed');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR122', 'U112', 'Barley', '2025-04-08', NULL, 'Barley harvest in Haryana completed. Store properly to avoid moisture.', 'Completed');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR123', 'U114', 'Rubber', '2025-05-20', '12:00:00', 'Rubber harvest in Kerala completed. Process latex promptly.', 'Completed');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR124', 'U115', 'Turmeric', '2025-03-15', NULL, 'Turmeric harvest in Andhra Pradesh completed. Dry rhizomes properly.', 'Completed');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR125', 'U101', 'Barley', '2025-04-05', '08:00:00', 'Barley harvest in Punjab completed. Update yield data.', 'Completed');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR126', 'U102', 'Groundnut', '2025-11-05', NULL, 'Groundnut harvest in Gujarat cancelled due to pest damage.', 'Cancelled');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR127', 'U103', 'Wheat', '2025-04-15', '09:00:00', 'Wheat harvest in Haryana cancelled due to untimely rains.', 'Cancelled');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR128', 'U105', 'Maize', '2025-10-20', NULL, 'Maize harvest in Uttar Pradesh cancelled due to flood damage.', 'Cancelled');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR129', 'U106', 'Bajra', '2025-10-10', '07:30:00', 'Bajra harvest in Rajasthan cancelled due to drought.', 'Cancelled');
INSERT INTO HarvestingReminders (ReminderID, FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status) 
    VALUES ('HR130', 'U108', 'Soybean', '2025-10-28', NULL, 'Soybean harvest in Madhya Pradesh cancelled due to disease outbreak.', 'Cancelled');

-- ############################### ExpertGuides ###############################

INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG101', 'Wheat Cultivation in Punjab', 'Dr. Anil Kumar', 'Guide to high-yield wheat farming in Punjab.', 'Wheat is a key Rabi crop in Punjab. Select high-yield varieties like HD-2967. Sow in November, ensuring 120 kg/ha seed rate. Use 100 kg/ha nitrogen, 60 kg/ha phosphorus. Irrigate 4-5 times, especially at tillering and flowering. Control weeds with herbicides like 2,4-D. Harvest in April to avoid heat stress. Monitor for rust diseases.', 'Crop Management', '2024-10-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG102', 'Organic Cotton Farming in Gujarat', 'Prof. Meena Patel', 'Steps for organic cotton farming in Gujarat.', 'Organic cotton in Gujarat requires certified seeds and compost. Sow in June, spacing 90x60 cm. Use neem-based pesticides for bollworms. Apply 10 tons/ha farmyard manure. Irrigate weekly during flowering. Hand-pick cotton in October to maintain quality. Certify with NPOP standards for market access.', 'Organic Farming', '2024-11-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG103', 'Drip Irrigation for Haryana Farms', 'Dr. Rajesh Singh', 'Implementing drip irrigation in Haryana.', 'Drip irrigation saves 50% water in Haryana. Install drippers at 30 cm spacing for crops like wheat. Use 16 mm pipes, 4 L/h flow rate. Maintain filters to prevent clogging. Irrigate every 2-3 days, adjusting for soil type. Subsidies available under Micro Irrigation Fund.', 'Irrigation', '2024-12-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG104', 'Sugarcane Pest Control in Uttar Pradesh', 'Dr. Sanjay Verma', 'Managing pests in sugarcane fields.', 'Sugarcane in Uttar Pradesh faces borers and whiteflies. Use Trichogramma cards (50,000/ha) for biological control. Apply neem oil (5 L/ha) for whiteflies. Scout fields weekly. Avoid excessive nitrogen to reduce pest attraction. Harvest in November to minimize losses.', 'Pest Control', '2025-01-05');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG105', 'Bajra Cultivation in Rajasthan', 'Prof. Sunita Sharma', 'Guide to growing bajra in arid Rajasthan.', 'Bajra thrives in Rajasthan`s dry climate. Sow hybrid HHB-67 in July, using 4 kg/ha seeds. Space rows 45 cm apart. Apply 40 kg/ha nitrogen, 20 kg/ha phosphorus. Irrigate sparingly, 2-3 times. Harvest in October, drying grains to 12% moisture for storage.', 'Crop Management', '2024-09-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG106', 'Soybean Farming in Madhya Pradesh', 'Dr. Vikram Joshi', 'Techniques for high-yield soybean crops.', 'Soybean in Madhya Pradesh needs JS-335 variety. Sow in June, 70 kg/ha seeds. Use Rhizobium inoculant for nitrogen fixation. Irrigate at pod-filling stage. Control caterpillars with spinosad (0.5 L/ha). Harvest in October, ensuring 10% moisture content.', 'Crop Management', '2024-08-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG107', 'Grape Cultivation in Maharashtra', 'Prof. Neha Gupta', 'Best practices for grape farming.', 'Grapes in Maharashtra require Thompson Seedless variety. Plant in February, spacing 3x2 m. Prune vines in April for fruiting. Irrigate weekly, using drip systems. Apply gibberellic acid for berry size. Harvest in March, packing carefully for export.', 'Crop Management', '2025-02-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG108', 'Coconut Farming in Kerala', 'Dr. Shalini Nair', 'Managing coconut plantations in Kerala.', 'Coconut in Kerala needs West Coast Tall variety. Plant in May, 7.5 m spacing. Apply 50 kg manure/palm yearly. Irrigate during dry months. Control rhinoceros beetle with pheromone traps. Harvest every 45 days, ensuring mature nuts.', 'Crop Management', '2024-07-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG109', 'Rice Cultivation in Andhra Pradesh', 'Dr. Vijay Reddy', 'Optimizing rice yields in Andhra Pradesh.', 'Rice in Andhra Pradesh uses BPT-5204 variety. Transplant in July, 20x15 cm spacing. Apply 120 kg/ha nitrogen in splits. Irrigate fields with 5 cm water depth. Control blast with tricyclazole. Harvest in November, drying to 14% moisture.', 'Crop Management', '2024-06-05');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG110', 'Monsoon Crop Protection in Mumbai', 'Prof. Kiran Mehta', 'Protecting crops during Mumbai monsoons.', 'Monsoon in Mumbai requires raised beds for crops like vegetables. Use plastic mulching to reduce waterlogging. Apply fungicides like mancozeb for fungal diseases. Ensure proper drainage. Monitor for pests like snails, using baits. Harvest early if flooding is forecast.', 'Crop Management', '2025-03-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG111', 'Composting Techniques for Farmers', 'Dr. Rakesh Kumar', 'Creating nutrient-rich compost for farms.', 'Compost improves soil fertility. Layer crop residues, cow dung, and green waste in a 1:1:1 ratio. Maintain 50% moisture, turning every 2 weeks. Add bio-inoculants for faster decomposition. Compost is ready in 60-90 days. Apply 5 tons/ha before sowing.', 'Sustainable Farming', '2024-11-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG112', 'Livestock Health in Rajasthan', 'Dr. Suman Yadav', 'Managing cattle health in arid regions.', 'Cattle in Rajasthan need regular deworming and vaccination for FMD. Provide 10 kg green fodder daily. Use mineral supplements to prevent deficiencies. Ensure clean water access. Monitor for heat stress in summer, providing shade and ventilation.', 'Livestock Management', '2024-10-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG113', 'Solar Pumps for Irrigation', 'Prof. Deepak Joshi', 'Using solar pumps for efficient irrigation.', 'Solar pumps save energy costs. Install 5 HP pumps for 2-5 acres. Place panels in unshaded areas, cleaning monthly. Irrigate crops like wheat in 2–3 hour cycles. Maintain batteries for consistent performance. Subsidies available in Karnataka.', 'Agri-Tech', '2025-01-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG114', 'Pest Management in Karnataka', 'Dr. Manish Verma', 'Controlling pests in Karnataka crops.', 'Karnataka crops face pests like pod borers. Use pheromone traps (10/ha) for monitoring. Apply neem oil (3%) for early infestations. Introduce ladybirds for aphid control. Avoid broad-spectrum pesticides to protect pollinators. Scout fields biweekly.', 'Pest Control', '2024-09-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG115', 'Soil Testing in Haryana', 'Prof. Poonam Sharma', 'Importance of soil testing for farmers.', 'Soil testing optimizes fertilizer use. Collect 15-20 samples per hectare, 15 cm deep. Test for pH, NPK levels at local labs. Apply lime if pH < 6. Use 100 kg/ha nitrogen for wheat based on results. Free testing under Soil Health Card Scheme.', 'Soil Management', '2024-12-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG116', 'Coffee Farming in Brazil', 'Dr. Maria Silva', 'Guide to coffee cultivation in Brazil.', 'Coffee in Brazil uses Catuai variety. Plant in April, 2.5 m spacing. Apply 200 kg/ha nitrogen yearly. Irrigate during dry seasons. Control coffee berry borer with traps. Harvest in June-August, drying cherries to 11% moisture for quality.', 'Crop Management', '2024-08-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG117', 'Drought-Resistant Crops in Nairobi', 'Prof. James Mwangi', 'Growing resilient crops in Nairobi.', 'Nairobi`s dry climate suits sorghum and millet. Sow KAT-487 sorghum in March, 5 kg/ha. Space rows 60 cm apart. Apply 20 kg/ha phosphorus. Irrigate sparingly. Harvest in July, storing at 12% moisture. Subsidies available for seeds.', 'Crop Management', '2025-02-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG118', 'Irrigation in Cape Town', 'Dr. Sarah Botha', 'Efficient irrigation for Cape Town farms.', 'Cape Town`s water scarcity requires micro-irrigation. Use sprinklers for vegetables, 2 L/h flow. Irrigate early morning to reduce evaporation. Monitor soil moisture with tensiometers. Apply for irrigation funding to install systems.', 'Irrigation', '2024-07-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG119', 'Rice Farming in Bangkok', 'Prof. Somchai Wong', 'Optimizing rice yields in Bangkok.', 'Bangkok rice uses RD-41 variety. Transplant in June, 25x25 cm spacing. Apply 100 kg/ha nitrogen in 3 splits. Maintain 5 cm water depth. Control brown plant hopper with imidacloprid. Harvest in October, drying to 14% moisture.', 'Crop Management', '2024-06-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG120', 'Greenhouse Farming in Cairo', 'Dr. Ahmed Hassan', 'Guide to greenhouse farming in arid Cairo.', 'Greenhouses in Cairo suit tomatoes. Use polythene covers, 30x10 m size. Install drip irrigation, 2 L/h drippers. Maintain 25–30°C temperature. Apply 150 kg/ha nitrogen. Control whiteflies with yellow sticky traps. Harvest in 90 days.', 'Crop Management', '2025-03-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG121', 'Mustard Cultivation in Punjab', 'Dr. Harpreet Kaur', 'Growing mustard in Punjab`s Rabi season.', 'Mustard in Punjab uses Pusa Bold variety. Sow in October, 4 kg/ha seeds. Space rows 30 cm apart. Apply 60 kg/ha nitrogen, 40 kg/ha phosphorus. Irrigate at flowering stage. Harvest in March, drying seeds to 8% moisture.', 'Crop Management', '2024-10-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG122', 'Groundnut Farming in Gujarat', 'Prof. Sanjay Patel', 'Best practices for groundnut cultivation.', 'Groundnut in Gujarat uses GG-20 variety. Sow in June, 30 kg/ha seeds. Space rows 45 cm apart. Apply 25 kg/ha nitrogen, 50 kg/ha phosphorus. Irrigate 4–5 times. Control ticks with carbaryl. Harvest in October, drying pods to 10% moisture.', 'Crop Management', '2024-11-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG123', 'Agroforestry in Karnataka', 'Dr. Priya Rao', 'Integrating trees with crops in Karnataka.', 'Agroforestry in Karnataka uses teak and sandalwood with crops like maize. Plant trees 5 m apart, crops in between. Apply 5 tons/ha manure. Irrigate crops weekly, trees monthly. Harvest crops annually, trees after 10 years. Grants available.', 'Sustainable Farming', '2025-01-15');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG124', 'Fish Farming in Andhra Pradesh', 'Prof. Venkata Rao', 'Guide to aquaculture in Andhra Pradesh.', 'Fish farming in Andhra Pradesh uses rohu and catla. Stock ponds with 5,000 fingerlings/ha. Feed 3% body weight daily. Maintain 1.5 m water depth. Monitor oxygen levels. Harvest after 10 months, draining ponds carefully. Subsidies available.', 'Aquaculture', '2024-09-10');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG125', 'Rubber Cultivation in Kerala', 'Dr. Anil Thomas', 'Managing rubber plantations in Kerala.', 'Rubber in Kerala uses RRII-105 variety. Plant in June, 6x6 m spacing. Apply 50 kg/ha nitrogen yearly. Tap trees after 7 years, 30 cm height. Control fungal diseases with Bordeaux mixture. Harvest latex daily, processing immediately.', 'Crop Management', '2024-08-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG126', 'Turmeric Farming in Andhra Pradesh', 'Prof. Lakshmi Devi', 'Growing turmeric in Andhra Pradesh.', 'Turmeric in Andhra Pradesh uses Salem variety. Plant in May, 25 kg/ha rhizomes. Space rows 30 cm apart. Apply 100 kg/ha nitrogen, 60 kg/ha potassium. Irrigate every 10 days. Harvest in February, boiling rhizomes for curing.', 'Crop Management', '2024-12-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG127', 'Seed Treatment in Maharashtra', 'Dr. Rohan Deshmukh', 'Treating seeds for better yields.', 'Seed treatment in Maharashtra prevents diseases. Soak wheat seeds in carbendazim (2 g/kg) for 6 hours. Treat cotton seeds with Trichoderma (10 g/kg). Dry seeds in shade before sowing. Use treated seeds within 24 hours for best results.', 'Crop Management', '2025-02-20');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG128', 'Dairy Farming in Gujarat', 'Prof. Hitesh Patel', 'Managing dairy farms in Gujarat.', 'Dairy in Gujarat uses Gir cows. Feed 8 kg green fodder, 4 kg concentrate daily. Vaccinate for FMD, HS. Milk twice daily, maintaining hygiene. Use milking machines for efficiency. Apply for dairy subsidies to expand facilities.', 'Livestock Management', '2024-07-01');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG129', 'Crop Rotation in Uttar Pradesh', 'Dr. Anupam Singh', 'Benefits of crop rotation for soil health.', 'Crop rotation in Uttar Pradesh improves yields. Follow rice with wheat, then legumes. Apply 5 tons/ha manure before rice. Rotate every season to reduce pests. Test soil annually to adjust nutrients. Avoid monocropping to maintain fertility.', 'Sustainable Farming', '2024-10-05');
INSERT INTO ExpertGuides (GuideID, Title, Author, Summary, Content, Topic, PublicationDate) 
    VALUES ('EG130', 'Precision Farming in Punjab', 'Prof. Gurpreet Singh', 'Using technology for precision farming.', 'Precision farming in Punjab uses drones and sensors. Map fields with drones for soil variability. Apply fertilizers based on sensor data, 100 kg/ha nitrogen for wheat. Irrigate with automated systems. Training available under Agri-Tech programs.', 'Agri-Tech', '2025-03-10');



-- ############################### GuideReviews ###############################

INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR101', 'EG101', 'U101', 5, 'This wheat guide helped me choose the right variety and improve my yield in Punjab.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR102', 'EG102', 'U102', 4, 'Organic cotton tips were practical for Gujarat. Certification process was clear.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR103', 'EG103', 'U103', 5, 'Drip irrigation guide saved water on my Haryana farm. Subsidies info was useful.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR104', 'EG104', 'U105', 4, 'Sugarcane pest control tips reduced losses in Uttar Pradesh. More examples needed.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR105', 'EG105', 'U106', 5, 'Bajra guide was spot-on for Rajasthan`s dry climate. Harvest tips worked well.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR106', 'EG106', 'U108', 4, 'Soybean guide helped with seed choice in Madhya Pradesh. Irrigation advice was clear.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR107', 'EG107', 'U109', 5, 'Grape cultivation guide improved my Maharashtra vineyard. Pruning tips were key.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR108', 'EG108', 'U114', 5, 'Coconut guide was very helpful for my Kerala farm. Pest control tips worked.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR109', 'EG109', 'U115', 4, 'Rice guide optimized my Andhra Pradesh yield. More pest control options would help.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR110', 'EG110', 'U109', 3, 'Monsoon protection guide was useful but lacked details for Maharashtra vegetables.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR111', 'EG111', 'U101', 4, 'Composting guide improved my Punjab soil. Bio-inoculant sourcing was unclear.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR112', 'EG112', 'U106', 5, 'Livestock health guide helped my Rajasthan cattle. Vaccination tips were practical.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR113', 'EG113', 'U108', 4, NULL);
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR114', 'EG114', 'U114', 3, 'Pest management guide was okay for Karnataka, but needed more local examples.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR115', 'EG115', 'U112', 5, 'Soil testing guide was a game-changer for my Haryana farm. Free testing was great.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR116', 'EG116', 'U115', 2, 'Brazil coffee guide was not relevant for Andhra Pradesh. Too region-specific.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR117', 'EG117', 'U106', 4, 'Nairobi drought crop guide helped with Rajasthan millet. More seed info needed.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR118', 'EG118', 'U102', 5, 'Cape Town irrigation guide inspired my Gujarat farm. Sprinkler tips were useful.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR119', 'EG119', 'U115', 3, 'Bangkok rice guide had some useful tips but was too specific for Andhra Pradesh.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR120', 'EG120', 'U106', 2, 'Cairo greenhouse guide was not practical for Rajasthan`s open fields.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR121', 'EG121', 'U111', 5, 'Mustard guide was perfect for Punjab. Improved my harvest with irrigation tips.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR122', 'EG122', 'U110', 4, 'Groundnut guide helped my Gujarat farm. Pest control advice was effective.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR123', 'EG123', 'U114', 3, NULL);
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR124', 'EG124', 'U115', 5, 'Fish farming guide boosted my Andhra Pradesh pond yield. Feeding tips were great.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR125', 'EG125', 'U114', 4, 'Rubber guide was useful for Kerala. Tapping instructions were clear.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR126', 'EG126', 'U115', 5, 'Turmeric guide improved my Andhra Pradesh harvest. Curing tips were spot-on.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR127', 'EG127', 'U109', 4, NULL);
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR128', 'EG128', 'U102', 5, 'Dairy guide helped my Gujarat farm. Milking machine advice was practical.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR129', 'EG129', 'U105', 1, 'Crop rotation guide was too vague for Uttar Pradesh. Needed more specifics.');
INSERT INTO GuideReviews (ReviewID, GuideID, FarmerID, Rating, Comment) 
    VALUES ('GR130', 'EG130', 'U111', 4, NULL);

-- ############################### DiscussionForums ###############################

INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D101', 'U101', 'Wheat Rust Issues in Punjab', 'Pest Control', 'I`m seeing yellowing leaves on my wheat crop in Punjab. Could it be rust? Has anyone used fungicides like propiconazole effectively?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D102', 'U102', 'Organic Cotton Certification in Gujarat', 'Organic Farming', 'I`m trying to certify my cotton farm in Gujarat as organic. The NPOP process seems complex. Any tips from farmers who`ve done it?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D103', 'U103', 'Drip Irrigation Challenges in Haryana', 'Irrigation', 'My drip irrigation system in Haryana keeps clogging. Are there affordable filters or maintenance tricks you recommend?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D104', 'U105', 'Sugarcane Borers in Uttar Pradesh', 'Pest Control', 'Sugarcane borers are damaging my fields in Uttar Pradesh. Has anyone tried Trichogramma cards? How effective are they?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D105', 'U106', 'Bajra Yield Tips for Rajasthan', 'Crop Management', 'My bajra yield in Rajasthan is low this year. Any advice on hybrid seeds or fertilization schedules that worked for you?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D106', 'U108', 'Soybean Harvest Timing in Madhya Pradesh', 'Crop Management', 'When`s the best time to harvest soybeans in Madhya Pradesh? My pods look ready, but I`m worried about moisture content.');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D107', 'U109', 'Grape Pruning in Maharashtra', 'Crop Management', 'I`m new to grape farming in Maharashtra. When and how should I prune my vines for better fruiting? Any tips?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D108', 'U114', 'Coconut Pest Control in Kerala', 'Pest Control', 'Rhinoceros beetles are attacking my coconut palms in Kerala. Are pheromone traps effective, or should I try something else?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D109', 'U115', 'Rice Blast Management in Andhra Pradesh', 'Pest Control', 'Rice blast is affecting my fields in Andhra Pradesh. Has anyone used tricyclazole successfully? What`s the best application method?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D110', 'U111', 'Precision Farming Tools in Punjab', 'Agri-Tech', 'I heard drones can help with wheat farming in Punjab. Has anyone used them for soil mapping or spraying? Worth the cost?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D111', 'U101', 'Mustard Fertilizer in Punjab', 'Crop Management', 'What`s the best fertilizer schedule for mustard in Punjab? I`m using Pusa Bold and want to boost yields.');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D112', 'U102', 'Groundnut Pest Issues in Gujarat', 'Pest Control', 'Ticks are damaging my groundnut crop in Gujarat. Has anyone tried carbaryl or other solutions? Please share your experience.');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D113', 'U103', 'Soil Testing Labs in Haryana', 'Soil Management', 'Where can I get reliable soil testing in Haryana? The Soil Health Card Scheme is free, but are private labs better?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D114', 'U105', 'Crop Rotation for Rice in Uttar Pradesh', 'Sustainable Farming', 'I`m planning to rotate rice with wheat in Uttar Pradesh. Should I include legumes? What`s worked for you?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D115', 'U106', 'Cattle Health in Rajasthan', 'Livestock Management', 'My cattle in Rajasthan are showing signs of heat stress. Any affordable ways to provide shade or cooling?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D116', 'U108', 'Maize Irrigation in Madhya Pradesh', 'Irrigation', 'How often should I irrigate maize in Madhya Pradesh? My soil is loamy, but yields are dropping. Any advice?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D117', 'U109', 'Sugarcane Mills in Maharashtra', 'Crop Management', 'Which sugar mills in Maharashtra offer the best rates for sugarcane? Also, any tips for timely delivery?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D118', 'U114', 'Rubber Tapping in Kerala', 'Crop Management', 'I`m starting rubber tapping in Kerala. What`s the best height and frequency to tap trees for maximum latex?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D119', 'U115', 'Fish Farming Subsidies in Andhra Pradesh', 'Aquaculture', 'I`m planning fish farming in Andhra Pradesh. Has anyone applied for subsidies? How`s the process?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D120', 'U110', 'Dairy Equipment in Gujarat', 'Livestock Management', 'I want to buy milking machines for my Gujarat dairy farm. Which brands are reliable, and are subsidies available?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D121', 'U111', 'Wheat Seed Varieties in Punjab', 'Crop Management', 'I`m choosing wheat seeds for Punjab. Is HD-2967 still the best, or are newer varieties better?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D122', 'U112', 'Barley Irrigation in Haryana', 'Irrigation', 'How much irrigation does barley need in Haryana? My fields are drying out, and yields are low.');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D123', 'U110', 'Cotton Market Prices in Gujarat', 'Crop Management', 'What are the current cotton prices in Gujarat? Should I sell now or wait for better rates?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D124', 'U112', 'Soil Fertility in Haryana', 'Soil Management', 'My Haryana soil seems less fertile this year. Has anyone tried compost or biofertilizers with success?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D125', 'U115', 'Turmeric Curing in Andhra Pradesh', 'Crop Management', 'I`m harvesting turmeric in Andhra Pradesh. What`s the best way to boil and cure rhizomes for market?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D126', 'U101', 'Compost Making in Punjab', 'Sustainable Farming', 'I want to start composting in Punjab. What`s the best mix of crop residue and manure for wheat fields?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D127', 'U102', 'Solar Pumps in Gujarat', 'Agri-Tech', 'I`m considering solar pumps for my Gujarat farm. Are they reliable, and how`s the maintenance?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D128', 'U106', 'Guar Cultivation in Rajasthan', 'Crop Management', 'My guar crop in Rajasthan isn`t yielding well. Any tips on spacing or pest control?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D129', 'U108', 'Drone Spraying in Madhya Pradesh', 'Agri-Tech', 'Has anyone used drones for pesticide spraying in Madhya Pradesh? How effective are they for soybeans?');
INSERT INTO DiscussionForums (ThreadID, FarmerID, Title, Category, InitialMessage) 
    VALUES ('D130', 'U114', 'Agroforestry Benefits in Kerala', 'Sustainable Farming', 'I`m thinking of adding teak to my Kerala coconut farm. Has anyone tried agroforestry? What are the benefits?');


-- ############################### TraderFavorites ###############################

INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF101', 'U116', 'U101');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF102', 'U116', 'U103');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF103', 'U116', 'U105');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF104', 'U116', 'U111');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF105', 'U116', 'U112');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF106', 'U117', 'U102');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF107', 'U117', 'U109');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF108', 'U117', 'U110');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF109', 'U117', 'U114');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF110', 'U118', 'U105');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF111', 'U118', 'U115');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF112', 'U118', 'U108');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF113', 'U120', 'U115');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF114', 'U120', 'U108');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF115', 'U120', 'U114');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF116', 'U120', 'U109');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF117', 'U121', 'U114');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF118', 'U121', 'U115');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF119', 'U121', 'U106');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF120', 'U121', 'U112');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF121', 'U122', 'U109');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF122', 'U122', 'U102');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF123', 'U122', 'U110');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF124', 'U122', 'U103');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF125', 'U123', 'U106');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF126', 'U123', 'U111');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF127', 'U123', 'U101');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF128', 'U123', 'U108');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF129', 'U118', 'U101');
INSERT INTO TraderFavorites (FavoriteID, TraderID, FarmerID) 
    VALUES ('TF130', 'U120', 'U102');    

-- ############################### TraderCropPreferences ###############################

INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP101', 'U116', 'Wheat', 22.00, 30.00, 2000.00, 10000.00, 500);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP102', 'U116', 'Mustard', 45.00, 60.00, 1000.00, 5000.00, 500);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP103', 'U116', 'Rice', 25.00, 35.00, 2000.00, 8000.00, 600);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP104', 'U116', 'Barley', 20.00, 28.00, 1000.00, 6000.00, NULL);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP105', 'U116', 'Sugarcane', NULL, NULL, 5000.00, 20000.00, 600);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP106', 'U117', 'Grapes', 80.00, 120.00, 500.00, 2000.00, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP107', 'U117', 'Sugarcane', 3.00, 5.00, 10000.00, 30000.00, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP108', 'U117', 'Cotton', 40.00, 55.00, 1000.00, 5000.00, 700);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP109', 'U117', 'Coconut', 20.00, 40.00, NULL, NULL, 1000);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP110', 'U118', 'Rice', 25.00, 35.00, 2000.00, 10000.00, 900);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP111', 'U118', 'Soybean', 40.00, 50.00, 1000.00, 6000.00, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP112', 'U118', 'Maize', 20.00, 30.00, 1500.00, 7000.00, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP113', 'U118', 'Turmeric', NULL, NULL, 200.00, 1000.00, 900);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP114', 'U120', 'Rice', 24.00, 34.00, 2000.00, 10000.00, 600);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP115', 'U120', 'Turmeric', 100.00, 150.00, 300.00, 1500.00, 600);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP116', 'U120', 'Rubber', 90.00, 130.00, 500.00, 2000.00, NULL);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP117', 'U120', 'Cotton', 42.00, 58.00, 1000.00, 4000.00, 700);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP118', 'U121', 'Coconut', 22.00, 38.00, 1000.00, 5000.00, 700);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP119', 'U121', 'Rubber', 95.00, 140.00, 400.00, 1800.00, 700);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP120', 'U121', 'Rice', 23.00, 33.00, NULL, NULL, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP121', 'U121', 'Grapes', 85.00, 115.00, 600.00, 2500.00, 800);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP122', 'U122', 'Grapes', 80.00, 110.00, 500.00, 2000.00, 300);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP123', 'U122', 'Cotton', 40.00, 55.00, 1000.00, 4500.00, 400);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP124', 'U122', 'Groundnut', 50.00, 70.00, 800.00, 3000.00, NULL);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP125', 'U122', 'Wheat', 21.00, 29.00, 1500.00, 8000.00, 500);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP126', 'U123', 'Bajra', 20.00, 30.00, 1000.00, 6000.00, 200);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP127', 'U123', 'Guar', 35.00, 50.00, 800.00, 4000.00, 200);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP128', 'U123', 'Mustard', NULL, NULL, 1000.00, 5000.00, 300);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP129', 'U123', 'Soybean', 38.00, 52.00, 1200.00, 6000.00, NULL);
INSERT INTO TraderCropPreferences (PreferenceID, TraderID, CropName, MinPrice, MaxPrice, MinQuantity, MaxQuantity, SourcingDistance) 
    VALUES ('CP130', 'U118', 'Cotton', 41.00, 56.00, 1000.00, 5000.00, 900);



-- Insert 20 records into ShipmentTracking for all transactions (TN101 to TN120) from Transactions table
USE EAgriPortalDB
GO

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH101', 'TN101', 'Delivered', '2025-05-13', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH102', 'TN102', 'Pending', '2025-05-15', DATEADD(DAY, 2, '2025-05-05'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH103', 'TN103', 'Delivered', '2025-05-02', DATEADD(DAY, 1, '2025-05-02'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH104', 'TN104', 'InTransit', '2025-05-18', DATEADD(DAY, 1, '2025-05-13'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH105', 'TN105', 'Cancelled', NULL, DATEADD(DAY, 2, '2025-04-25'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH106', 'TN106', 'Pending', '2025-05-17', DATEADD(DAY, 2, '2025-05-03'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH107', 'TN107', 'Delivered', '2025-05-12', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH108', 'TN108', 'Delivered', '2025-05-01', DATEADD(DAY, 1, '2025-05-01'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH109', 'TN109', 'InTransit', '2025-05-16', DATEADD(DAY, 2, '2025-05-07'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH110', 'TN110', 'Cancelled', NULL, DATEADD(DAY, 2, '2025-04-27'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH111', 'TN111', 'Pending', '2025-05-14', DATEADD(DAY, 2, '2025-05-08'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH112', 'TN112', 'Cancelled', NULL, DATEADD(DAY, 2, '2025-05-02'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH113', 'TN113', 'InTransit', '2025-05-17', DATEADD(DAY, 1, '2025-05-12'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH114', 'TN114', 'Delivered', '2025-04-22', DATEADD(DAY, 1, '2025-04-22'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH115', 'TN115', 'Pending', '2025-05-16', DATEADD(DAY, 2, '2025-05-01'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH116', 'TN116', 'InTransit', '2025-05-15', DATEADD(DAY, 2, '2025-05-09'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH117', 'TN117', 'Delivered', '2025-05-11', DATEADD(DAY, 1, '2025-05-11'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH118', 'TN118', 'Delivered', '2025-05-03', DATEADD(DAY, 1, '2025-05-03'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH119', 'TN119', 'Pending', '2025-05-19', DATEADD(DAY, 1, '2025-05-14'));

INSERT INTO ShipmentTracking (ShipmentID, TransactionID, [Status], ExpectedDeliveryDate, UpdatedAt)
VALUES ('SH120', 'TN120', 'InTransit', '2025-05-24', DATEADD(DAY, 2, '2025-04-26'));
GO

-- ############################### Announcements ###############################

INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A101', 'U124', 'New Mobile App Launch', 'We`re excited to announce the EAgriPortalDB mobile app, now available on iOS and Android! Access ExpertGuides, TraderCropPreferences, and DiscussionForums on the go. Download from the App Store or Google Play. For support, contact help@eagriportal.com.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A102', 'U124', 'Drip Irrigation Subsidy 2025', 'The government has launched a new drip irrigation subsidy for farmers in Haryana and Punjab. Get up to 50% funding for systems. Apply via SchemeAlerts by June 30, 2025. Visit your local agriculture office for details.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A103', 'U124', 'Monsoon Alert for Maharashtra', 'Heavy rains are expected in Maharashtra from May 20, 2025. Protect crops with raised beds and mulching. Check WeatherAlerts for updates. Review our Monsoon Crop Protection guide (EG110) for tips.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A104', 'U124', 'Wheat Market Price Update', 'Wheat prices in Punjab are stable at ₹25-30/kg as of May 15, 2025. Traders, update your TraderCropPreferences to connect with farmers. Farmers, list your produce for better deals.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A105', 'U124', 'Farmer Webinar: Organic Farming', 'Join our webinar on organic farming on June 5, 2025, at 2 PM IST. Learn NPOP certification tips from experts. Register via the platform`s Events section. Open to all Gujarat farmers.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A106', 'U124', 'How to Use TraderFavorites', 'Traders, use TraderFavorites to save reliable farmers for quick trades. Add farmers via their profiles. Review our TraderFavorites Guidelines (P108) for best practices. Contact support for help.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A107', 'U124', 'Soil Testing Campaign', 'Free soil testing under the Soil Health Card Scheme is available in Haryana until July 15, 2025. Test NPK levels to optimize fertilizers. Apply via SchemeAlerts or visit local labs.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A108', 'U124', 'Platform Maintenance May 20', 'Scheduled maintenance is set for May 20, 2025, from 1-3 AM IST. The platform may be unavailable. Save your work in advance. Check our Platform Maintenance Policy (P129) for details.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A109', 'U124', 'Rice Price Surge in Andhra', 'Rice prices in Andhra Pradesh have risen to ₹30-35/kg due to high demand. Traders, adjust TraderCropPreferences. Farmers, connect with traders via the platform for better rates.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A110', 'U124', 'Discussion Forum Tips', 'Engage in DiscussionForums to share farming tips! Keep posts respectful and on-topic. Review our Forum Conduct Policy (P102) before posting. Report issues to moderators via support.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A111', 'U124', 'Kisan Meet in Bangalore', 'Join the Kisan Meet in Bangalore on June 15, 2025, to network with farmers and traders. Discuss crop trends and schemes. Register by June 1 via the Events section.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A112', 'U124', 'New ExpertGuides Added', 'We`ve added 5 new ExpertGuides on turmeric, rubber, and precision farming. Access them in the Guides section. Share your feedback via GuideReviews to help improve content.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A113', 'U124', 'Drought Alert for Rajasthan', 'Rajasthan faces drought risks in June 2025. Use drought-resistant crops like bajra. Check WeatherAlerts and our Drought-Resistant Crops guide (EG117) for strategies.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A114', 'U124', 'Trader Crop Alerts Guide', 'Traders, optimize TraderCropPreferences for tailored crop alerts. Set realistic price and quantity ranges. See our Trader Crop Alerts Policy (P125) for tips. Contact support for setup help.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A115', 'U124', 'Loan Scheme for Kerala Farmers', 'A new loan scheme for coconut and rubber farmers in Kerala offers low-interest rates. Apply by July 10, 2025, via SchemeAlerts. Contact local banks for eligibility details.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A116', 'U125', 'Account Verification Reminder', 'Unverified accounts will be restricted after June 15, 2025. Submit your phone, email, and agricultural proof now. Check our Account Verification Policy (P116) for details.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A117', 'U125', 'Cotton Market Update Gujarat', 'Cotton prices in Gujarat are ₹45-55/kg as of May 15, 2025. Traders, update TraderCropPreferences. Farmers, list your cotton to connect with buyers.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A118', 'U125', 'Monsoon Prep Webinar', 'Join our webinar on monsoon crop protection on May 25, 2025, at 3 PM IST. Learn from experts about mulching and drainage. Register via the Events section.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A119', 'U125', 'New SchemeAlerts Feature', 'SchemeAlerts now includes real-time subsidy notifications. Farmers, enable alerts in your settings to stay updated on schemes like PM-KISAN. See our Data Consent Policy (P114).');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A120', 'U125', 'Sugarcane Subsidy Uttar Pradesh', 'Uttar Pradesh farmers can apply for a sugarcane subsidy until June 30, 2025. Get up to ₹5000/ha. Apply via SchemeAlerts or visit your agriculture office.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A121', 'U125', 'How to Use ExpertGuides', 'Farmers, explore ExpertGuides for crop tips. Rate guides via GuideReviews to share feedback. Check our ExpertGuides Usage Policy (P105) for guidelines. Contact support for access issues.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A122', 'U125', 'Trader Meet in Delhi', 'Traders, attend our Delhi Trader Meet on June 10, 2025, to discuss market trends. Network with farmers and traders. Register by June 5 via the Events section.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A123', 'U125', 'Soybean Demand Forecast', 'Soybean demand is rising in Madhya Pradesh, with prices at ₹40-50/kg. Traders, update TraderCropPreferences. Farmers, list your produce to meet demand.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A124', 'U125', 'Weather Alert for Andhra', 'Heavy rainfall is forecast for Andhra Pradesh from May 18, 2025. Protect rice crops with proper drainage. Check WeatherAlerts and our Rice Cultivation guide (EG109).');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A125', 'U125', 'Organic Farming Workshop', 'A workshop on organic farming is scheduled for July 1, 2025, in Gujarat. Learn certification and pest control. Register by June 20 via the Events section.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A126', 'U125', 'Profile Update Reminder', 'Update your profile details (address, phone) by June 1, 2025, to ensure accurate alerts. See our User Data Updates Policy (P119). Contact support for assistance.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A127', 'U125', 'Solar Pump Subsidy', 'A new solar pump subsidy is available for Karnataka farmers until August 1, 2025. Get up to 60% funding. Apply via SchemeAlerts or visit local offices.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A128', 'U125', 'GuideReviews Best Practices', 'When reviewing ExpertGuides, provide honest, specific feedback. Avoid offensive comments. Review our User Conduct in Reviews Policy (P126). Report issues to moderators.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A129', 'U125', 'Grapes Market Update', 'Grape prices in Maharashtra are ₹80-110/kg due to export demand. Traders, adjust TraderCropPreferences. Farmers, connect with buyers via the platform.');
INSERT INTO Announcements (AnnouncementID, AdminID, Title, Content) 
    VALUES ('A130', 'U125', 'Anti-Fraud Measures Update', 'We`ve enhanced fraud detection for trades. Report suspicious activity immediately. Review our Anti-Fraud Measures Policy (P130). Contact support for concerns.');

 
-- ############################### Policies ###############################

INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P101', 'U124', 'User Account Security', 'All users must maintain secure passwords with at least 8 characters, including letters, numbers, and symbols. Do not share account credentials. Enable two-factor authentication where available. The platform is not liable for unauthorized access due to user negligence. Report suspicious activity to support within 24 hours. Violations may lead to account suspension.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P102', 'U124', 'Discussion Forum Conduct', 'Users must post respectful, relevant content in DiscussionForums. No abusive language, personal attacks, or spam is allowed. Posts must relate to agriculture or platform features. Moderators may remove violating content, and repeated offenses may result in a ban. Report inappropriate posts via the platform’s reporting tool.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P103', 'U124', 'Fair Trade Practices', 'Traders must offer fair prices aligned with market rates for crops listed in TraderCropPreferences. Misrepresenting crop quality or quantity is prohibited. Farmers must provide accurate produce details. Violations may lead to warnings or account restrictions. Document all transactions for transparency.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P104', 'U124', 'Data Privacy Protection', 'User data (e.g., email, phone, address) is stored securely and used only for platform services like alerts and trade matching. Data is not shared with third parties without consent, except as required by law. Users can request data deletion via support. Unauthorized data access is prohibited.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P105', 'U124', 'ExpertGuides Usage', 'ExpertGuides are for personal, non-commercial use by farmers. Do not reproduce or distribute guide content without permission. Farmers may submit reviews via GuideReviews, adhering to respectful language. Misuse of guides or false reviews may result in restricted access to platform features.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P106', 'U124', 'Organic Produce Verification', 'Farmers claiming organic produce must provide valid NPOP certification. Traders sourcing organic crops via TraderCropPreferences must verify certifications. Misrepresenting non-organic produce as organic is a serious violation, leading to suspension. Report issues to the platform for investigation.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P107', 'U124', 'Dispute Resolution Process', 'Trade disputes must be reported within 7 days via the platform’s dispute form. Provide evidence like contracts or messages. Admins will mediate, and decisions are final. Repeated disputes may lead to account review. Users must cooperate fully during investigations.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P108', 'U124', 'TraderFavorites Guidelines', 'Traders may add farmers to TraderFavorites based on trade reliability. Favoriting is for professional purposes only; personal bias or discrimination is prohibited. Farmers can request removal from a trader’s favorites. Misuse of this feature may result in restrictions.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P109', 'U124', 'Government Scheme Compliance', 'Farmers applying for schemes via SchemeAlerts must provide accurate eligibility details. Misrepresenting information to access subsidies is prohibited and may lead to legal action. Traders must not influence scheme applications. Report violations to platform support.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P110', 'U124', 'Anti-Harassment Policy', 'Harassment, including threats or discriminatory remarks, is strictly prohibited on the platform. This applies to forums, messages, and reviews. Victims should report incidents with evidence. Offenders face warnings, suspensions, or bans, depending on severity.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P111', 'U124', 'Crop Quality Standards', 'Farmers must ensure crops meet quality standards specified in TraderCropPreferences (e.g., moisture content, pest-free). Traders must inspect produce before finalizing deals. Non-compliant produce may lead to rejected transactions or penalties. Maintain records for disputes.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P112', 'U124', 'Platform Access Restrictions', 'Accounts inactive for 12 months may be deactivated. Users engaging in fraudulent activities, such as fake profiles or transactions, will be banned. Appeals can be submitted within 30 days with evidence. Admins reserve the right to restrict access for policy violations.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P113', 'U124', 'Monsoon Crop Trading', 'Traders sourcing monsoon crops must account for weather risks and ensure timely transport. Farmers must disclose crop conditions affected by heavy rains. Misrepresentation of crop status during monsoons may lead to penalties. Use platform alerts for weather updates.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P114', 'U124', 'Data Consent for Alerts', 'Users opting into alerts (e.g., SchemeAlerts, TraderCropPreferences) consent to data processing for personalized notifications. Opt-out is available via account settings. Unauthorized use of alert data by users is prohibited and may lead to account suspension.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P115', 'U124', 'Livestock Trade Guidelines', 'Traders sourcing livestock must verify health certifications from farmers. Farmers must provide vaccination records. Misrepresenting livestock health is prohibited and may result in trade bans. All transactions must comply with local animal welfare laws.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P116', 'U125', 'Account Verification Process', 'New users must verify their identity with a valid phone number and email. Farmers and traders must submit proof of agricultural activity (e.g., land records, trade license). Unverified accounts are restricted after 30 days. False documentation leads to bans.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P117', 'U125', 'Forum Post Moderation', 'Moderators review DiscussionForums posts for compliance with conduct rules. Off-topic, promotional, or offensive posts will be removed. Users receive warnings for first violations; repeated issues may lead to posting restrictions. Appeal removals via support.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P118', 'U125', 'Trade Documentation', 'All trade agreements via the platform must be documented with price, quantity, and quality terms. Use platform messaging for records. Failure to provide documentation during disputes may result in unfavorable rulings. Retain records for at least 6 months.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P119', 'U125', 'User Data Updates', 'Users must update profile details (e.g., address, phone) within 15 days of changes. Outdated information may disrupt alerts or trades. Admins may request verification for updates. Failure to comply may lead to temporary account restrictions.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P120', 'U125', 'HarvestingReminders Usage', 'Farmers using HarvestingReminders must set accurate crop and date details. Misuse, such as spamming reminders, is prohibited. Admins may disable reminder features for violators. Contact support for technical issues with reminders.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P121', 'U125', 'Fair Pricing Policy', 'Traders must base prices in TraderCropPreferences on market trends, not speculative hikes. Farmers must not inflate produce prices beyond reasonable margins. Price gouging may lead to warnings or trade restrictions. Report unfair pricing to admins.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P122', 'U125', 'Dispute Evidence Submission', 'Users involved in disputes must submit evidence (e.g., photos, messages) within 5 days of filing. Incomplete submissions may delay resolution. Evidence must be clear and relevant. Falsified evidence results in immediate account suspension.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P123', 'U125', 'Organic Certification Compliance', 'Farmers must renew organic certifications annually and upload proof to the platform. Traders must verify certifications before trading. Non-compliance with organic standards may lead to removal of organic claims and penalties.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P124', 'U125', 'Platform Feedback Policy', 'Users may submit feedback on platform features via support. Feedback must be constructive and avoid abusive language. False or malicious feedback may lead to warnings. Admins use feedback to improve services but do not guarantee implementation.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P125', 'U125', 'Trader Crop Alerts', 'Traders using TraderCropPreferences for alerts must specify realistic price and quantity ranges. Abusing alerts (e.g., spamming farmers) is prohibited. Violations may restrict alert access. Contact support for issues with alert settings.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P126', 'U125', 'User Conduct in Reviews', 'GuideReviews must be honest and relevant to ExpertGuides. Defamatory or irrelevant comments are prohibited. Reviews violating this policy will be removed, and users may face review restrictions. Report inappropriate reviews to platform moderators.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P127', 'U125', 'Soil Testing Compliance', 'Farmers using soil testing schemes via SchemeAlerts must follow Soil Health Card guidelines. Misusing scheme benefits (e.g., reselling test kits) is prohibited and may lead to scheme disqualification. Report misuse to platform support.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P128', 'U125', 'Trade Dispute Mediation', 'Admins mediate trade disputes impartially, based on evidence. Users must respond to mediation requests within 3 days. Non-cooperation may result in unfavorable decisions. Repeated disputes may lead to trade restrictions on the platform.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P129', 'U125', 'Platform Maintenance Downtime', 'Scheduled maintenance will be announced 48 hours in advance. Unscheduled downtime will be minimized. Users must not exploit downtime for fraudulent activities. Report issues during downtime to support. The platform is not liable for losses during downtime.');
INSERT INTO Policies (PolicyID, AdminID, Title, Content) 
    VALUES ('P130', 'U125', 'Anti-Fraud Measures', 'Fraudulent activities, such as fake trades or profile misrepresentation, are strictly prohibited. Admins monitor transactions for suspicious activity. Violators face immediate bans and potential legal action. Report suspected fraud to platform support promptly.');
