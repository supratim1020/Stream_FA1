using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infosys.DBFirstCore.DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;

namespace Infosys.DBFirstCore.DataAccessLayer
{
    public class QuickKartRepository
    {
        private QuickKartDbContext context;

        public QuickKartRepository(QuickKartDbContext context)
        {
            this.context = context;
        }


        // ============== READ Operation ==============
        // READ: Fetch all the data
        public List<Category> GetAllCategories()
        {
            // using Query Syntax
            var categoriesList = (from category in context.Categories
                                  orderby category.CategoryId
                                  select category).ToList();


            // method syntax
            //var categoriesList=context.Categories
            //                    .OrderBy(c=>c.CategoryId)
            //                    .ToList();

            // if no sorting is done using orderby
            //var categoriesList=context.Categories.ToList();

            return categoriesList;
        }

        // READ:Filtering based on CategoryId
        public List<Product> GetProductsOnCategoryId(byte categoryId)
        {
            List<Product> listProducts = new List<Product>();
            try
            {
                listProducts = context.Products.Where(p => p.CategoryId == categoryId).ToList();
            }
            catch (Exception ex)
            {
                listProducts = null;
            }
            return listProducts;
        }


        // READ: First Product and Last Product
        public Product FilterProducts(byte categoryId)
        {
            Product product = new Product();
            try
            {
                //product=context.Products.Where(p=> p.CategoryId == categoryId).FirstOrDefault();

                product = context.Products.Where(p => p.CategoryId == categoryId)
                                        .OrderByDescending(p => p.Price)
                                        .LastOrDefault();

                // Two More methods are Single() and SingleOrDefault()
            }
            catch (Exception ex)
            {
                product = null;
            }
            return product;
        }

        // READ: Filter Products using LIKE()
        public List<Product> FilterProductsUsingLike(string pattern)
        {
            List<Product> listProducts = new List<Product>();
            try
            {
                listProducts = context.Products.Where(p => EF.Functions.Like(p.ProductName, pattern)).ToList();
            }
            catch (Exception ex)
            {
                listProducts = null;
            }
            return listProducts;
        }



        // ============== CREATE Operation ==============
        // Inserting a new row in the database table using Add()
        // Inserting a range of rows in the database table using AddRange()

        // CREATE: Adds new Category to the database
        public bool AddCategory(string categoryName)
        {
            bool status = false;
            Category category = new Category();
            category.CategoryName = categoryName;
            // CategoryId is the Identity column in the database
            try
            {
                context.Categories.Add(category);
                //context.Add<Category>(category);

                context.SaveChanges();
                status = true;
            }
            catch (Exception)
            {

                throw;
            }
            return status;

        }

