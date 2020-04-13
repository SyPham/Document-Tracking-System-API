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
    public class StatusService : IStatusService
    {
        private readonly IStatusRepository _repoStatus;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public StatusService(IStatusRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;
            _repoStatus = repoBrand;

        }

        #region CURD
        public async Task<bool> Add(StatusCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<Status>(model);
                _repoStatus.Add(cat);
                await _repoStatus.SaveAll();
                var langs = model.Langs.Select(x => new StatusLang { StatusID = cat.StatusID, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoStatus.AddStatusLang(langs);
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> Delete(object id)
        {
            var glue = _repoStatus.FindById(id);
            _repoStatus.Remove(glue);
            return await _repoStatus.SaveAll();
        }

        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<StatusLang>>(model);
            _repoStatus.UpdateStatusLang(langs);
            return await _repoStatus.SaveAll();
        }

        public async Task<PagedList<StatusDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoStatus.FindAll().ProjectTo<StatusDto>(_configMapper)
            .Where(x => x.Name.Contains(text.ToString()))
            .OrderByDescending(x => x.StatusID);
            return await PagedList<StatusDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoStatus.CheckExists(id);
        }

        public async Task<List<StatusDto>> GetAllAsync()
        {
            return await _repoStatus.FindAll().ProjectTo<StatusDto>(_configMapper).OrderByDescending(x => x.StatusID).ToListAsync();
        }

        public StatusDto GetById(object id)
        {
            return _mapper.Map<Status, StatusDto>(_repoStatus.FindById(id));
        }
        public async Task<PagedList<StatusDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var lists = _repoStatus.FindAll().Include(x => x.StatusLangs).ProjectTo<StatusDto>(_configMapper).OrderByDescending(x => x.StatusID);
            return await PagedList<StatusDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(StatusCreateDto model)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}