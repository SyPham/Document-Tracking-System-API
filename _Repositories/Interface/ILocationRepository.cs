using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface ILocationRepository : IDTSRepository<Location>
    {
        Task AddLocationLang(List<LocationLang> categoryLang);
        void UpdateLocationLang(List<LocationLang> categoryLang);
        Task<bool> CheckExists(int id);
        IQueryable<LocationLang> GetAllLocationLang();
        //viet them ham o day neu chua co trong ECRepository
    }
}