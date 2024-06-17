package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.dto.LoginDTO;
import spring.dto.UserDTO;
import spring.repository.UserRepository;

@Controller
public class LoginController {
	
	@Autowired
	UserRepository userRepo;
	
	@GetMapping({"/","/login"})
	public String loginForm() {
		return"login";
	}
	
	 @PostMapping("/login")
	    public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO, ModelMap model) {

	        String email = loginDTO.getEmail();
	        String password = loginDTO.getPassword();

	        UserDTO user = userRepo.findByUserEmail(email);

	        if (user != null && password.equals(user.getPassword())) {
	            return "redirect:/user/showusers";
	        } else {
	            model.addAttribute("message", "Invalid User Email or Password!!");
	            return "login";
	        }
	    }
	}

