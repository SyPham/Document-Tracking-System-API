using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Data;
using DTS_API.Models;

namespace DTS_API._Repositories.Interface
{
    public interface IDepartmentRepository : IDTSRepository<Department>
    {
        Task AddDepartmentLang(List<DepartmentLang> teamLang);
        void UpdateDepartmentLang(List<DepartmentLang> teamLang);
        Task<bool> CheckExists(int id);
        IQueryable<DepartmentLang> GetAllDepartmentLang();
    }
}