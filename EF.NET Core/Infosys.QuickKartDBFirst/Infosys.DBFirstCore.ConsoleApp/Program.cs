using System;
using Infosys.DBFirstCore.DataAccessLayer;
using Infosys.DBFirstCore.DataAccessLayer.Models;

namespace Infosys.DBFirstCore.ConsoleApp
{
    public class Program
    {
        static QuickKartDbContext context;
        static QuickKartRepository repository;

        static Program() 
        { 
            context = new QuickKartDbContext();
            repository =new QuickKartRepository(context);
        }
        static void Main(string[] args)
        {
            // ============== READ Operation ==============
            //GetAllCategories();
            //GetProductsOnCategoryId();
            //FilterProducts();
            //FilterProductsUsingLike();

            // ============== CREATE Operation ==============
            //AddCategory();
            //AddProductsUsingAddRange();

            // ============== UPDATE Operation ==============
            //UpdateCategory();
            //UpdateProduct();
            //UpdateProductsUsingUpdateRange();

            // ============== DELETE Operation ==============
            //DeleteProduct();
            //DeleteProductsUsingRemoveRange();

            // ============== Stored procedure and raw SQL query execution ==============
            //AddCategoryDetailsUsingUSP();

            // ============== Execute a table-valued function using FromSql ==============
            GetProductsUsingTVF();

            // ============== Execute a scalar function using EF Core ==============
            //GetNewProductId();
        }

        // ============== READ Operation ==============
        public static void GetAllCategories()
        {
            var categories = repository.GetAllCategories();
            Console.WriteLine("----------------------------------");
            Console.WriteLine("CategoryId\tCategoryName");
            Console.WriteLine("----------------------------------");
            foreach (var category in categories)
            {
                Console.WriteLine("{0}\t\t{1}", category.CategoryId, category.CategoryName);
            }
        }
        public static void GetProductsOnCategoryId()
        {
            byte categoryId = 1;
            List<Product> lstproducts = repository.GetProductsOnCategoryId(categoryId);
            if (lstproducts.Count == 0)
            {
                Console.WriteLine("No products available under the category = " + categoryId);
            }
            else
            {
                Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", "ProductId", "ProductName", "CategoryId", "Price", "QuantityAvailable");
                Console.WriteLine("---------------------------------------------------------------------------------------");
                foreach (var product in lstproducts)
                {
                    Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", product.ProductId, product.ProductName, product.CategoryId, product.Price, product.QuantityAvailable);
                }
            }
        }

        public static void FilterProducts()
        {
            byte categoryId = 1;
            Product product = repository.FilterProducts(categoryId);
            if (product == null)
            {
                Console.WriteLine("No product details available");
            }
            else
            {
                Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", "ProductId", "ProductName", "CategoryId", "Price", "QuantityAvailable");
                Console.WriteLine("---------------------------------------------------------------------------------------");
                Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", product.ProductId, product.ProductName, product.CategoryId, product.Price, product.QuantityAvailable);
            }
            Console.WriteLine();
        }

        public static void FilterProductsUsingLike()
        {
            string pattern = "BMW%";
            List<Product> lstProducts = repository.FilterProductsUsingLike(pattern);
            if (lstProducts.Count == 0)
            {
                Console.WriteLine("No products available with the = " + pattern);
            }
            else
            {
                Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", "ProductId", "ProductName", "CategoryId", "Price", "QuantityAvailable");
                Console.WriteLine("---------------------------------------------------------------------------------------");
                foreach (var product in lstProducts)
                {
                    Console.WriteLine("{0,-15}{1,-30}{2,-15}{3,-10}{4}", product.ProductId, product.ProductName, product.CategoryId, product.Price, product.QuantityAvailable);
                }
            }
            Console.WriteLine();
        }


