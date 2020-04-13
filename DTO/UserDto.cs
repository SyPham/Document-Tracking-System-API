using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API.DTO
{
    public class UserDto
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string CreateBy { get; set; }
        public int Position { get; set; }
        public string IDcardNumber { get; set; }
        public int Department { get; set; }
        public int Team { get; set; }
        public bool Status { get; set; }
        public int LocationID { get; set; }
        public int Role { get; set; }
    }
}
