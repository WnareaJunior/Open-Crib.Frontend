using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;

namespace CribAPI.Models
{

public class User{



    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { get; set; }
    public string username { get; set; } = null!;
     public string password { get; set; } = null!;
     public int age { get; set; } = null!;
     public int host_rating { get; set; } = null!;
     public int guest_rating { get; set; } = null!;
     public string address { get; set; } = null!;
     public double longitude {get; set; } = null!;
     public double latitude {get; set; } = null;
     public int parties_attended {get; set; } = null;
     public int parties_hosted {get; set; } = null;
     public int phone_number {get; set;} = null!;

     public Address Address {get; set;}

    public List<string> followers { get; set; } = null!;
     public List<string> following { get; set; } = null!;
     public List<post> posts { get; set; }

    
}
}
