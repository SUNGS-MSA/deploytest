package nh.deploy.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController //rest 방식의 컨트롤러 입니다.
//@RequestMapping("/deploy")
public class SampleController {
	
	
	@RequestMapping("/hello")
	public String getSample() {
		
		return  "deploy test";	
	}
}
