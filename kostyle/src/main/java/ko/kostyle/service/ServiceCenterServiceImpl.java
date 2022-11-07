package ko.kostyle.service;


import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.ServiceCenterMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
@NoArgsConstructor

public class ServiceCenterServiceImpl implements ServiceCenterService {

    @Autowired
    private ServiceCenterMapper mapper;

    @Override
    public List<ServiceCenterVo> getList(String category) {
        return mapper.getQnaListWithPaging(category);
    }

	@Override
	public List<ServiceCenterVo> getAjaxList(String category) {
		// TODO Auto-generated method stub
		return mapper.getAjaxListWithPaging(category);
	}
    
//    공지사항
    @Override
    public List<ServiceCenterVo> getNoticeList(Criteria criteria) {

        return mapper.getNoticeListWithPaging(criteria);
    }

    @Override
    public ServiceCenterVo getNoticeDetail(Long nno) {
        return mapper.NoticeDetail(nno);
    }

    @Override
    public int noticeTotal(Criteria criteria) {
        return mapper.noticeTotalCount(criteria);
    }

	@Override
	public void insertAdminNotice(ServiceCenterVo centerVo) {
		mapper.insertNotice(centerVo);
		
	}

	@Override
	public boolean updateAdminNotice(ServiceCenterVo centerVo) {
		
		return mapper.updateNotice(centerVo) == 1;
	}

	@Override
	public boolean removeAdminNotice(Long nno) {
		return mapper.deleteNotice(nno) == 1;
	}

//    @Override
//    public List<NoticeVo> getCategoryList(NoticeVo noticeVo) {
//        return mapper.getCategoryList(noticeVo);
//    }




}
