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
    public class SubCategoryController : ControllerBase
    {
        private readonly ISubCategoryService _subCategoryService;
        public SubCategoryController(ISubCategoryService subCategoryService)
        {
            _subCategoryService = subCategoryService;
        }

        [HttpGet("{langID}")]
        public async Task<IActionResult> GetSubCategorys([FromQuery]PaginationParams param, string langID)
        {
            var categories = await _subCategoryService.GetAllByLang(param, langID);
            Response.AddPagination(categories.CurrentPage, categories.PageSize, categories.TotalCount, categories.TotalPages);
            return Ok(categories);
        }

        [HttpGet(Name = "GetSubCategorys")]
        public async Task<IActionResult> GetAll()
        {
            var subCategorys = await _subCategoryService.GetAllAsync();
            return Ok(subCategorys);
        }

        [HttpGet("{text}")]
        public async Task<IActionResult> Search([FromQuery]PaginationParams param, string text)
        {
            var lists = await _subCategoryService.Search(param, text);
            Response.AddPagination(lists.CurrentPage, lists.PageSize, lists.TotalCount, lists.TotalPages);
            return Ok(lists);
        }
       
        [HttpPost]
        public async Task<IActionResult> Create(SubCategoryCreateDto subCategoryDto)
        {

            if (await _subCategoryService.CheckExists(subCategoryDto.ID))
                return BadRequest("SubCategory ID already exists!");
            //var username = User.FindFirst(ClaimTypes.Name).Value;
            //subCategoryIngredientDto.Updated_By = username;
            if (await _subCategoryService.Add(subCategoryDto))
            {
                return NoContent();
            }

            throw new Exception("Creating the subCategory failed on save");
        }

        [HttpPut]
        public async Task<IActionResult> Update(EditLangParams list)
        {
            if (await _subCategoryService.Update(list.editLangDto))
                return NoContent();
            return BadRequest($"Updating subCategory failed on save");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _subCategoryService.Delete(id))
                return NoContent();
            throw new Exception("Error deleting the subCategory");
        }
    }
}