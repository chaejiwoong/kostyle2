package ko.kostyle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ko.kostyle.domain.StatsVO;
import ko.kostyle.service.StatsService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
@AllArgsConstructor
public class StatsController {
	
	@Autowired
	private StatsService statsService;
	
	@GetMapping("/stats")
	public String stats(Model model) {
		
		
		model.addAttribute("stats",statsService.statsList());
		model.addAttribute("stats2",statsService.statsList2());
		model.addAttribute("stats3",statsService.statsList3());
		model.addAttribute("stats4",statsService.statsList4());
		
		model.addAttribute("statsScno",statsService.statsScnoList());
		model.addAttribute("statsScno2",statsService.statsScnoList2());
		model.addAttribute("statsScno3",statsService.statsScnoList3());
		model.addAttribute("statsScno4",statsService.statsScnoList4());
		model.addAttribute("statsScno5",statsService.statsScnoList5());
		model.addAttribute("statsScno6",statsService.statsScnoList6());
		model.addAttribute("statsScno7",statsService.statsScnoList7());
		model.addAttribute("statsScno8",statsService.statsScnoList8());
		model.addAttribute("statsScno9",statsService.statsScnoList9());
		model.addAttribute("statsScno10",statsService.statsScnoList10());
		model.addAttribute("statsScno11",statsService.statsScnoList11());
		model.addAttribute("statsScno12",statsService.statsScnoList12());
		model.addAttribute("statsScno13",statsService.statsScnoList13());
		model.addAttribute("statsScno14",statsService.statsScnoList14());
		model.addAttribute("statsScno15",statsService.statsScnoList15());
		model.addAttribute("statsScno16",statsService.statsScnoList16());
		model.addAttribute("statsScno17",statsService.statsScnoList17());
		model.addAttribute("statsScno18",statsService.statsScnoList18());
		model.addAttribute("statsScno19",statsService.statsScnoList19());
		model.addAttribute("statsScno20",statsService.statsScnoList20());
		model.addAttribute("statsScno21",statsService.statsScnoList21());
		model.addAttribute("statsScno22",statsService.statsScnoList22());
		model.addAttribute("statsScno23",statsService.statsScnoList23());
		model.addAttribute("statsScno24",statsService.statsScnoList24());
		model.addAttribute("statsScno25",statsService.statsScnoList25());
		model.addAttribute("statsScno26",statsService.statsScnoList26());
		model.addAttribute("statsScno27",statsService.statsScnoList27());
		model.addAttribute("statsScno28",statsService.statsScnoList28());
		
		
		return "admin/products/stats";
	}
    
    
    
    
}
