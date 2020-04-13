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
    public class DepartmentRepository : DTSRepository<Department>, IDepartmentRepository
    {
        private readonly DataContext _context;
        public DepartmentRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddDepartmentLang(List<DepartmentLang> departmentLang)
        {
            await _context.DepartmentLangs.AddRangeAsync(departmentLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.Departments.AnyAsync(x => x.DepartmentID == id);
        }
        public IQueryable<DepartmentLang> GetAllDepartmentLang()
        {
            return _context.DepartmentLangs;
        }
        public void UpdateDepartmentLang(List<DepartmentLang> categoryLang)
        {
            var listupdate = _context.DepartmentLangs
                .Where(x => categoryLang.Select(a => a.ID).Contains(x.ID))
                .ToList();
            foreach (var item in categoryLang)
            {
                foreach (var item2 in listupdate)
                {
                    if (item.ID == item2.ID)
                    {
                        item2.Name = item.Name;
                    }
                }
            }

            _context.DepartmentLangs.UpdateRange(categoryLang);
        }
    }
}