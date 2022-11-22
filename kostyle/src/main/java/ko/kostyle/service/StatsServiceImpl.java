package ko.kostyle.service;


import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.domain.StatsVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.ServiceCenterMapper;
import ko.kostyle.mapper.StatsMapper;
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

public class StatsServiceImpl implements StatsService {

    @Autowired
    private StatsMapper mapper;

	@Override
	public List<StatsVO> statsList() {
		return mapper.statsList();
	}
	@Override
	public List<StatsVO> statsList2() {
		return mapper.statsList2();
	}
	@Override
	public List<StatsVO> statsList3() {
		return mapper.statsList3();
	}
	@Override
	public List<StatsVO> statsList4() {
		return mapper.statsList4();
	}
	@Override
	public List<StatsVO> statsScnoList() {
		return mapper.statsScnoList();
	}
	@Override
	public List<StatsVO> statsScnoList2() {
		return mapper.statsScnoList2();
	}
	@Override
	public List<StatsVO> statsScnoList3() {
		return mapper.statsScnoList3();
	}
	@Override
	public List<StatsVO> statsScnoList4() {
		return mapper.statsScnoList4();
	}
	@Override
	public List<StatsVO> statsScnoList5() {
		return mapper.statsScnoList5();
	}
	@Override
	public List<StatsVO> statsScnoList6() {
		return mapper.statsScnoList6();
	}
	@Override
	public List<StatsVO> statsScnoList7() {
		return mapper.statsScnoList7();
	}
	@Override
	public List<StatsVO> statsScnoList8() {
		return mapper.statsScnoList8();
	}
	@Override
	public List<StatsVO> statsScnoList9() {
		return mapper.statsScnoList9();
	}
	@Override
	public List<StatsVO> statsScnoList10() {
		return mapper.statsScnoList10();
	}
	@Override
	public List<StatsVO> statsScnoList11() {
		return mapper.statsScnoList11();
	}
	@Override
	public List<StatsVO> statsScnoList12() {
		return mapper.statsScnoList12();
	}
	@Override
	public List<StatsVO> statsScnoList13() {
		return mapper.statsScnoList13();
	}
	@Override
	public List<StatsVO> statsScnoList14() {
		return mapper.statsScnoList14();
	}
	@Override
	public List<StatsVO> statsScnoList15() {
		return mapper.statsScnoList15();
	}
	@Override
	public List<StatsVO> statsScnoList16() {
		return mapper.statsScnoList16();
	}
	@Override
	public List<StatsVO> statsScnoList17() {
		return mapper.statsScnoList17();
	}
	@Override
	public List<StatsVO> statsScnoList18() {
		return mapper.statsScnoList18();
	}
	@Override
	public List<StatsVO> statsScnoList19() {
		return mapper.statsScnoList19();
	}
	@Override
	public List<StatsVO> statsScnoList20() {
		return mapper.statsScnoList20();
	}
	@Override
	public List<StatsVO> statsScnoList21() {
		return mapper.statsScnoList21();
	}
	@Override
	public List<StatsVO> statsScnoList22() {
		return mapper.statsScnoList22();
	}
	@Override
	public List<StatsVO> statsScnoList23() {
		return mapper.statsScnoList23();
	}
	@Override
	public List<StatsVO> statsScnoList24() {
		return mapper.statsScnoList24();
	}
	@Override
	public List<StatsVO> statsScnoList25() {
		return mapper.statsScnoList25();
	}
	@Override
	public List<StatsVO> statsScnoList26() {
		return mapper.statsScnoList26();
	}
	@Override
	public List<StatsVO> statsScnoList27() {
		return mapper.statsScnoList27();
	}
	@Override
	public List<StatsVO> statsScnoList28() {
		return mapper.statsScnoList28();
	}
	

    



}
