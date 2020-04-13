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
    public class LocationRepository : DTSRepository<Location>, ILocationRepository
    {
        private readonly DataContext _context;
        public LocationRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddLocationLang(List<LocationLang> categoryLang)
        {
            await _context.LocationLangs.AddRangeAsync(categoryLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.Locations.AnyAsync(x => x.Number == id);
        }

        public IQueryable<LocationLang> GetAllLocationLang()
        {
            return _context.LocationLangs;
        }
        public void UpdateLocationLang(List<LocationLang> categoryLang)
        {
            var listupdate = _context.LocationLangs
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
            
             _context.LocationLangs.UpdateRange(categoryLang);
        }
        //Login khi them repo
    }
}