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
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _repoCategory;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public CategoryService(ICategoryRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;

            _repoCategory = repoBrand;

        }

        //Thêm Brand mới vào bảng Category
        public async Task<bool> Add(CategoryCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<Category>(model);
                _repoCategory.Add(cat);
                await _repoCategory.SaveAll();
                var langs = model.Langs.Select(x => new CategoryLang { CategoryID = cat.CategoryID, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoCategory.AddCategoryLang(langs);
                await _repoCategory.SaveAll();

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoCategory.CheckExists(id);
        }
        //Xóa Brand
        public async Task<bool> Delete(object id)
        {
            var glue = _repoCategory.FindById(id);
            _repoCategory.Remove(glue);
            return await _repoCategory.SaveAll();
        }

        //Cập nhật Brand
        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<CategoryLang>>(model);
            _repoCategory.UpdateCategoryLang(langs);
            return await _repoCategory.SaveAll();
        }

        //Lấy toàn bộ danh sách Brand 
        public async Task<List<CategoryDto>> GetAllAsync()
        {
                return await _repoCategory.GetAllCategoryLang().Include(x => x.Category).ProjectTo<CategoryDto>(_configMapper).OrderByDescending(x => x.CategoryID).ToListAsync();
        }

        //Lấy Brand theo Brand_Id
        public CategoryDto GetById(object id)
        {
            return _mapper.Map<Category, CategoryDto>(_repoCategory.FindById(id));
        }

        //Lấy danh sách Brand và phân trang
        public async Task<PagedList<CategoryDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var langs = Enum.Lang.GetValues(typeof(Enum.Lang)).Cast<Enum.Lang>().Select(x=>x.ToString()).ToList();
            if (langs.Contains(langID)) {
                var lists = _repoCategory.GetAllCategoryLang().Where(x => x.LanguageID.Equals(langID)).Include(x => x.Category).ProjectTo<CategoryDto>(_configMapper).OrderByDescending(x => x.CategoryID);
                return await PagedList<CategoryDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
            }
            else
            {
                return null;
            }
        }

        public async Task<PagedList<CategoryDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoCategory.FindAll().ProjectTo<CategoryDto>(_configMapper)
             .Where(x => x.Name.Contains(text.ToString()))
             .OrderByDescending(x => x.CategoryID);
            return await PagedList<CategoryDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(CategoryCreateDto model)
        {
            throw new NotImplementedException();
        }
    }
}