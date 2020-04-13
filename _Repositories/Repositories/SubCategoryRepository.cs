using System.Threading.Tasks;
using DTS_API._Repositories.Interface;
using DTS_API.Data;
using DTS_API.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using DTS_API.DTO;
using System.Collections.Generic;

namespace DTS_API._Repositories.Repositories
{
    public class SubCategoryRepository : DTSRepository<SubCategory>, ISubCategoryRepository
    {
        private readonly DataContext _context;
        public SubCategoryRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddSubCategoryLang(List<SubCategoryLang> categoryLang)
        {
            await _context.SubCategoryLangs.AddRangeAsync(categoryLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.SubCategories.AnyAsync(x => x.SubCategoryID == id);
        }

        public IQueryable<SubCategoryLang> GetAllSubCategoryLang()
        {
            return _context.SubCategoryLangs;
        }
        public void UpdateSubCategoryLang(List<SubCategoryLang> categoryLang)
        {
            var listupdate = _context.SubCategoryLangs
                .Where(x => categoryLang.Select(a => a.ID).Contains(x.ID))
                .ToList();
            foreach (var item in categoryLang)
            {
                foreach (var item2 in listupdate)
                {
                    if(item.ID == item2.ID)
                    {
                        item2.Name = item.Name;
                    }
                }
            }
            
             _context.SubCategoryLangs.UpdateRange(categoryLang);
        }
        //Login khi them repo
    }
}