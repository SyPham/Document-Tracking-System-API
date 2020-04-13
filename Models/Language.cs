using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class Language
    {
        [Key]
        public string LanguageID { get; set; }

        public string Name { get; set; }

        public bool Status { get; set; }
    }
}