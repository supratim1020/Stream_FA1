using System.Collections;
using Infosys.EAgriculture.DAL;
using Infosys.EAgriculture.DAL.Models;
using Infosys.EAgriculture.DAL.CustomDataTransferObjectClass;

namespace Infosys.EAgriculture
{
    public class Program
    {
        private static EagriPortalDbContext context;
        private static EAgricultureRepository repository;
        static Program()
        {
            context = new EagriPortalDbContext();
            repository=new EAgricultureRepository(context);
        }
        static void Main(string[] args)
        {
            // Test Function
            //GetAllUsers();
            //GetUserDetailsByID("U112");


            //GetFarmerTransactionHistoryLINQ(farmerId: "U101", cropName: null, startDate: null, endDate: null, traderId: null);

            Console.WriteLine(repository.AddFarmerReview(transactionId: "TN120", farmerId: "U105", traderId: "U119", rating:4, comment: "Approved sugarcane order, good communication"));
            //Console.WriteLine(repository.DeleteFarmerReview("FR120"));

        }
        public static void GetAllUsers()
        {
            var usersList = repository.GetAllUsers();
            if (usersList != null)
            {
                Console.WriteLine("{0,-10}{1,-20}{2,-10}","UserID","FullName","Role");
                Console.WriteLine(new String('-',40));
                foreach (var user in usersList) {
                    Console.WriteLine("{0,-10}{1,-20}{2,-10}",user.UserId, user.FullName, user.Role);  
                }
            }
            else
            {
                Console.WriteLine("No Users!");
            }
        }

        public static void GetUserDetailsByID(string userId)
        {
            User userDetails = repository.GetUserDetailsByID(userId);
            if (userDetails != null) 
            {
                Console.WriteLine("UserId: {0}",userDetails.FullName);
                Console.WriteLine("EmailID: {0}",userDetails.Email);
            }
            else
            {
                Console.WriteLine("Invalid User!");
            }
        }


        public static void GetFarmerTransactionHistoryLINQ(string farmerId, string cropName, DateTime? startDate, DateTime? endDate, string traderId)
        {
            var transactionHistoryList = repository.GetFarmerTransactionHistoryByFilter(farmerId,cropName,startDate,endDate,traderId);
            if(transactionHistoryList == null || transactionHistoryList.Count==0)
            {
                Console.WriteLine("No Transaction History!");
            }
            else
            {
                Console.WriteLine("{0,-15}{1,-10}{2,-8}", "TransactionID", "CropName", "UserID");
                Console.WriteLine(new string('-',35));
                foreach (var th in transactionHistoryList) {
                    Console.WriteLine("{0,-15}{1,-10}{2,-8}",th.TransactionID,th.CropName,th.UserID);
                }
            }
        }




    }
}
