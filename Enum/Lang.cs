using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API.Enum
{
    public enum Lang
    {
        [Description("Here is vietnamese")]
        vi,
        [Description("Here is English")]
        en,
        [Description("Here is Chinese")]
        tw
    }
}
