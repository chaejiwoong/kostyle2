package ko.kostyle.service;

import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.Criteria;

import java.util.List;

public interface ServiceCenterService {
//	qna
    public List<ServiceCenterVo> getList(String category);
    public List<ServiceCenterVo> getAjaxList(String category);
//  공지사항
    public List<ServiceCenterVo> getNoticeList(Criteria criteria);

    public ServiceCenterVo getNoticeDetail(Long nno);

    public int noticeTotal(Criteria criteria);
    
    void insertAdminNotice(ServiceCenterVo centerVo);

    public boolean updateAdminNotice(ServiceCenterVo centerVo);
    
    public boolean removeAdminNotice(Long nno);

}
