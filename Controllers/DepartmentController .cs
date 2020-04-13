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
    public class DepartmentController : ControllerBase
    {
        private readonly IDepartmentService _departmentService;
        public DepartmentController(IDepartmentService departmentService)
        {
            _departmentService = departmentService;
        }

        [HttpGet("{langID}")]
        public async Task<IActionResult> GetDepartments([FromQuery]PaginationParams param, string langID)
        {
            var brands = await _departmentService.GetAllByLang(param, langID);
            Response.AddPagination(brands.CurrentPage, brands.PageSize, brands.TotalCount, brands.TotalPages);
            return Ok(brands);
        }

        [HttpGet(Name = "GetDepartments")]
        public async Task<IActionResult> GetAll()
        {
            var brands = await _departmentService.GetAllAsync();
            return Ok(brands);
        }

        [HttpGet("{text}")]
        public async Task<IActionResult> Search([FromQuery]PaginationParams param, string text)
        {
            var lists = await _departmentService.Search(param, text);
            Response.AddPagination(lists.CurrentPage, lists.PageSize, lists.TotalCount, lists.TotalPages);
            return Ok(lists);
        }
       
        [HttpPost]
        public async Task<IActionResult> Create(DepartmentCreateDto departmentDto)
        {

            if (await _departmentService.CheckExists(departmentDto.ID))
                return BadRequest("Department ID already exists!");
            //var username = User.FindFirst(ClaimTypes.Name).Value;
            //glueIngredientDto.Updated_By = username;
            if (await _departmentService.Add(departmentDto))
            {
                return NoContent();
            }

            throw new Exception("Creating the department failed on save");
        }

        [HttpPut]
        public async Task<IActionResult> Update(EditLangParams list)
        {
            if (await _departmentService.Update(list.editLangDto))
                return NoContent();
            return BadRequest($"Updating department failed on save");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _departmentService.Delete(id))
                return NoContent();
            throw new Exception("Error deleting the department");
        }
    }
}