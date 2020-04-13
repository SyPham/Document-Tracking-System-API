using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DTS_API.Models
{
    [Table("UserAccounts")]
    public class User
    {
        public User()
        {
            this.CreateTime = DateTime.Now;
        }

        ///---

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserID { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        [StringLength(255)]
        
        [Required]
        public string Username { get; set; }

        [StringLength(3000)]
        
        //[Required(ErrorMessage = "Please enter your Password.")]
        public string Password { get; set; }

        [StringLength(255)]
        
        public string Address { get; set; }

        [StringLength(255)]
        
        public string Email { get; set; }

        [StringLength(20)]
        
        public string Mobi { get; set; }

        [StringLength(255)]
        
        public string Avatar { get; set; }

        [StringLength(255)]
        
        public string Description { get; set; }

        public DateTime CreateTime { get; set; }

        [StringLength(255)]
        
        public string CreateBy { get; set; }

        public int Position { get; set; }

        public bool Status { get; set; }

        public string IDcardNumber { get; set; }

        public int RoleID { get; set; }
        public virtual Role Role { get; set; }
        public int DepartmentID { get; set; }
        public int TeamID { get; set; }
        public int LocationID { get; set; }
        public string LanguageID { get; set; }
        public int PemisionID { get; set; }

    }
}