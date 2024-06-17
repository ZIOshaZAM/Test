package spring.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.dto.UserDTO;
import spring.model.UserBean;
import spring.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	ModelMapper mapper;

	@Autowired
	UserRepository userRepo;

	@GetMapping(value = "/register")
	public ModelAndView showRegister() {
		return new ModelAndView("register", "user", new UserBean());
	}

	@PostMapping(value = "/doregister")
	public String insertUser(@ModelAttribute("user") UserBean user, Model model) {

		UserDTO dto = mapper.map(user, UserDTO.class);

		/*
		 * UserDTO dto = new UserDTO(); dto.setName(user.getName());
		 * dto.setEmail(user.getEmail()); dto.setPassword(user.getPassword());
		 */
		int i = userRepo.insertUser(dto);
		if (i > 0) {
			return "redirect:../login";
		} else {
			model.addAttribute("insertError", "Insert failed");
			return "redirect:/user/register";
		}
	}

	@GetMapping(value = "/showusers")
	public String showAllUsers(Model m) {
		List<UserDTO> userListDTO = userRepo.showAllUsers();

		List<UserBean> userList = userListDTO.stream().map(dto -> mapper.map(dto, UserBean.class))
				.collect(Collectors.toList());

		m.addAttribute("userlist", userList);
		return "userList";
	}
}
