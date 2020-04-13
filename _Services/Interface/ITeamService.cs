using DTS_API.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Interface
{
    public interface ITeamService : ILangService<TeamDto, TeamCreateDto>
    {
        Task<bool> Update(List<EditLangDto> model);

    }
}
