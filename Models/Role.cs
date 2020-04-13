using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class Role
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RoleID { get; set; }

        [StringLength(255)]
        
        [Required]
        public string Name { get; set; }
        public string Code { get; set; }
        public virtual List<Menu> Menus { get; set; }

    }
}