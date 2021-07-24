package com.swasthyapala.demo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class MyController {

	@Autowired
	KieContainer kieController;
	
	@GetMapping(value="getSla")
	public Test getSlaRequest(@RequestParam String type) {

		Test test=new Test();
		test.setType(type);
		
		KieSession kSession = kieController.newKieSession("ksession-rules");
		kSession.insert(test);
		kSession.fireAllRules();
		kSession.dispose();	
		return test;
	}
}
