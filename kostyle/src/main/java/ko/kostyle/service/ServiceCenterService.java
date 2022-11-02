package ko.kostyle.service;

import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.Criteria;

import java.util.List;

public interface ServiceCenterService {

//    public List<ServiceCenterVo> getList();
    public List<ServiceCenterVo> getList(String category);
    public List<ServiceCenterVo> getAjaxList(String category);
    public List<ServiceCenterVo> purchaseList();
//    공지사항
//    public List<ServiceCenterVo> getNoticeList();
    public List<ServiceCenterVo> getNoticeList(Criteria criteria);

    public ServiceCenterVo getNoticeDetail(Long nno);

    public int noticeTotal(Criteria criteria);
    void insertNotice(ServiceCenterVo centerVo);

//    public Ser
//    public List<NoticeVo> getCategoryList(NoticeVo noticeVo);
//    public void insertNotice(ServiceCenterVo centerVo);
}
