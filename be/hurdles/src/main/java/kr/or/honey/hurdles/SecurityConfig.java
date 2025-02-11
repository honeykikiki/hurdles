package kr.or.honey.hurdles;

//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .csrf(csrf -> csrf.disable())  // CSRF 비활성화 (필요시 활성화)
//                .authorizeHttpRequests(auth -> auth
//                        .requestMatchers("/api/login", "/api/logout").permitAll() // 로그인, 로그아웃은 누구나 접근 가능
//                        .anyRequest().authenticated()
//                )
//                .formLogin(login -> login.disable()) // 기본 로그인 폼 사용 안 함
//                .sessionManagement(session -> session
//                        .maximumSessions(1) // 하나의 세션만 유지
//                        .maxSessionsPreventsLogin(false) // 새로운 로그인 시 기존 세션 무효화
//                );
//
//        return http.build();
//    }
//}
//
