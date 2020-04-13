using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface ITeamRepository : IDTSRepository<Team>
    {
        Task AddTeamLang(List<TeamLang> teamLang);
        void UpdateTeamLang(List<TeamLang> teamLang);
        Task<bool> CheckExists(int id);
        IQueryable<TeamLang> GetAllTeamLang();
    }
}