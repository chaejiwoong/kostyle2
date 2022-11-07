package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.CoordiVO;
import ko.kostyle.dto.Criteria;


public interface CoordiMapper {

	public List<CoordiVO> getList(Criteria cri);
	public CoordiVO getCoordi(Long cno);
	public void insertSelectKey(CoordiVO coordi);
	public void update(CoordiVO coordi);
	public void delete(Long cno);
	public void updateCommentCount(@Param("cno") Long cno, @Param("amount") int amount);
	public void updateHitcount(@Param("cno") Long cno);	
	
	public void updateLikeCoutnt(Long cno);
	
	public int getTotalCount(Criteria cri);
}
