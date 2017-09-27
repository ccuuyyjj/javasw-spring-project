package spring.error;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;

@Component
@ControllerAdvice("spring.controller")
public class ErrorHandler {
	// @ExceptionHandler(Exception.class)
	public String other() {
		return "error/other";
	}
}
