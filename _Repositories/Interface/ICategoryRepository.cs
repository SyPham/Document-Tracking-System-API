using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface ICategoryRepository : IDTSRepository<Category>
    {
        Task AddCategoryLang(List<CategoryLang> categoryLang);
        void UpdateCategoryLang(List<CategoryLang> categoryLang);
        Task<bool> CheckExists(int id);
        IQueryable<CategoryLang> GetAllCategoryLang();
        //viet them ham o day neu chua co trong ECRepository
    }
}