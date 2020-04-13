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
    public class LocationService : ILocationService
    {
        private readonly ILocationRepository _repoLocation;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        public LocationService(ILocationRepository repoBrand, IMapper mapper, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;

            _repoLocation = repoBrand;

        }

        //Thêm Brand mới vào bảng Location
        public async Task<bool> Add(LocationCreateDto model)
        {

            try
            {
                var cat = _mapper.Map<Location>(model);
                _repoLocation.Add(cat);
                await _repoLocation.SaveAll();
                var langs = model.Langs.Select(x => new LocationLang { LocationID = cat.Number, Name = x.Name, LanguageID = x.LanguageID }).ToList();
                await _repoLocation.AddLocationLang(langs);
                await _repoLocation.SaveAll();

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<bool> CheckExists(int id)
        {
            return await _repoLocation.CheckExists(id);
        }
        //Xóa Brand
        public async Task<bool> Delete(object id)
        {
            var glue = _repoLocation.FindById(id);
            _repoLocation.Remove(glue);
            return await _repoLocation.SaveAll();
        }

        //Cập nhật Brand
        public async Task<bool> Update(List<EditLangDto> model)
        {
            var langs = _mapper.Map<List<LocationLang>>(model);
            _repoLocation.UpdateLocationLang(langs);
            return await _repoLocation.SaveAll();
        }

        //Lấy toàn bộ danh sách Brand 
        public async Task<List<LocationDto>> GetAllAsync()
        {
                return await _repoLocation.GetAllLocationLang().Include(x => x.Location).ProjectTo<LocationDto>(_configMapper).OrderByDescending(x => x.LocationID).ToListAsync();
        }

        //Lấy Brand theo Brand_Id
        public LocationDto GetById(object id)
        {
            return _mapper.Map<Location, LocationDto>(_repoLocation.FindById(id));
        }

        //Lấy danh sách Brand và phân trang
        public async Task<PagedList<LocationDto>> GetAllByLang(PaginationParams param, string langID)
        {
            var langs = Enum.Lang.GetValues(typeof(Enum.Lang)).Cast<Enum.Lang>().Select(x=>x.ToString()).ToList();
            if (langs.Contains(langID)) {
                var lists = _repoLocation.GetAllLocationLang().Where(x => x.LanguageID.Equals(langID)).Include(x => x.Location).ProjectTo<LocationDto>(_configMapper).OrderByDescending(x => x.LocationID);
                return await PagedList<LocationDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
            }
            else
            {
                return null;
            }
        }

        public async Task<PagedList<LocationDto>> Search(PaginationParams param, object text)
        {
            var lists = _repoLocation.FindAll().ProjectTo<LocationDto>(_configMapper)
             .Where(x => x.Name.Contains(text.ToString()))
             .OrderByDescending(x => x.LocationID);
            return await PagedList<LocationDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }

        public Task<bool> Update(LocationCreateDto model)
        {
            throw new NotImplementedException();
        }
    }
}