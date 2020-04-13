using DTS_API.DTO;
using DTS_API.Models;
using AutoMapper;

namespace DTS_API.Helpers.AutoMapper
{
    public class DtoToEfMappingProfile : Profile
    {
        public DtoToEfMappingProfile()
        {
            CreateMap<UserForDetailDto, User>();
            CreateMap<CategoryLangDto, CategoryLang>();
            CreateMap<CategoryDto, Category>();
            CreateMap<CategoryDto, CategoryLang>();
            CreateMap<CategoryCreateDto, Category>();
            CreateMap<TeamCreateDto, Team>();
            CreateMap<TeamDto, TeamLang> ();

            CreateMap<EditLangDto, CategoryLang>();
            CreateMap<EditLangDto, TeamLang > ();
            CreateMap<EditLangDto, DepartmentLang > ();
            CreateMap<EditLangDto, StatusLang> ();
            CreateMap<EditLangDto, LocationLang> ();
            CreateMap<EditLangDto, SubCategoryLang> ();

            CreateMap<CategoryLang, CategoryCreateDto>();
            CreateMap<SubCategoryLang, SubCategoryCreateDto>();
            CreateMap<DepartmentLang, DepartmentCreateDto>();
            CreateMap<TeamLang, TeamCreateDto>();
            CreateMap<StatusLang, StatusCreateDto>();
            CreateMap<LocationLang, TeamCreateDto>();

        }
    }
}