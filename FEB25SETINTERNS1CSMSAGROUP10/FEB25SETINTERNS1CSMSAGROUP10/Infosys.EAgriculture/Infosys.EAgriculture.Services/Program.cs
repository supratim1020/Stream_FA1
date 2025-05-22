using Microsoft.EntityFrameworkCore;
using Infosys.EAgriculture.DAL;
using Infosys.EAgriculture.DAL.Models;


namespace Infosys.EAgriculture.Services
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            builder.Services.AddTransient<EagriPortalDbContext>();
            builder.Services.AddTransient<EAgricultureRepository>(
                c => new EAgricultureRepository(c.GetRequiredService<EagriPortalDbContext>()));


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
