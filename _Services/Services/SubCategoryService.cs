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
using DTS_API.Data;

namespace DTS_API._Services.Services
{
    public class SubCategoryService : ISubCategoryService
    {
        private readonly ISubCategoryRepository _repoSubCategory;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public SubCategoryService(ISubCategoryRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;

            _repoSubCategory = repoBrand;

        }

        //Thêm Brand mới vào bảng SubCategory
        public async Task<bool> Add(SubCategoryCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<SubCategory>(model);
                _repoSubCategory.Add(cat);
                await _repoSubCategory.SaveAll();
                var langs = model.Langs.Select(x => new SubCategoryLang { SubCategoryID = cat.SubCategoryID, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoSubCategory.AddSubCategoryLang(langs);
                await _repoSubCategory.SaveAll();

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoSubCategory.CheckExists(id);
        }
        //Xóa Brand
        public async Task<bool> Delete(object id)
        {
            var glue = _repoSubCategory.FindById(id);
            _repoSubCategory.Remove(glue);
            return await _repoSubCategory.SaveAll();
        }

        //Cập nhật Brand
        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<SubCategoryLang>>(model);
            _repoSubCategory.UpdateSubCategoryLang(langs);
            return await _repoSubCategory.SaveAll();
        }

        //Lấy toàn bộ danh sách Brand 
        public async Task<List<SubCategoryDto>> GetAllAsync()
        {
                return await _repoSubCategory.GetAllSubCategoryLang().Include(x => x.SubCategory).ProjectTo<SubCategoryDto>(_configMapper).OrderByDescending(x => x.SubCategoryID).ToListAsync();
        }

        //Lấy Brand theo Brand_Id
        public SubCategoryDto GetById(object id)
        {
            return _mapper.Map<SubCategory, SubCategoryDto>(_repoSubCategory.FindById(id));
        }

        //Lấy danh sách Brand và phân trang
        public async Task<PagedList<SubCategoryDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var langs = Enum.Lang.GetValues(typeof(Enum.Lang)).Cast<Enum.Lang>().Select(x=>x.ToString()).ToList();
            if (langs.Contains(langID)) {
                var lists = _repoSubCategory.GetAllSubCategoryLang().Where(x => x.LanguageID.Equals(langID)).Include(x => x.SubCategory).ProjectTo<SubCategoryDto>(_configMapper).OrderByDescending(x => x.SubCategoryID);
                return await PagedList<SubCategoryDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
            }
            else
            {
                return null;
            }
        }

        public async Task<PagedList<SubCategoryDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoSubCategory.FindAll().ProjectTo<SubCategoryDto>(_configMapper)
             .Where(x => x.Name.Contains(text.ToString()))
             .OrderByDescending(x => x.SubCategoryID);
            return await PagedList<SubCategoryDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(SubCategoryCreateDto model)
        {
            throw new NotImplementedException();
        }
    }
}