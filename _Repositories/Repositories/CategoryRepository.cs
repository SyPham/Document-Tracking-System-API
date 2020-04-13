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
    public class CategoryRepository : DTSRepository<Category>, ICategoryRepository
    {
        private readonly DataContext _context;
        public CategoryRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddCategoryLang(List<CategoryLang> categoryLang)
        {
            await _context.CategoryLangs.AddRangeAsync(categoryLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.Categories.AnyAsync(x => x.CategoryID == id);
        }

        public IQueryable<CategoryLang> GetAllCategoryLang()
        {
            return _context.CategoryLangs;
        }
        public void UpdateCategoryLang(List<CategoryLang> categoryLang)
        {
            var listupdate = _context.CategoryLangs
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
            
             _context.CategoryLangs.UpdateRange(categoryLang);
        }
        //Login khi them repo
    }
}