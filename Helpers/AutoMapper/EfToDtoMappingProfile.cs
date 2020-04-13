using DTS_API.DTO;
using DTS_API.Models;
using AutoMapper;
using System.Linq;

namespace DTS_API.Helpers.AutoMapper
{
    public class EfToDtoMappingProfile : Profile
    {
        public EfToDtoMappingProfile()
        {
            CreateMap<User, UserForDetailDto>();

            CreateMap<CategoryLang, CategoryLangDto >();

            CreateMap<CategoryLang, CategoryDto>();
            CreateMap<TeamLang, TeamDto>();

            CreateMap<Team, TeamDto>()
           .ForMember(dest => dest.Name, option => option.MapFrom(s => s.TeamLangs.ToList().Select(x => x.Name).First()));

            CreateMap<Category, CategoryCreateDto>().ForMember(dest => dest.Langs, option => option.Ignore());

            CreateMap<CategoryLang, CategoryCreateDto>();
            CreateMap<SubCategoryLang, SubCategoryCreateDto>();
            CreateMap<DepartmentLang, DepartmentCreateDto>();
            CreateMap<TeamLang, TeamCreateDto>();
            CreateMap<StatusLang, StatusCreateDto>();
            CreateMap<LocationLang, LocationCreateDto>();

            CreateMap<CategoryLang, EditLangDto>();
            CreateMap<TeamLang, EditLangDto>();
            CreateMap<DepartmentLang, EditLangDto>();
            CreateMap<StatusLang, EditLangDto>();
            CreateMap<LocationLang, EditLangDto>();
            CreateMap<SubCategoryLang, EditLangDto>();

            CreateMap<ColorCode, ColorCodeDto>();
            CreateMap<Status, Status>();
            CreateMap<Department, DepartmentDto>();
            CreateMap<Team, TeamDto>();
            CreateMap<Category, CategoryDto>();
            CreateMap<SubCategory, SubCategoryDto>();
            CreateMap<Location, LocationDto>();


        }

    }
}