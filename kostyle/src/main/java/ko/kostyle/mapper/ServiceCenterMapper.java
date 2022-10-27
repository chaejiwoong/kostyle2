package ko.kostyle.mapper;

import ko.kostyle.domain.Criteria;
import ko.kostyle.domain.ServiceCenterVo;

import java.util.List;

public interface ServiceCenterMapper {
//    @Select("SELECT * FROM notice WHERE nno > 0")
    public List<ServiceCenterVo> getQnaList();
    public List<ServiceCenterVo> getQnaListWithPaging(Criteria criteria);
    public List<ServiceCenterVo> getPurchase();
//    공지사항
//    public List<ServiceCenterVo> getNoticeList();
    public List<ServiceCenterVo> getNoticeListWithPaging(Criteria criteria);
    public int noticeTotalCount(Criteria criteria);
    public ServiceCenterVo NoticeDetail(Long nno);

//    public NoticeVo getCategoryList(String noCategory);

    public void insertNotice(ServiceCenterVo centerVo);
    public void selectNoticeKey (ServiceCenterVo centerVo);
}
