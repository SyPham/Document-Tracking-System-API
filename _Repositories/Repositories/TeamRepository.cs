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
    public class TeamRepository : DTSRepository<Team>, ITeamRepository
    {
        private readonly DataContext _context;
        public TeamRepository(DataContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddTeamLang(List<TeamLang> teamLang)
        {
            await _context.TeamLangs.AddRangeAsync(teamLang);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _context.Teams.AnyAsync(x => x.ID == id);
        }
        public IQueryable<TeamLang> GetAllTeamLang()
        {
            return _context.TeamLangs;
        }
        public void UpdateTeamLang(List<TeamLang> categoryLang)
        {
            var listupdate = _context.TeamLangs
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

            _context.TeamLangs.UpdateRange(categoryLang);
        }
    }
}