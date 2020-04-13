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
    public class TeamController : ControllerBase
    {
        private readonly ITeamService _teamService;
        public TeamController(ITeamService teamService)
        {
            _teamService = teamService;
        }

        [HttpGet("{langID}")]
        public async Task<IActionResult> GetTeams([FromQuery]PaginationParams param, string langID)
        {
            var brands = await _teamService.GetAllByLang(param, langID);
            Response.AddPagination(brands.CurrentPage, brands.PageSize, brands.TotalCount, brands.TotalPages);
            return Ok(brands);
        }

        [HttpGet(Name = "GetTeams")]
        public async Task<IActionResult> GetAll()
        {
            var brands = await _teamService.GetAllAsync();
            return Ok(brands);
        }

        [HttpGet("{text}")]
        public async Task<IActionResult> Search([FromQuery]PaginationParams param, string text)
        {
            var lists = await _teamService.Search(param, text);
            Response.AddPagination(lists.CurrentPage, lists.PageSize, lists.TotalCount, lists.TotalPages);
            return Ok(lists);
        }
       
        [HttpPost]
        public async Task<IActionResult> Create(TeamCreateDto teamDto)
        {

            if (await _teamService.CheckExists(teamDto.ID))
                return BadRequest("Team ID already exists!");
            //var username = User.FindFirst(ClaimTypes.Name).Value;
            //glueIngredientDto.Updated_By = username;
            if (await _teamService.Add(teamDto))
            {
                return NoContent();
            }

            throw new Exception("Creating the team failed on save");
        }

        [HttpPut]
        public async Task<IActionResult> Update(EditLangParams list)
        {
            if (await _teamService.Update(list.editLangDto))
                return NoContent();
            return BadRequest($"Updating team failed on save");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _teamService.Delete(id))
                return NoContent();
            throw new Exception("Error deleting the team");
        }
    }
}