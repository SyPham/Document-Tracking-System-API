using DTS_API.DTO;
using DTS_API.Helpers;
using DTS_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Interface
{
   public interface ILocationService: ILangService<LocationDto, LocationCreateDto>
    {
        Task<bool> Update(List<EditLangDto> model);
    }
}
