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
    public class ColorCodeRepository : DTSRepository<ColorCode>, IColorCodeRepository
    {
        private readonly DataContext _context;
        public ColorCodeRepository(DataContext context) : base(context)
        {
            _context = context;
        }
        public async Task<bool> CheckExists(int id)
        {
            return await _context.ColorCodes.AnyAsync(x => x.ID == id);
        }
   
    }
}