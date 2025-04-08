﻿using System.ComponentModel.DataAnnotations;

namespace QuickKartServices.Models
{
    public class Product
    {
        public string ProductId { get; set; }

        [Required]
        [MinLength(4)]
        [MaxLength(100)]
        public string ProductName { get; set; }

        [Required]
        public byte? CategoryId { get; set; }

        [Required]
        [Range(minimum:1, maximum:Double.MaxValue)]
        public decimal Price { get; set; }

        [Required]
        [Range(minimum:1,maximum:int.MaxValue)]
        public int QuantityAvailable { get; set; }
    }
}
