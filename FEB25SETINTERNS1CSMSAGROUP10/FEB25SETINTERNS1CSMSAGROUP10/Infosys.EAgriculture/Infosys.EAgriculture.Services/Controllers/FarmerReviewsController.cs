using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infosys.EAgriculture.DAL;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;
using Infosys.EAgriculture.Services.Models;

namespace Infosys.EAgriculture.Services.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FarmerReviewsController : Controller
    {
        EAgricultureRepository repository;

        public FarmerReviewsController(EAgricultureRepository repository) { 
            this.repository = repository;
        }

        #region 127878: As a farmer, I want to rate and review traders
        // Get all reviews for a farmer
        [HttpGet]
        public JsonResult GetFarmerReviewsDetailsByFarmerId(string farmerId)
        {
            List<FarmerReviewsDetails> reviews = new List<FarmerReviewsDetails>();
            try
            {
                reviews = repository.GetFarmerReviewsDetailsByFarmerId(farmerId);
            }
            catch (Exception)
            {
                reviews = null;
            }
            return Json(reviews);
        }

        // Add a review for a farmer
        [HttpPost]
        public JsonResult AddFarmerReview(string transactionId, string farmerId, string traderId, int rating, string comment)
        {
            bool result = false;
            try
            {
                result = repository.AddFarmerReview(transactionId,farmerId,traderId,rating,comment);
            }
            catch (Exception)
            {
                result = false;
            }
            return Json(result);
        }

        // Update a review for a farmer
        [HttpPut]
        public JsonResult UpdateFarmerReview(Models.FarmerReview review)
        {
            bool result = false;
            try
            {
                var reviewData = new Infosys.EAgriculture.DAL.Models.FarmerReview() 
                { 
                    ReviewId = review.ReviewId,
                    TransactionId = review.TransactionId,
                    FarmerId = review.FarmerId,
                    TraderId = review.TraderId,
                    Rating = review.Rating,
                    CreatedAt = review.CreatedAt,
                    Comment = review.Comment
                };
                result = repository.UpdateFarmerReview(reviewData);
            }
            catch (Exception)
            {
                result = false;
            }
            return Json(result);
        }

        // Delete a review for a farmer
        [HttpDelete]
        public JsonResult DeleteFarmerReview(string reviewId)
        {
            bool result = false;
            try
            {
                result = repository.DeleteFarmerReview(reviewId);
            }
            catch (Exception)
            {
                result = false;
            }
            return Json(result);
        }
        #endregion
    }
}
