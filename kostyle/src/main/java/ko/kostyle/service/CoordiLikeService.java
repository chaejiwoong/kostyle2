package ko.kostyle.service;

import ko.kostyle.dto.CoordiLikeDTO;

public interface CoordiLikeService {
	
	public int findLike(CoordiLikeDTO likeDTO);
	public void likeUp(CoordiLikeDTO likeDTO);
	public void likeDown(CoordiLikeDTO likeDTO);

}
