using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface IStatusRepository : IDTSRepository<Status>
    {
        Task AddStatusLang(List<StatusLang> teamLang);
        void UpdateStatusLang(List<StatusLang> teamLang);
        Task<bool> CheckExists(int id);
        IQueryable<StatusLang> GetAllStatusLang();
    }
}