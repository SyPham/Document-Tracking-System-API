using System.Threading.Tasks;
using DTS_API.Models;

namespace DTS_API.Data
{
    public interface IAuthRepository
    {
        Task<User> Login(string username, string password);
        Task<User> ChangePassword(string username, string password);
    }
}