        // CREATE: Adds multiple new Categories to the database
        public bool AddProductsUsingAddRange(params Product[] products)
        {
            bool status = false;
            try
            {
                context.Products.AddRange(products);
                /*
                 AddRange() method has two overloaded methods, 
                    The first one receives a params object array as a parameter.
                    The second overload receives the IEnumerable<TEntity> as the parameter
                 */
                context.SaveChanges();
                status = true;

            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        // ============== UPDATE Operation ==============
        // Update an entity object using Update()
        // Update range of entity objects using UpdateRange()
        // Commit the changes to the datatbase using SaveChanges()
        /*
         This disconnected scenario uses two different context objects:
            Context - used to search for the product using Find() method in its DbSet
            
            RawContext - used to update the changes using Update() method in its own DbSet
         */

        public bool UpdateCategory(byte categoryId, string newCategoryName)
        {
            bool status = false;

            Category category = context.Categories.Find(categoryId);
            // it accepts params, So incase of composite Primary Key provide with comma seperated value
            // The reference to the Object is returned if the Entity object with the Primary Key is exists, otherwise null value is returned

            // Another way to finding a object using LINQ query
            // Category category = context.Categories
            //                            .Where(x => x.CategoryId == categoryId)
            //                            .FirstOrDefault();

            try
            {
                if (category != null)
                {
                    category.CategoryName = newCategoryName;
                    context.SaveChanges();
                    status = true;
                }
                else
                {
                    status = false;
                }
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        public int UpdateProduct(string productId, decimal price)
        {
            int status = -1;
            try
            {
                Product product = context.Products.Find(productId);
                product.Price = price;
                using (var newContext = new QuickKartDbContext())
                {
                    newContext.Products.Update(product);
                    newContext.SaveChanges();
                    status = 1;
                }
            }
            catch (Exception ex)
            {
                status = -99;
            }
            return status;
        }

        // UPDATE: Updating a range of objects
        public int UpdateProductsUsingUpdateRange(byte categoryId, int quantityProcured)
        {
            int status = -1;
            try
            {
                List<Product> productList = context.Products.Where(p => p.CategoryId == categoryId).ToList();
                foreach (Product product in productList)
                {
                    product.QuantityAvailable += quantityProcured;
                }
                using (var newContext = new QuickKartDbContext())
                {
                    newContext.UpdateRange(productList);
                    newContext.SaveChanges();
                    status = 1;
                }
            }
            catch (Exception)
            {
                status = -99;
            }
            return status;
        }


        // ============== DELETE Operation ==============
        // Search for objects to be deleted in the DbSet Collection
        // Remove objects from the DbSet collection using Remove() and RemoveRnage()
        // Delete a row in the database using SaveChanges()

        public bool DeleteProduct(string productId)
        {
            bool status = false;
            Product product = new Product();
            try
            {
                product = context.Products.Find(productId);
                //product=context.Products.Where(product=>product.ProductId == productId).FirstOrDefault();

                if (product != null)
                {
                    context.Products.Remove(product);
                    context.SaveChanges();
                    status = true;
                }
                else
                {
                    status = false;
                }
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

        // Delete multiple objects using RemoveRange()
        public bool DeleteProductsUsingRemoveRange(string subString)
        {
            bool status = false;
            try
            {
                var deleteProducts = context.Products.Where(p => p.ProductName.Contains(subString));
                context.Products.RemoveRange(deleteProducts);
                context.SaveChanges();
                status = true;
            }
            catch (Exception)
            {

                throw;
            }
            return status;
        }

        // ============== Stored procedure and raw SQL query execution ==============
        public int AddCategoryDetailsUsingUSP(string categoryName, out byte categoryId)
        {
            categoryId = 0;
            int returnResult = 0;
            int noOfRowsAffected = 0;
            /* 
                For every scalar variable there are 4 pieces of information to be considered:
                    - Name of the variable
                    - DataType
                    - Size
                    - Input value (if any)
            */
            //SqlParameter prmCategoryName = new SqlParameter();
            //prmCategoryName.ParameterName = "@CategoryName";
            //prmCategoryName.SqlDbType=System.Data.SqlDbType.VarChar;
            //prmCategoryName.Size = 50;
            //prmCategoryName.Direction=System.Data.ParameterDirection.Input;
            //prmCategoryName.Value = categoryName;
            SqlParameter prmCategoryName = new SqlParameter("@CategoryName", categoryName);

            SqlParameter prmCategoryId = new SqlParameter("CategoryId", System.Data.SqlDbType.TinyInt);
            prmCategoryId.Direction = System.Data.ParameterDirection.Output;

            SqlParameter prmReturnResult = new SqlParameter("@ReturnResult", System.Data.SqlDbType.Int);
            prmReturnResult.Direction = System.Data.ParameterDirection.Output;

            try
            {
                noOfRowsAffected = context.Database.ExecuteSqlRaw("EXEC @ReturnResult = usp_AddCategory @CategoryName, @CategoryId OUT",
                                                prmReturnResult, prmCategoryName, prmCategoryId);

                returnResult = Convert.ToInt32(prmReturnResult.Value);

                categoryId = Convert.ToByte(prmCategoryId.Value);
            }
            catch (Exception)
            {
                categoryId = 0;
                returnResult = -99;
            }
            return returnResult;
        }


        // ============== Execute a table-valued function using FromSql ==============
        // Create entity class and DbSet properties in the context class
        // Execute table-valued function using FromSqlRaw() on the DbSet
        // Execute table-valued function using FromSqlInterpolated() on the DbSet
        public List<ProductCategoryName> GetProductsUsingTVF(byte categoryId)
        {
            List<ProductCategoryName> listProduct = null;
            try
            {
                SqlParameter prmCategoryId = new SqlParameter("@CategoryId", categoryId);
                listProduct = context.ProductCategoryNames.FromSqlRaw("SELECT * FROM ufn_GetAllProductDetails(@CategoryId)",
                                                                    prmCategoryId).ToList();

            }
            catch (Exception)
            {
                listProduct = null;
            }

            return listProduct;
        }


        // ============== Execute a scalar function using EF Core ==============
        // Declare a static CLR(Common Language Runtime) method
        // Map the static method to a database scalar function
        // Execute the function using LINQ queries

        public string GetNewProductId()
        {
            string productId=string.Empty;
            try
            {
                productId=(from s in context.Products
                           select QuickKartDbContext.ufn_GenerateNewProductId())
                           .FirstOrDefault();
            }
            catch (Exception)
            {
                productId=null;
            }
            return productId;
        }
    }
}
