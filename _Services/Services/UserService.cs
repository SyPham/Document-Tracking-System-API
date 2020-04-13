using AutoMapper;
using AutoMapper.QueryableExtensions;
using DTS_API._Repositories.Interface;
using DTS_API._Services.Interface;
using DTS_API.DTO;
using DTS_API.Helpers;
using DTS_API.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DTS_API._Services.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _repoUser;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public UserService(IUserRepository repoUser, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;
            _repoUser = repoUser;

        }
        public async Task<bool> Add(UserDto model)
        {
            var user = _mapper.Map<User>(model);
            _repoUser.Add(user);
            return await _repoUser.SaveAll();
        }

        public async Task<bool> Delete(object id)
        {
            var user = _repoUser.FindById(id);
            _repoUser.Remove(user);
            return await _repoUser.SaveAll();
        }

        public async Task<List<UserDto>> GetAllAsync()
        {
            return await _repoUser.FindAll().ProjectTo<UserDto>(_configMapper).OrderByDescending(x => x.UserID).ToListAsync();

        }

        public UserDto GetById(object id)
        {
            return _mapper.Map<User, UserDto>(_repoUser.FindById(id));
        }

        public async Task<PagedList<UserDto>> GetWithPaginations(PaginationParams param)
        {
            var lists = _repoUser.FindAll().ProjectTo<UserDto>(_configMapper).OrderByDescending(x => x.UserID);
            return await PagedList<UserDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public async Task<PagedList<UserDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoUser.FindAll()
                .ProjectTo<UserDto>(_configMapper)
                .Where(x => x.Username.Contains(text.ToString()))
                .OrderByDescending(x => x.UserID);
            return await PagedList<UserDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public async Task<bool> Update(UserDto model)
        {
            var user = _mapper.Map<User>(model);
            _repoUser.Update(user);
            return await _repoUser.SaveAll();
        }
    }
}
