using System;

namespace DTS_API.DTO
{
    public class UserForDetailDto
    {
        public string UserID { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string CreateTime { get; set; }
        public int DepartmentID { get; set; }
        public int LocationID { get; set; }
        public int RoleID { get; set; }
    }
}