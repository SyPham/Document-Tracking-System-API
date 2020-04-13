using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class Department
    {
        public Department()
        {
            this.CreateTime = DateTime.Now;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DepartmentID { get; set; }

        [StringLength(255)]
        
        [Required]
        public string Name { get; set; }

        public DateTime CreateTime { get; set; }

        public virtual List<DepartmentLang> DepartmentLangs { get; set; }

    }
}