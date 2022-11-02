package ko.kostyle.mapper;


import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.Criteria;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ServiceCenterMapper {
//	QNA
//    public List<ServiceCenterVo> getQnaList();
    public List<ServiceCenterVo> getQnaListWithPaging(@Param("category") String category);
    public List<ServiceCenterVo> getAjaxListWithPaging(@Param("category") String category);
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
