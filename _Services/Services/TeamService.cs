using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DTS_API.Helpers;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using DTS_API._Repositories.Interface;
using DTS_API._Services.Interface;
using DTS_API.DTO;
using DTS_API.Models;
using Microsoft.EntityFrameworkCore;

namespace DTS_API._Services.Services
{
    public class TeamService : ITeamService
    {
        private readonly ITeamRepository _repoTeam;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public TeamService(ITeamRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;
            _repoTeam = repoBrand;

        }

        #region CURD
        public async Task<bool> Add(TeamCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<Team>(model);
                _repoTeam.Add(cat);
                await _repoTeam.SaveAll();
                var langs = model.Langs.Select(x => new TeamLang { TeamID = cat.ID, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoTeam.AddTeamLang(langs);
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> Delete(object id)
        {
            var glue = _repoTeam.FindById(id);
            _repoTeam.Remove(glue);
            return await _repoTeam.SaveAll();
        }

        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<TeamLang>>(model);
            _repoTeam.UpdateTeamLang(langs);
            return await _repoTeam.SaveAll();
        }

        public async Task<PagedList<TeamDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoTeam.FindAll().ProjectTo<TeamDto>(_configMapper)
            .Where(x => x.Name.Contains(text.ToString()))
            .OrderByDescending(x => x.TeamID);
            return await PagedList<TeamDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoTeam.CheckExists(id);
        }

        public async Task<List<TeamDto>> GetAllAsync()
        {
            return await _repoTeam.FindAll().ProjectTo<TeamDto>(_configMapper).OrderByDescending(x => x.TeamID).ToListAsync();
        }

        public TeamDto GetById(object id)
        {
            return _mapper.Map<Team, TeamDto>(_repoTeam.FindById(id));
        }
        public async Task<PagedList<TeamDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var lists = _repoTeam.FindAll().Include(x => x.TeamLangs).ProjectTo<TeamDto>(_configMapper).OrderByDescending(x => x.TeamID);
            return await PagedList<TeamDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(TeamCreateDto model)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}