using DTS_API.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Interface
{
    public interface IColorCodeService : IDTSService<ColorCodeDto>
    {
        Task<bool> CheckExists(int id);
    }
}
