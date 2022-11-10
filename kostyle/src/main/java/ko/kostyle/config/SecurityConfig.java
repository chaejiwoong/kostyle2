package ko.kostyle.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//    private final TokenProvider tokenProvider;
    private final CustomAuthenticationEntryPoint customAuthenticationEntryPoint;
    private final CustomAccessDeniedHandler customAccessDeniedHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("favicon.ico","/resources/**", "/commons/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // CSRF 설정 Disable
        http
                .csrf().disable()

                // exception handling 할 때 우리가 만든 클래스를 추가
                .exceptionHandling()
                .authenticationEntryPoint(customAuthenticationEntryPoint)
                .accessDeniedHandler(customAccessDeniedHandler)

                .and()
                .authorizeRequests()
                // 로그인 관련
                .antMatchers("/auth/**").permitAll()
                // 회원 관련
                .antMatchers("/members/**").authenticated()

                // 관리자 관련
                .antMatchers("/admin/**").hasRole("ADMIN")           
                
                // 경매 관련
                .antMatchers("/auctions/attention/**").authenticated()
                .antMatchers("/auctions/**").permitAll()
                
                // 입찰 관련
                .antMatchers("/bids/**").authenticated()
                
                // 장바구니 관련
                .antMatchers("/shop/**").authenticated()
                
                // 주문 관련
                .antMatchers("/orders/**").authenticated()
                
                // 메인 페이지
                .antMatchers("/main/**").permitAll()
                
                // 리뷰 관련
                .antMatchers("/reviews/**").authenticated()
                
                //문의사항 관련
                .antMatchers("/customerCenter/register").authenticated()
                .antMatchers("/customerCenter/answerdetail").authenticated()
                .antMatchers("/customerCenter/insert").authenticated()
                .antMatchers("/customerCenter/**").permitAll()
                
                // 코디 관련
                .antMatchers("/coordies/register").authenticated()
               // .antMatchers("/coordies/like").hasAnyRole("ADMIN", "USER")
                .antMatchers("/coordies/**").permitAll()
                .antMatchers("/coordiComments/**").permitAll()
                
                //.antMatchers("/coordiComments/register").authenticated()

                
                .anyRequest().authenticated(); 

    }
}
