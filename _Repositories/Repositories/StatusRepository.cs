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
    public class StatusRepository : DTSRepository<Status>, IStatusRepository
    {
        private readonly DataContext _context;
        public StatusRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddStatusLang(List<StatusLang> teamLang)
        {
            await _context.StatusLangs.AddRangeAsync(teamLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.Status.AnyAsync(x => x.StatusID == id);
        }
        public IQueryable<StatusLang> GetAllStatusLang()
        {
            return _context.StatusLangs;
        }
        public void UpdateStatusLang(List<StatusLang> categoryLang)
        {
            var listupdate = _context.StatusLangs
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

            _context.StatusLangs.UpdateRange(categoryLang);
        }
    }
}