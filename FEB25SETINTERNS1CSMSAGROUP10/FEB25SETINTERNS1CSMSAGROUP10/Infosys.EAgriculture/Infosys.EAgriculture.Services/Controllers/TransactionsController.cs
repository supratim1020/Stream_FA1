using Infosys.EAgriculture.DAL;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Infosys.EAgriculture.Services.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TransactionsController : Controller
    {
        EAgricultureRepository repository;

        public TransactionsController(EAgricultureRepository repository) { 
            this.repository = repository;
        }

        #region 127888: Track past transactions
        [HttpGet]
        public JsonResult GetFarmerTransactionHistory(string farmerId)
        {
            List<FarmerTransactionHistory> th = new List<FarmerTransactionHistory>();
            try
            {
                th = repository.GetFarmerTransactionHistoryByFarmerID(farmerId);
            }
            catch (Exception)
            {
                th = null;
            }
            return Json(th);
        }
        #endregion


        #region 127891: Track incoming and completed orders
        // All Orders 
        [HttpGet]
        public JsonResult GetFarmerOrderTransactionDetailsByFarmerID(string farmerId)
        {
            List<FarmerOrderTransactionDetails> th = new List<FarmerOrderTransactionDetails>();
            try
            {
                th = repository.GetFarmerOrderTransactionDetailsByFarmerID(farmerId);
            }
            catch (Exception)
            {
                th = null;
            }
            return Json(th);
        }

        // Order Status Tracking(History)
        // Shows status history for a specific order, including shipment status if needed
        [HttpGet]
        public JsonResult GetOrderTrackingDetailsByOrderID(string orderId) 
        {
            List<OrderTrackingDetails> th = new List<OrderTrackingDetails>();
            try
            {
                th = repository.GetOrderTrackingDetailsByOrderID(orderId);
            }
            catch (Exception)
            {
                th = null;
            }
            return Json(th);
        }
        #endregion
    }
}
