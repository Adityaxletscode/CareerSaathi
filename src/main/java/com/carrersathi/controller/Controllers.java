package com.carrersathi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrersathi.dao.UserDao;
import com.carrersathi.entities.User;

import jakarta.servlet.http.HttpSession;


@Controller
public class Controllers{
	@Autowired
	private UserDao userDao;
	@GetMapping("/")
	public String root() {
		return "home";
	}
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	@GetMapping("/whatwedo")
	public String whatwedo() {
		return "whatwedo";
	}
	@GetMapping("/contactus")
	public String contactus() {
		return "contactus";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	@GetMapping("/signupconsultee")
	public String signUpConsultee() {
		return "signupconsultee";
	}
	@GetMapping("/signupconsultor")
	public String signUpConsultor() {
		return "signupconsultor";
	}
	@PostMapping("/processformconsultee")
	public String signupconsulteeform(@RequestParam String name,
									  @RequestParam String email,
									  @RequestParam String phone_no,
									  @RequestParam String password,
									  Model model,
									  HttpSession session) {
		String emailRegex = "^[A-Za-z0-9._%+-]+@gmail\\.com$";
		String phoneRegex = "^[6-9][0-9]{9}$";
		if(!email.matches(emailRegex)) {
			model.addAttribute("error", "Invalid email address!");
			return "signupconsultee";
		}
		if(!phone_no.matches(phoneRegex)) {
			model.addAttribute("error","Invalid phone number!");
			return "signupconsultee";
		}
		User user1 = userDao.getUserByEmailOrPhone(email, phone_no);
		if(user1!=null) {
			model.addAttribute("error","User already exist!");
			return "signupconsultee";
		}
		try {
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhoneNo(phone_no);
			user.setPassword(password);
			user.setRole("CONSULTEE");
			// model.addAttribute("user", user);
			int result = userDao.saveUser(user);
			if(result>0) {
				System.out.println("User saved Successfully . . . ");
				session.setAttribute("user", user);
				model.addAttribute("success","Redirecting to main page . . . .");
				return "signupconsultee";
			}else {
				model.addAttribute("error","user cannot be saved\n Server Side error. . . ");
				return "error";
			}
			
		}catch (Exception e) {
			System.out.println("Exception : "+e);
			model.addAttribute("error", e.getMessage());
		    return "error";
		}
		
	}
	@PostMapping("/processformconsultor")
	public String signupconsultorForm(@RequestParam String name,
									  @RequestParam String email,
									  @RequestParam String phone_no,
									  @RequestParam String password,
									  @RequestParam String specialization,
									  @RequestParam Integer experience,
									  Model model,
									  HttpSession session) {
		String emailRegex = "^[A-Za-z0-9._%+-]+@gmail\\.com$";
		String phoneRegex = "^[6-9][0-9]{9}$";
		if(!email.matches(emailRegex)) {
			model.addAttribute("error", "Invalid email address!");
			return "signupconsultor";
		}
		if(!phone_no.matches(phoneRegex)) {
			model.addAttribute("error", "Invalid phone number!");
			return "signupconsultor";
		}
		User user1 = userDao.getUserByEmailOrPhone(email, phone_no);
		if(user1!=null) {
			model.addAttribute("error", "User already exist!");
			return "signupconsultor";
		}
		try {
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhoneNo(phone_no);
			user.setPassword(password);
			user.setSpecialization(specialization);
			user.setExperience(experience);
			user.setRole("CONSULTOR");
			
			int result = userDao.saveUser(user);
			if(result>0) {
				System.out.println("user consultor saved successfully ");
				// model.addAttribute("user", user);
				session.setAttribute("user", user);
				model.addAttribute("success","Redirecting to main page . . . ");
				return "signupconsultor";
			}else {
				model.addAttribute("error","something went wrong on the server side");
				return "error";
			}
			
		}catch (Exception e) {
			System.out.println("Exception : "+e);
			model.addAttribute("error", e.getMessage());
		    return "error";
		}
	}
	@PostMapping("/processloginform")
	public String prcoessloginform(@RequestParam String emailOrPhone,
								   @RequestParam String password,
								   @RequestParam String role,
								   HttpSession session,
								   Model model) {
		User user = userDao.getUserByEmailOrPhone(emailOrPhone, emailOrPhone);
		if(user==null) {
			model.addAttribute("error","User not found!");
			return "login";
		}
		try {
			if(!user.getPassword().equals(password)) {
				model.addAttribute("error","Invalid password!");
				return "login";
			}
			if(!user.getRole().equalsIgnoreCase(role)) {
				model.addAttribute("error","Invalid role selected!");
				return "login";
			}
			session.setAttribute("user", user);
			model.addAttribute("success","Redirecting to main page . . . . ");
			return "login";
			
		}catch (Exception e) {
			System.out.println("Exception : "+e);
			model.addAttribute("error",e.getMessage());
			return "error";
		}
	}
	@GetMapping("/test")
	public String test(HttpSession session , Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "test";
	}
}