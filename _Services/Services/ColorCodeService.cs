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
    public class ColorCodeService : IColorCodeService
    {

        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        private readonly IColorCodeRepository _colorCodeRepository;
        public ColorCodeService(IMapper mapper, IColorCodeRepository colorCodeRepository, MapperConfiguration configMapper)
        {
            _configMapper = configMapper;
            _mapper = mapper;
            _colorCodeRepository = colorCodeRepository;

        }

        //Thêm Brand mới vào bảng ColorCode
        public async Task<bool> Add(ColorCodeDto model)
        {
            var colorCode = _mapper.Map<ColorCode>(model);
            _colorCodeRepository.Add(colorCode);
            return await _colorCodeRepository.SaveAll();
        }



        //Lấy danh sách Brand và phân trang
        public async Task<PagedList<ColorCodeDto>> GetWithPaginations(PaginationParams param)
        {
            var lists = _colorCodeRepository.FindAll().ProjectTo<ColorCodeDto>(_configMapper).OrderByDescending(x => x.ID);
            return await PagedList<ColorCodeDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }
        //public async Task<object> GetIngredientOfColorCode(int colorCodeid)
        //{
        //    return await _colorCodeRepository.GetIngredientOfColorCode(colorCodeid);

        //    throw new System.NotImplementedException();
        //}
        //Tìm kiếm colorCode
        public async Task<PagedList<ColorCodeDto>> Search(PaginationParams param, object text)
        {
            var lists = _colorCodeRepository.FindAll().ProjectTo<ColorCodeDto>(_configMapper)
            .Where(x => x.Code.Contains(text.ToString()))
            .OrderByDescending(x => x.ID);
            return await PagedList<ColorCodeDto>.CreateAsync(lists, param.PageNumber, param.PageSize);
        }
        public async Task<bool> CheckExists(int id)
        {
            return await _colorCodeRepository.CheckExists(id);
        }
        //Xóa Brand
        public async Task<bool> Delete(object id)
        {
            var colorCode = _colorCodeRepository.FindById(id);
            _colorCodeRepository.Remove(colorCode);
            return await _colorCodeRepository.SaveAll();
        }

        //Cập nhật Brand
        public async Task<bool> Update(ColorCodeDto model)
        {
            var colorCode = _mapper.Map<ColorCode>(model);
            _colorCodeRepository.Update(colorCode);
            return await _colorCodeRepository.SaveAll();
        }

        //Lấy toàn bộ danh sách Brand 
        public async Task<List<ColorCodeDto>> GetAllAsync()
        {
            return await _colorCodeRepository.FindAll().ProjectTo<ColorCodeDto>(_configMapper).OrderByDescending(x => x.ID).ToListAsync();
        }

        //Lấy Brand theo Brand_Id
        public ColorCodeDto GetById(object id)
        {
            return _mapper.Map<ColorCode, ColorCodeDto>(_colorCodeRepository.FindById(id));
        }

    }
}