        // ============== CREATE Operation ==============
        public static void AddCategory()
        {
            bool result = repository.AddCategory("Books");
            if (result)
            {
                Console.WriteLine("New category added successfully");
            }
            else
            {
                Console.WriteLine("Something went wrong. Try again!");
            }
        }

        public static void AddProductsUsingAddRange()
        {
            Product productOne = new Product();
            productOne.ProductId = "P158";
            productOne.ProductName = "The Ship of Secrets - Geronimo Stilton";
            productOne.CategoryId = 8;
            productOne.Price = 450;
            productOne.QuantityAvailable = 10;

            Product productTwo = new Product();
            productTwo.ProductId = "P159";
            productTwo.ProductName = "101 Nursery Rhymes";
            productTwo.CategoryId = 8;
            productTwo.Price = 700;
            productTwo.QuantityAvailable = 10;

            bool result = repository.AddProductsUsingAddRange(productOne, productTwo);
            if (result)
            {
                Console.WriteLine("Product details added successfully!");
            }
            else
            {
                Console.WriteLine("Some error occurred. Try again!!");
            }
        }


        // ============== UPDATE Operation ==============
        public static void UpdateCategory()
        {
            bool result = repository.UpdateCategory(8, "Stationery");
            if (result)
            {
                Console.WriteLine("Category details updated successfully");
            }
            else
            {
                Console.WriteLine("Something went wrong. Try again!");
            }
        }

        public static void UpdateProduct()
        {
            int status = repository.UpdateProduct("P159", 1000);
            if (status == 1)
            {
                Console.WriteLine("Product price updated successfully!");
            }
            else
            {
                Console.WriteLine("Some error occurred. Try again!!");
            }
        }

        public static void UpdateProductsUsingUpdateRange()
        {
            int status = repository.UpdateProductsUsingUpdateRange(8, 10);
            if (status == 1)
            {
                Console.WriteLine("Products updated successfully!");
            }
            else
            {
                Console.WriteLine("Some error occurred. Try again!!");
            }
        }


        // ============== DELETE Operation ==============
        public static void DeleteProduct()
        {
            bool status = repository.DeleteProduct("P159");
            if (status)
            {
                Console.WriteLine("Product details deleted successfully!");
            }
            else
            {
                Console.WriteLine("Some error occurred. Try again!!");
            }
        }

        public static void DeleteProductsUsingRemoveRange()
        {
            bool status = repository.DeleteProductsUsingRemoveRange("BMW");
            if (status)
            {
                Console.WriteLine("Products deleted successfully");
            }
            else
            {
                Console.WriteLine("Some error occurred.Try again!!");
            }
        }

        // ============== Stored procedure and raw SQL query execution ==============
        public static void AddCategoryDetailsUsingUSP()
        {
            byte categoryId = 0;
            int returnResult = repository.AddCategoryDetailsUsingUSP("Cosmeticsasd", out categoryId);
            if (returnResult > 0)
            {
                Console.WriteLine("Category details added successfully with CategoryId = " + categoryId);
            }
            else
            {
                Console.WriteLine("Some error occurred. Try again!");
            }
        }


        // ============== Execute a table-valued function using FromSql ==============
        public static void GetProductsUsingTVF()
        {
            byte categoryId = 1;
            var products = repository.GetProductsUsingTVF(categoryId);
            Console.WriteLine("{0, -12}{1, -30}{2}", "ProductId", "ProductName", "CategoryName");
            Console.WriteLine("------------------------------------------------------");
            if (products.Count == 0)
            {
                Console.WriteLine("No products available under the given category!");
            }
            else
            {
                foreach (var product in products)
                {
                    Console.WriteLine("{0, -12}{1, -30}{2}", product.ProductId, product.ProductName, product.CategoryName);
                }
            }
        }

        // ============== Execute a scalar function using EF Core ==============
        public static void GetNewProductId()
        {
            string productId = repository.GetNewProductId();
            Console.WriteLine("New ProductId = " + productId);
            Console.WriteLine();
        }


    }
}
