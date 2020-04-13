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
    public class DepartmentService : IDepartmentService
    {
        private readonly IDepartmentRepository _repoDepartment;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public DepartmentService(IDepartmentRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;
            _repoDepartment = repoBrand;

        }

        #region CURD
        public async Task<bool> Add(DepartmentCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<Department>(model);
                _repoDepartment.Add(cat);
                await _repoDepartment.SaveAll();
                var langs = model.Langs.Select(x => new DepartmentLang { DepartmentID = cat.DepartmentID, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoDepartment.AddDepartmentLang(langs);
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> Delete(object id)
        {
            var glue = _repoDepartment.FindById(id);
            _repoDepartment.Remove(glue);
            return await _repoDepartment.SaveAll();
        }

        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<DepartmentLang>>(model);
            _repoDepartment.UpdateDepartmentLang(langs);
            return await _repoDepartment.SaveAll();
        }

        public async Task<PagedList<DepartmentDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoDepartment.FindAll().ProjectTo<DepartmentDto>(_configMapper)
            .Where(x => x.Name.Contains(text.ToString()))
            .OrderByDescending(x => x.DepartmentID);
            return await PagedList<DepartmentDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoDepartment.CheckExists(id);
        }

        public async Task<List<DepartmentDto>> GetAllAsync()
        {
            return await _repoDepartment.FindAll().ProjectTo<DepartmentDto>(_configMapper).OrderByDescending(x => x.DepartmentID).ToListAsync();
        }

        public DepartmentDto GetById(object id)
        {
            return _mapper.Map<Department, DepartmentDto>(_repoDepartment.FindById(id));
        }
        public async Task<PagedList<DepartmentDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var lists = _repoDepartment.FindAll().Include(x => x.DepartmentLangs).ProjectTo<DepartmentDto>(_configMapper).OrderByDescending(x => x.DepartmentID);
            return await PagedList<DepartmentDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(DepartmentCreateDto model)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}