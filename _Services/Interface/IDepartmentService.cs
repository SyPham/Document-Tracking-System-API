using DTS_API.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Interface
{
    public interface IDepartmentService : ILangService<DepartmentDto, DepartmentCreateDto>
    {
        Task<bool> Update(List<EditLangDto> model);

    }
}
