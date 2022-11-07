package ko.kostyle.mapper;

import ko.kostyle.domain.CoordiLikeVO;

public interface CoordiLikeMapper {
	
	public int findLike(CoordiLikeVO like);
	public void insert(CoordiLikeVO like);
	public void delete(CoordiLikeVO like);
	
	
//	public int findLike(@Param("cno") Long cno, @Param("mno") Long mno);
//	public void insert(@Param("cno") Long cno, @Param("mno") Long mno);
//	public void delete(@Param("cno") Long cno, @Param("mno") Long mno);

}
