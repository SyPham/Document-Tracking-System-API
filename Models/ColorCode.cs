using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTS_API.Models
{
    public class ColorCode
    {
        public int ID { get; set; }
        public string Code { get; set; }

        public string Name { get; set; }

        public string CssCode { get; set; }
    }
}