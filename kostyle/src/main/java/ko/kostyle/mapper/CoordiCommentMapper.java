package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.CoordiCommentVO;
import ko.kostyle.dto.Criteria;

public interface CoordiCommentMapper {
	
	public List<CoordiCommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("cno") Long cno);
	public int getCountByCno(Long cno);
	public int insert(CoordiCommentVO comment);
	public CoordiCommentVO getComment (Long ccno);
	public int delete(Long ccno);
	
}
