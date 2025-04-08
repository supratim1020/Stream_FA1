using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuickKartBL;

namespace QuickKartTestApp
{
    class Program
    {
        public static void CheckPriceDetails(Func<Product, bool> delObj)
        {
            Product productObj = new Product
            {
                ProductName = "Soccer Ball",
                Price = 500.00,
                QuantityAvailable = 100,
                CategoryId = 1
            };

            bool result = delObj(productObj);

            Console.WriteLine("Result is:" + result);
            Console.WriteLine();
        }
        static void Main(string[] args)
        {
            List<Category> categoryList = new List<Category>()
            {
                new Category { CategoryName = "Sports" },
                new Category { CategoryName = "Furniture" },
                new Category { CategoryName = "Apparels" }
            };

            List<Product> productList = new List<Product>()
            {
                new Product { ProductName="Tennis Racket", Price=1099.99, QuantityAvailable=50, CategoryId=1 },
                new Product { ProductName="Tennis Ball", Price=300.00, QuantityAvailable=100, CategoryId=1 },
                new Product { ProductName="Dining Table", Price=15000, QuantityAvailable=10, CategoryId=2 },
                new Product { ProductName="Laptop Table", Price=7000.00, QuantityAvailable=15, CategoryId=2 },
                new Product { ProductName="Corduroy Shirt", Price=2000, QuantityAvailable=100, CategoryId=3 },
                new Product { ProductName="Tweed Shirt", Price=2500, QuantityAvailable=100, CategoryId=3 }
            };

            Product productObj = new Product
            {
                ProductName = "Soccer Ball",
                Price = 500.00,
                QuantityAvailable = 100,
                CategoryId = 1
            };

            Func<Product, bool> checkPrice = product => product.Price > 1000;

            CheckPriceDetails(checkPrice);

            #region Query One

            // 1. Display the details of those products which are priced above Rs.1000.

            var productPriceList = productList.Where(p => p.Price > 1000);

            Console.WriteLine("----------------------------------------------------------------------");
            Console.WriteLine("Product details priced above 1000");
            Console.WriteLine("----------------------------------------------------------------------");
            Console.WriteLine("{0, -12}{1, -18}{2, -10}{3, -20}{4}", "ProductID", "ProductName",
                    "Price", "QuantityAvailable", "CategoryID");
            Console.WriteLine("----------------------------------------------------------------------");

            foreach (var item in productPriceList)
            {
                Console.WriteLine("{0, -12}{1, -18}{2, -10}{3, -20}{4}",
                    item.ProductId, item.ProductName, item.Price,
                    item.QuantityAvailable, item.CategoryId);
            }

            #endregion

            #region Query Two

            // 2. Display only the price of those products which are priced above Rs.1000

            var priceList = productList.Where(p => p.Price > 1000).Select(x => x.Price);

            Console.WriteLine("\n----------------------");
            Console.WriteLine("Price list above 1000");
            Console.WriteLine("----------------------");
            Console.WriteLine("Price");
            Console.WriteLine("-------");

            foreach (var item in priceList)
            {
                Console.WriteLine(item);
            }

            #endregion

            #region Query Three

            // 3. Display only the product names and the prices of those products 
            // which are priced above Rs.1000.
            var productPriceListTwo=productList.Where(p=>p.Price>1000)
                                                .Select(x => new { x.ProductName, x.Price});
            Console.WriteLine("\n---------------------------------------");
            Console.WriteLine("Product names and Price list above 1000");
            Console.WriteLine("---------------------------------------");
            Console.WriteLine("{0, -18}{1}", "ProductName", "Price");
            Console.WriteLine("-------------------------");
            foreach (var item in productPriceListTwo)
            {
                Console.WriteLine("{0, -18}{1}", item.ProductName, item.Price);
            }
            #endregion

            #region Query Four

            // 4. Display all the product names and their price values in the increasing order of price
            var sortedPriceList = productList.Select(p => new { p.ProductName, p.Price })
                                                .OrderBy(y => y.ProductName);
            // for decending there is another method called OrderByDecending
            /*
             In case you want to order by more than one field ,You need to use ThenBy clause in method syntax:
                IEnumerable<>.OrderByDescending<>(Func<> keySelector).ThenBy<>(Func<> keySelector)
             */
            #endregion

            #region Query Five

            // 5. Display the category id and number of products available in each category
            var groupList = productList.GroupBy(p => p.CategoryId)
                                            .Select(g => new { g.Key, Total=g.Count() });
            Console.WriteLine("\n--------------------------------");
            Console.WriteLine("Number of products in a category");
            Console.WriteLine("--------------------------------");
            Console.WriteLine("{0, -13}{1}", "CategoryID", "NumberOfProducts");
            Console.WriteLine("-----------------------------");
            foreach (var item in groupList)
            {
                Console.WriteLine("{0, -13}{1}", item.Key, item.Total);
            }

            #endregion

            #region Query Six

            // 6. Display the product name, category name and price of all the products
            var joinedList = productList.Join(categoryList, p => p.CategoryId, c => c.CategoryId, (x, y) => new {x,y})
                                        .Select(r => new {r.x.ProductName,r.y.CategoryName,r.x.Price});
            Console.WriteLine("\n----------------------------");
            Console.WriteLine("Product and Category details");
            Console.WriteLine("------------------------------------------");
            Console.WriteLine("{0, -20}{1, -15}{2}", "ProductID", "CategoryID", "Price");
            Console.WriteLine("------------------------------------------");
            foreach (var item in joinedList)
            {
                Console.WriteLine("{0, -20}{1, -15}{2}", item.ProductName, item.CategoryName, item.Price);
            }
            Console.WriteLine();


            #endregion
        }
    }
}
