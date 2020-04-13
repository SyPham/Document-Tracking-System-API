using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class SubCategory
    {
        public SubCategory()
        {
            this.CreateTime = DateTime.Today;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SubCategoryID { get; set; }

        [StringLength(255)]
        
        [Required]
        public string Name { get; set; }

        public DateTime CreateTime { get; set; }

        public int CategoryID { get; set; }

        public virtual List<SubCategoryLang> SubCategoryLangs { get; set; }

    }
}