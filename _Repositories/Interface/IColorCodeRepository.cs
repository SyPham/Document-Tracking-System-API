using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface IColorCodeRepository : IDTSRepository<ColorCode>
    {
        Task<bool> CheckExists(int id);
        //viet them ham o day neu chua co trong ECRepository
    }
}