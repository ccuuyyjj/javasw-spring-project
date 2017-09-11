package spring.settings;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
@Configuration
public class SecuritySettings extends WebSecurityConfigurerAdapter {
	@Autowired
	private BasicDataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.inMemoryAuthentication()
				.withUser("admin")
					.password("admin")
					.roles("ADMIN");
		auth
			.jdbcAuthentication()
				.dataSource(dataSource)
				.usersByUsernameQuery("select username, password, enabled from member where username = ?")
				.authoritiesByUsernameQuery("select username, authority from member where username = ?");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.anyRequest()
					.permitAll()
				.and()
			.formLogin()
				.and()
			.csrf()
				.disable();
	}
}
