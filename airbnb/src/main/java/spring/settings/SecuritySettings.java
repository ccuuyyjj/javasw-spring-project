package spring.settings;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@EnableWebSecurity
@Configuration
public class SecuritySettings extends WebSecurityConfigurerAdapter {

	@Autowired
	private BasicDataSource dataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select email, pw, enabled from member where email = ?")
				.authoritiesByUsernameQuery("select email, authority from member where email = ?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/host/**", "/mypage/**", "/sub/message/**").authenticated()
				// .antMatchers("/권한설정 필요한 URL**")
				// .authenticated() //모든 인증된 사용자
				// .hasRole("권한명") // 사용자 보유 권한
				.anyRequest().permitAll().and()

				.formLogin().successHandler(successHandler()).loginProcessingUrl("/loginProc")
				.usernameParameter("email").passwordParameter("pw").loginPage("/member/login").and()

				.csrf().disable();
	}

	@Bean
	public AuthenticationSuccessHandler successHandler() {

	    return new CustomLoginSuccessHandler("/");
	}

}
