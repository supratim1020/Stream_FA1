using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infosys.EAgriculture.DAL.Models;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;

namespace Infosys.EAgriculture.DAL
{
    public class EAgricultureRepository
    {
        private EagriPortalDbContext context { get; set; }
        public EAgricultureRepository(EagriPortalDbContext context)
        {
            this.context = context;
        }

        public List<User> GetAllUsers()
        {
            List<User> usersList = new List<User>();
            try
            {
                usersList = context.Users.ToList();

            }
            catch (Exception)
            {
                usersList = null;
            }
            return usersList;
        }

        public User GetUserDetailsByID(string userId)
        {
            User user;
            try
            {
                user = (from u in context.Users where u.UserId.Equals(userId) select u).FirstOrDefault();
            }
            catch (Exception)
            {
                user = null;
            }
            return user;
        }

        #region 127888: Track past transactions

        public List<FarmerTransactionHistory> GetFarmerTransactionHistoryByFarmerID(string farmerId)
        {
            List<FarmerTransactionHistory> transactionHistoryList = new List<FarmerTransactionHistory>();

            transactionHistoryList = (from t in context.Transactions
                                      join c in context.CropAvailabilityDetails on t.ListingId equals c.ListingId
                                      join u in context.Users on t.TraderId equals u.UserId
                                      where t.FarmerId == farmerId
                                      select new FarmerTransactionHistory
                                      {
                                          TransactionID = t.TransactionId,
                                          CropName = c.CropName,
                                          QuantityRequested = t.QuantityRequested,
                                          OfferedPrice = t.OfferedPrice,
                                          TotalAmount = t.QuantityRequested * t.OfferedPrice,
                                          RequestDate = t.RequestDate,
                                          UserID = u.UserId,
                                          FullName = u.FullName,
                                          Status = t.Status
                                      }).ToList();

            return transactionHistoryList;
        }

        public List<FarmerTransactionHistory> GetFarmerTransactionHistoryByFilter(string farmerId, string cropName, DateTime? startDate, DateTime? endDate, string traderId)
        {
            List<FarmerTransactionHistory> transactionHistoryList = new List<FarmerTransactionHistory>();

            transactionHistoryList = (from t in context.Transactions
                                      join c in context.CropAvailabilityDetails on t.ListingId equals c.ListingId
                                      join u in context.Users on t.TraderId equals u.UserId
                                      where t.FarmerId == farmerId
                                            && (cropName == null || c.CropName == cropName)
                                            && (startDate == null || t.RequestDate >= startDate)
                                            && (endDate == null || t.RequestDate <= endDate)
                                            && (traderId == null || u.UserId == traderId)
                                      select new FarmerTransactionHistory
                                      {
                                          TransactionID = t.TransactionId,
                                          CropName = c.CropName,
                                          QuantityRequested = t.QuantityRequested,
                                          OfferedPrice = t.OfferedPrice,
                                          TotalAmount = t.QuantityRequested * t.OfferedPrice,
                                          RequestDate = t.RequestDate,
                                          UserID = u.UserId,
                                          FullName = u.FullName,
                                          Status = t.Status
                                      }).ToList();

            return transactionHistoryList;
        }

        // Execute table-valued function: ufn_GetFarmerTransactions
        public List<FarmerTransactionHistory> GetFarmerTransactionHistoryTVF(string farmerId, string cropName, DateTime? startDate, DateTime? endDate, string traderId)
        {
            List<FarmerTransactionHistory> transactionHistoryList = new List<FarmerTransactionHistory>();
            try
            {
                SqlParameter prmFarmerId = new SqlParameter()
                {
                    ParameterName = "@FarmerId",
                    SqlDbType = System.Data.SqlDbType.VarChar,
                    Value = farmerId,
                    Size = 10,
                    Direction = System.Data.ParameterDirection.Input
                };
                SqlParameter prmCropName = new SqlParameter()
                {
                    ParameterName = "@CropName",
                    SqlDbType = System.Data.SqlDbType.VarChar,
                    Value = cropName,
                    Size = 100,
                    Direction = System.Data.ParameterDirection.Input
                };
                SqlParameter prmStartDate = new SqlParameter()
                {
                    ParameterName = "@StartDate",
                    SqlDbType = System.Data.SqlDbType.DateTime,
                    Value = startDate,
                    Direction = System.Data.ParameterDirection.Input
                };
                SqlParameter prmEndDate = new SqlParameter()
                {
                    ParameterName = "@EndDate",
                    SqlDbType = System.Data.SqlDbType.DateTime,
                    Value = endDate,
                    Direction = System.Data.ParameterDirection.Input
                };
                SqlParameter prmTraderId = new SqlParameter()
                {
                    ParameterName = "@TraderID",
                    SqlDbType = System.Data.SqlDbType.VarChar,
                    Value = traderId,
                    Size = 100,
                    Direction = System.Data.ParameterDirection.Input
                };

                transactionHistoryList = context.FarmerTransactionHistories.FromSqlRaw("SELECT * FROM ufn_GetFarmerTransactions(@FarmerId,@CropName,@StartDate,@EndDate,@TraderID)"
                                                                                        , prmFarmerId, prmCropName, prmStartDate, prmEndDate, prmTraderId).ToList();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fetching data: " + ex.Message);
                transactionHistoryList = new List<FarmerTransactionHistory>();
            }
            return transactionHistoryList;
        }
        #endregion



