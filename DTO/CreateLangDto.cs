using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API.DTO
{
    public class CreateLangDto
    {
        public int ID { get; set; }
        public List<LangDto> Langs { get; set; }
    }
}
