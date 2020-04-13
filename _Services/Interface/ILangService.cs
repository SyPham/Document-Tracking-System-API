using DTS_API.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Interface
{
   public interface ILangService<T, K>
    {
        Task<List<T>> GetAllAsync();
        Task<PagedList<T>> GetAllByLang(PaginationParams param, string langID);
        Task<PagedList<T>> Search(PaginationParams param, object text);
        Task<bool> Add(K model);
        Task<bool> Update(K model);
        Task<bool> Delete(object id);
        Task<bool> CheckExists(int id);
    }
}