        #region 127891: Track incoming and completed orders
        // All types of orders query
        public List<FarmerOrderTransactionDetails> GetFarmerOrderTransactionDetailsByFarmerID(string farmerId)
        {
            List<FarmerOrderTransactionDetails> orderTransactionList = new List<FarmerOrderTransactionDetails>();
            try
            {
                orderTransactionList = (from t in context.Transactions
                                        join c in context.CropAvailabilityDetails on t.ListingId equals c.ListingId
                                        join u in context.Users on t.TraderId equals u.UserId
                                        where t.FarmerId == farmerId
                                        select new FarmerOrderTransactionDetails
                                        {
                                            OrderId = t.TransactionId,
                                            CropName = c.CropName,
                                            QuantityAvailable = c.Quantity,
                                            PricePerUnit = c.PricePerUnit,
                                            QuantityRequested = t.QuantityRequested,
                                            OfferedPricePerUnit = t.OfferedPrice,
                                            TraderId = u.UserId,
                                            TraderName = u.FullName,
                                            OrderDate = t.RequestDate,
                                            CurrentStatus = t.Status
                                        }).ToList();
            }
            catch (Exception)
            {
                orderTransactionList = null;
            }
            return orderTransactionList;
        }

        // Order Status Tracking(History)
        // Shows status history for a specific order, including shipment status if needed
        public List<OrderTrackingDetails> GetOrderTrackingDetailsByOrderID(string orderId)
        {
            List<OrderTrackingDetails> orderTrackingList = new List<OrderTrackingDetails>();
            try
            {
                orderTrackingList =(from t in context.Transactions
                                    join s in context.ShipmentTrackings on t.TransactionId equals s.TransactionId into shipmentGroup
                                   from s in shipmentGroup.DefaultIfEmpty()
                                   where t.TransactionId == orderId
                                    select new OrderTrackingDetails
                                    {
                                        TransactionID = t.TransactionId,
                                        OrderStatus = t.Status,
                                        RequestDate = t.RequestDate,
                                        CompletedDate = t.CompletedDate,
                                        ShipmentStatus = t.Status,
                                        ShipmentStatusUpdatedAt = s.UpdatedAt
                                    }).ToList();
            } catch (Exception) {
                orderTrackingList = null;
            }
            return orderTrackingList;
        }
        #endregion



        #region 127878: As a farmer, I want to rate and review traders
        // Get all reviews for a specific farmer
        public List<FarmerReviewsDetails> GetFarmerReviewsDetailsByFarmerId(string farmerId) 
        {
            List<FarmerReviewsDetails> farmerReviewsList = new List<FarmerReviewsDetails>();
            try
            {
                farmerReviewsList = (from f in context.FarmerReviews
                                     join u in context.Users on f.TraderId equals u.UserId
                                     where f.FarmerId == farmerId
                                     select new FarmerReviewsDetails
                                     {
                                         ReviewId = f.ReviewId,
                                         TraderId = f.TraderId,
                                         TraderName = u.FullName,
                                         Rating = f.Rating,
                                         ReviewText = f.Comment,
                                         CreatedAt = f.CreatedAt
                                     }).ToList();
            }
            catch (Exception)
            {
                farmerReviewsList = null;
            }
            return farmerReviewsList;
        }

        // Add a new review
        public bool AddFarmerReview(string transactionId, string farmerId, string traderId, int rating, string comment)
        {
            bool status = false;
            try
            {
                // Check if a transaction exists for this FarmerId and TraderId
                bool transactionExists = context.Transactions
                    .Any(t => t.FarmerId == farmerId && t.TraderId == traderId);

                if (!transactionExists)
                {
                    return false; // Do not insert if no such transaction
                }

                // Generate next ReviewId (e.g., FR101, FR102, ...)
                string nextReviewId;
                var lastReview = context.FarmerReviews
                    .Where(r => r.ReviewId.StartsWith("FR"))
                    .OrderByDescending(r => r.ReviewId)
                    .FirstOrDefault();

                if (lastReview != null && int.TryParse(lastReview.ReviewId.Substring(2), out int lastNum))
                {
                    nextReviewId = "FR" + (lastNum + 1);
                }
                else
                {
                    nextReviewId = "FR101";
                }

                var review = new FarmerReview
                {
                    ReviewId = nextReviewId,
                    TransactionId = transactionId,
                    FarmerId = farmerId,
                    TraderId = traderId,
                    Rating = rating,
                    Comment = comment,
                    CreatedAt = DateTime.Now
                };

                context.FarmerReviews.Add(review);
                context.SaveChanges();
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

        // Update an existing review
        public bool UpdateFarmerReview(FarmerReview review)
        {
            bool status = false;
            try
            {
                var reviewToUpdate = context.FarmerReviews.Find(review.ReviewId);
                
                if (reviewToUpdate != null)
                {
                    reviewToUpdate.ReviewId = review.ReviewId;
                    reviewToUpdate.TransactionId = review.TransactionId;
                    reviewToUpdate.FarmerId = review.FarmerId;
                    reviewToUpdate.TraderId = review.TraderId;
                    reviewToUpdate.Rating = review.Rating;
                    reviewToUpdate.Comment = review.Comment;
                    reviewToUpdate.CreatedAt = DateTime.Now;

                    context.FarmerReviews.Update(reviewToUpdate);
                    context.SaveChanges();
                    status = true;
                }
                else
                {
                    status=false;
                }
            }
            catch (Exception)
            {
                status=false;
            }
            return status;
        }

        // Delete a review
        public bool DeleteFarmerReview(string reviewId) 
        { 
            bool status = false;
            try
            {
                var review = context.FarmerReviews.Find(reviewId);
                if (review != null)
                {
                    context.FarmerReviews.Remove(review);
                    context.SaveChanges();
                    status = true;
                }
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }
        #endregion
    }
}
