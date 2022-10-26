package ko.kostyle.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;

	private int endPage;

	private boolean prev, next;

	private int total;

	private Criteria cri;

	public PageDTO(Criteria cri, int total) {

		this.cri = cri;

		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; // 페이징의 끝번호

		this.startPage = this.endPage - 9; // 시작 페이지

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); // 토탈 페이지의 마지막

		if (realEnd <= this.endPage) {
			this.endPage = realEnd; // 페이징의 끝번호보다 realEnd가 작을 경우 초기화
		}

		this.prev = this.startPage > 1; // 이전 페이지가 있는가

		this.next = this.endPage < realEnd; // 다음 페이지가 있는가
	}

}
