package org.sob.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.sob.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)//j유닛 사용할때 스프링을 사용하겠다.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})//서버사용 테스트는 이걸로
@WebAppConfiguration
public class MainControllerTest {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{//test ok
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/sob/main")
		.param("userid","1"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.post("/sob/register")
				.param("from","1")
				.param("to","2")
				.param("cnt","3")
				.param("contents","test 내용")
				.param("groupid","test 내용")
				.param("categoryid","1")
				.param("boast","true"))
				.andReturn()
				.getModelAndView()
				.getViewName());
	}
	
	
	
	
	
	
	
}
