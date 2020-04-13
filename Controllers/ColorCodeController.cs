using System;
using System.Security.Claims;
using System.Threading.Tasks;
using DTS_API.Helpers;
using DTS_API._Services.Interface;
using DTS_API.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using DTS_API._Services.Services;

namespace DTS_API.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class ColorCodeController : ControllerBase
    {
        private readonly IColorCodeService _colorCodeService;
        public ColorCodeController(IColorCodeService colorCodeService)
        {
            _colorCodeService = colorCodeService;
        }

        [HttpGet]
        public async Task<IActionResult> GetColorCodes([FromQuery]PaginationParams param)
        {
            var colorCodes = await _colorCodeService.GetWithPaginations(param);
            Response.AddPagination(colorCodes.CurrentPage, colorCodes.PageSize, colorCodes.TotalCount, colorCodes.TotalPages);
            return Ok(colorCodes);
        }

        [HttpGet(Name = "GetColorCodes")]
        public async Task<IActionResult> GetAll()
        {
            var colorCodes = await _colorCodeService.GetAllAsync();
            return Ok(colorCodes);
        }

        [HttpGet("{text}")]
        public async Task<IActionResult> Search([FromQuery]PaginationParams param, string text)
        {
            var lists = await _colorCodeService.Search(param, text);
            Response.AddPagination(lists.CurrentPage, lists.PageSize, lists.TotalCount, lists.TotalPages);
            return Ok(lists);
        }

        [HttpPost]
        public async Task<IActionResult> Create(ColorCodeDto colorCodeIngredientDto)
        {

            if (await _colorCodeService.CheckExists(colorCodeIngredientDto.ID))
                return BadRequest("ColorCode ID already exists!");
            //var username = User.FindFirst(ClaimTypes.Name).Value;
            //colorCodeIngredientDto.Updated_By = username;
            if (await _colorCodeService.Add(colorCodeIngredientDto))
            {
                return NoContent();
            }

            throw new Exception("Creating the colorCode failed on save");
        }

        [HttpPut]
        public async Task<IActionResult> Update(ColorCodeDto colorCodeIngredientDto)
        {
            if (await _colorCodeService.Update(colorCodeIngredientDto))
                return NoContent();
            return BadRequest($"Updating colorCode {colorCodeIngredientDto.ID} failed on save");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _colorCodeService.Delete(id))
                return NoContent();
            throw new Exception("Error deleting the colorCode");
        }
    }
}