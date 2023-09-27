using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public partial interface IHoaDonBusiness
    {
        List<HoaDonModel> GetAll();
        HoaDonModel GetDatabyID(int id);
        bool Create(HoaDonModel model);
        bool Update(HoaDonModel model);

        List<ThongKeKhachModel> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime fr_NgayTao, DateTime to_NgayTao);
    }
   
}
