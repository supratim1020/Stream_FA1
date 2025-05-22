using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
namespace Infosys.EAgriculture.DAL.Models;

public partial class User
{
    public string UserId { get; set; }

    public string FullName { get; set; }

    public string Email { get; set; }

    public string Password { get; set; }

    public string PhoneNumber { get; set; }

    public string Address { get; set; }

    public DateOnly? Dob { get; set; }

    public string Role { get; set; }

    public bool? IsActive { get; set; }
    
    public DateTime? CreatedAt { get; set; }
    
    public DateTime? UpdatedAt { get; set; }
    [JsonIgnore]
    public virtual ICollection<Announcement> Announcements { get; set; } = new List<Announcement>();
    [JsonIgnore]
    public virtual ICollection<CropAvailabilityDetail> CropAvailabilityDetails { get; set; } = new List<CropAvailabilityDetail>();
    [JsonIgnore]
    public virtual ICollection<DiscussionForum> DiscussionForums { get; set; } = new List<DiscussionForum>();
    [JsonIgnore]
    public virtual FarmerProfile FarmerProfile { get; set; }
    [JsonIgnore]
    public virtual ICollection<FarmerReview> FarmerReviewFarmers { get; set; } = new List<FarmerReview>();
    [JsonIgnore]
    public virtual ICollection<FarmerReview> FarmerReviewTraders { get; set; } = new List<FarmerReview>();
    [JsonIgnore]
    public virtual ICollection<GuideReview> GuideReviews { get; set; } = new List<GuideReview>();
    [JsonIgnore]
    public virtual ICollection<HarvestingReminder> HarvestingReminders { get; set; } = new List<HarvestingReminder>();
    [JsonIgnore]
    public virtual ICollection<Policy> Policies { get; set; } = new List<Policy>();
    [JsonIgnore]
    public virtual ICollection<SchemeAlert> SchemeAlerts { get; set; } = new List<SchemeAlert>();
    [JsonIgnore]
    public virtual ICollection<TraderCropPreference> TraderCropPreferences { get; set; } = new List<TraderCropPreference>();
    [JsonIgnore]
    public virtual ICollection<TraderFavorite> TraderFavoriteFarmers { get; set; } = new List<TraderFavorite>();
    [JsonIgnore]
    public virtual ICollection<TraderFavorite> TraderFavoriteTraders { get; set; } = new List<TraderFavorite>();
    [JsonIgnore]
    public virtual TraderProfile TraderProfile { get; set; }
    [JsonIgnore]
    public virtual ICollection<TraderReview> TraderReviewFarmers { get; set; } = new List<TraderReview>();
    [JsonIgnore]
    public virtual ICollection<TraderReview> TraderReviewTraders { get; set; } = new List<TraderReview>();
    [JsonIgnore]
    public virtual ICollection<Transaction> TransactionFarmers { get; set; } = new List<Transaction>();
    [JsonIgnore]
    public virtual ICollection<Transaction> TransactionTraders { get; set; } = new List<Transaction>();
    [JsonIgnore]
    public virtual ICollection<WeatherAlert> WeatherAlerts { get; set; } = new List<WeatherAlert>();
}
