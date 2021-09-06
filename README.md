# Sea-Of-Bottle



## 개요

유리병 편지 컨셉트.

익명을 통해 짧은 메시지 형태로 발송함으로써 일상의 스트레스 해소 역할을 기대할 수 있는 서비스.



## 개발기간
||프로젝트 기획|기획 피드백|파트별 기능 구현|버그 고치기|템플릿 적용|서버 구동|
|:--|:-:|:-:|:-:|:-:|:-:|:-:|
|08/19|*||||||
|08/20|*|*|||||
|08/21|*|*|||||
|08/23|||*||||
|08/24|||*||||
|08/25|||*||||
|08/26|||*|*|||
|08/27|||*|*|*||
|08/30||||*|*||
|08/31||||*|*||
|09/01||||*|*||
|09/02||||*||*|
|09/03||||*||*|



## 개발 환경

- eclipse Version: 2020-03 (4.15.0)

- JavaSE-1.8

- MariaDB 5.5

- Apache Tomcat v9.0

- Spring 5.0.7.RELEASE



## ER Diagram
##### ![erd](./imgs/SeaOfBottle_ERD.png)



## 예시 화면

##### 로그인
![login](./imgs/login.PNG)

##### 편지 목록
![list](./imgs/list.PNG)

##### 편지 상세
![detail](./imgs/detail.PNG)



## 학습 내용

##### oaoing
- Google Login API oauth 2.0

  ![oauth](./imgs/authorization-code.png)

> <small>[Google ID 플랫폼](https://developers.google.com/identity/protocols/oauth2 )</small>

- Spring error 페이지 처리

```xml
<error-page>
	    <error-code>400</error-code>
	    <location>/WEB-INF/views/error/error400.jsp</location>
</error-page>
	<error-page>
    	<location>/WEB-INF/views/error/error.jsp</location>
</error-page>
```
> <small>web.xml</small>

- Spring email 전송
```xml
<bean id="mailSender" 
		class="org.springframework.mail.javamail.JavaMailSenderImpl">
        <property name="host" value="smtp.gmail.com" /> <!-- gmail을 사용 -->
        <property name="port" value="587" />
        <property name="username" value="#" />
        <property name="password" value="#" />
        <property name="javaMailProperties">
            <props>
                <prop key="mail.transport.protocol">smtp</prop>
                <prop key="mail.smtp.auth">true</prop>
                <prop key="mail.smtp.starttls.enable">true</prop>
                <prop key="mail.debug">true</prop>
                <prop key="mail.smtp.ssl.trust">smtp.gmail.com</prop>
				<prop key="mail.smtp.ssl.protocols">TLSv1.2</prop>
            </props>
        </property>
    </bean>
```
> <small>root-context.xml / bean 설정</small>

```java
@Service
@Log4j
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
    
    @Inject
    private JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입

    @Override
        public String sendMail(String email) {

            ...

            MimeMessage msg = mailSender.createMimeMessage();

            msg.addRecipient(RecipientType.TO, new InternetAddress(email));
            msg.addFrom(new InternetAddress[] { new InternetAddress("email", "name") });

            msg.setSubject("Title", "utf-8");
            msg.setText("Contents", "utf-8");
            mailSender.send(msg);

            ...

    }
}
```
> <small>org.sob.service.LoginServiceImpl.java / sendMail 일부</small>

- HTTP Session을 통한 로그인 관리

```java
@Log4j
@Controller
@AllArgsConstructor
public class LoginController {
	
	private LoginService service;
    
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest httpServletRequest, HttpSession session, Model model) {
		
		...
		
		log.info("로그인 성공");
		session.setAttribute("uvo", user);	// 유저 정보 세션에 저장
		session.setMaxInactiveInterval(30*60);	// 30분동안 지속
		return "redirect:/sob/main";
	}
```
> <small>org.sob.controller.LoginController.java / loginCheck 일부</small>

##### shin-seoung-gyun
- HTTP Session을 통한 유저데이터 관리
```java
@GetMapping("/main")
	public void list(Model model,@SessionAttribute("uvo") UserVO uvo, Criteria cri) {
		if(cri.getCategoryid()==0) {
			cri.setCustomerno(uvo.getCustomerno());
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
			model.addAttribute("list", service.getList(cri));
		} else {
			cri.setCustomerno(uvo.getCustomerno());
			model.addAttribute("categoryList",service.getCategoryList());
			model.addAttribute("pageMaker",new PageDTO(cri,service.getListUseCategoryTotal(cri)));
			model.addAttribute("list", service.getListUseCategory(cri));
		}
	}
```
> <small>org.sob.controller.MainController/ list 일부</small>

- transactional 어노테이션을 활용한 DataBase insert
```xml
<!-- 트랜젝션 매니저 -->
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource"></property>
	</bean>
	
	<!-- @Transactional 어노테이션을 scan하기 위한 설정 -->
	<tx:annotation-driven/>
```
> <small>root-context.xml / transactional 설정</small>

```java
	@Override
	@Transactional
	public void register(MainVO mvo) {
		List<UserVO> uvoList = mapper.getCustomerNo();
		List<Integer> intList = new ArrayList<>();
		int myNo = mvo.getFrom();
		for(int i = 0; i<uvoList.size(); i++) {
			int no = uvoList.get(i).getCustomerno();
			if(myNo==no) {
				continue;
			} else {
				intList.add(no);
			}
		}
		Date date_now = new Date(System.currentTimeMillis()); 
		SimpleDateFormat fourteen_format = new SimpleDateFormat("HHmmss");
		Random rand = new Random(Integer.parseInt(fourteen_format.format(date_now) + myNo));
		
		int result = intList.get(rand.nextInt(uvoList.size()-1));
		mvo.setTo(result);
		
		mapper.bottleInsert(mvo);
		mvo.setLabelid(mapper.selectLabelid());
		mapper.letterInsert(mvo);
		mapper.receivertableInsert(mvo);
		ReplyVO rvo = new ReplyVO();
		rvo.setLabelid(mvo.getLabelid());
		rvo.setCustomerno(myNo);
		mapper.boastInsert(rvo);
	}
```
> <small>org.sov.service.MainServiceImpl / register 일부</small>

- interceptor를 활용한 post전동 후의 돌아가기 기능 으로 인한 중복 방지
```xml
<interceptors> 
<beans:bean id="webContentInterceptor" class="org.springframework.web.servlet.mvc.WebContentInterceptor">
 <beans:property name="cacheSeconds" value="0"/>
 <beans:property name="useExpiresHeader" value="true"/>
 <beans:property name="useCacheControlHeader" value="true"/>
 <beans:property name="useCacheControlNoStore" value="true"/>
</beans:bean>
</interceptors>
```
> <small>servlet-context.xml 의 bean설정</small>
