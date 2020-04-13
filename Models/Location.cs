using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class Location
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("LocationID")]
        public int Number { get; set; }
        [Column("Name")]
        public string Content { get; set; }

        public string Remark { get; set; }

        public int DepartmentID { get; set; }

        public int TeamID { get; set; }

        public virtual List<LocationLang> LocationLangs { get; set; }

    }
}