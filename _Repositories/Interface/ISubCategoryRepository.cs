using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface ISubCategoryRepository : IDTSRepository<SubCategory>
    {
        Task AddSubCategoryLang(List<SubCategoryLang> categoryLang);
        void UpdateSubCategoryLang(List<SubCategoryLang> categoryLang);
        Task<bool> CheckExists(int id);
        IQueryable<SubCategoryLang> GetAllSubCategoryLang();
        //viet them ham o day neu chua co trong ECRepository
    }
}