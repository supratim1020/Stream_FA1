using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infosys.EAgriculture.DAL;
using Infosys.EAgriculture.DAL.Models;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;

namespace Infosys.EAgriculture.Services.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserController : Controller
    {
        EAgricultureRepository repository;

        public UserController(EAgricultureRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public JsonResult GetAllUsers()
        {
            List<User> users = new List<User>();
            try
            {
                users= repository.GetAllUsers();
            }
            catch (Exception) {
                users = null;
            }
            return Json(users);
        }

        [HttpGet]
        public JsonResult GetUserDetailsByID(string userId)
        {
            User user;
            try
            {
                user = repository.GetUserDetailsByID(userId);
            }
            catch (Exception) 
            { 
                user= null;
            }
            return Json(user);
        }

        



    }
}
