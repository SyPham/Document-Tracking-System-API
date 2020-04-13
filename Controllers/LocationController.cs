using System;
using System.Security.Claims;
using System.Threading.Tasks;
using DTS_API.Helpers;
using DTS_API._Services.Interface;
using DTS_API.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace DTS_API.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class LocationController : ControllerBase
    {
        private readonly ILocationService _categoryService;
        public LocationController(ILocationService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet("{langID}")]
        public async Task<IActionResult> GetLocations([FromQuery]PaginationParams param, string langID)
        {
            var categories = await _categoryService.GetAllByLang(param, langID);
            Response.AddPagination(categories.CurrentPage, categories.PageSize, categories.TotalCount, categories.TotalPages);
            return Ok(categories);
        }

        [HttpGet(Name = "GetLocations")]
        public async Task<IActionResult> GetAll()
        {
            var categorys = await _categoryService.GetAllAsync();
            return Ok(categorys);
        }

        [HttpGet("{text}")]
        public async Task<IActionResult> Search([FromQuery]PaginationParams param, string text)
        {
            var lists = await _categoryService.Search(param, text);
            Response.AddPagination(lists.CurrentPage, lists.PageSize, lists.TotalCount, lists.TotalPages);
            return Ok(lists);
        }
       
        [HttpPost]
        public async Task<IActionResult> Create(LocationCreateDto categoryDto)
        {

            if (await _categoryService.CheckExists(categoryDto.ID))
                return BadRequest("Location ID already exists!");
            //var username = User.FindFirst(ClaimTypes.Name).Value;
            //categoryIngredientDto.Updated_By = username;
            if (await _categoryService.Add(categoryDto))
            {
                return NoContent();
            }

            throw new Exception("Creating the category failed on save");
        }

        [HttpPut]
        public async Task<IActionResult> Update(EditLangParams list)
        {
            if (await _categoryService.Update(list.editLangDto))
                return NoContent();
            return BadRequest($"Updating category failed on save");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _categoryService.Delete(id))
                return NoContent();
            throw new Exception("Error deleting the category");
        }
    }
}