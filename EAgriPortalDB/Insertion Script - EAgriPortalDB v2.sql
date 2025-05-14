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

