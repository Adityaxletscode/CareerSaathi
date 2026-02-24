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
			model.addAttribute("success","Login Successful! Redirecting...");
			
			// Set redirect URL based on role
			if(user.getRole().equalsIgnoreCase("CONSULTEE")) {
				model.addAttribute("redirectUrl", "/consultee/dashboard");
			} else if(user.getRole().equalsIgnoreCase("CONSULTOR")) {
				model.addAttribute("redirectUrl", "/consultor/dashboard");
			} else {
				model.addAttribute("redirectUrl", "/test");
			}
			
			return "login";
			
		}catch (Exception e) {
			System.out.println("Exception : "+e);
			model.addAttribute("error",e.getMessage());
			return "error";
		}
	}
	
	// Consultee Dashboard Routes
	@GetMapping("/consultee/dashboard")
	public String consulteeDashboard(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) {
			return "redirect:/login";
		}
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "dashboard");
		return "consultee_dashboard";
	}

	@GetMapping("/consultee/assessment")
	public String consulteeAssessment(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "assessment");
		return "consultee_assessment";
	}

	@GetMapping("/consultee/mentors")
	public String consulteeMentors(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "mentors");
		return "consultee_mentors";
	}

	@GetMapping("/consultee/sessions")
	public String consulteeSessions(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "sessions");
		return "consultee_sessions";
	}

	@GetMapping("/consultee/chat")
	public String consulteeChat(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "chat");
		return "consultee_chat";
	}

	@GetMapping("/consultee/profile")
	public String consulteeProfile(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTEE")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "profile");
		return "consultee_profile";
	}

	@GetMapping("/consultor/dashboard")
	public String consultorDashboard(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) {
			return "redirect:/login";
		}
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "dashboard");
		return "consultor_dashboard";
	}

	@GetMapping("/consultor/profile")
	public String consultorProfile(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "profile");
		return "consultor_profile";
	}

	@GetMapping("/consultor/availability")
	public String consultorAvailability(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "availability");
		return "consultor_availability";
	}

	@GetMapping("/consultor/requests")
	public String consultorRequests(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "requests");
		return "consultor_requests";
	}

	@GetMapping("/consultor/sessions")
	public String consultorSessions(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "sessions");
		return "consultor_sessions";
	}

	@GetMapping("/consultor/analytics")
	public String consultorAnalytics(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "analytics");
		return "consultor_analytics";
	}

	@GetMapping("/consultor/reviews")
	public String consultorReviews(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "reviews");
		return "consultor_reviews";
	}

	@GetMapping("/consultor/earnings")
	public String consultorEarnings(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "earnings");
		return "consultor_earnings";
	}

	@GetMapping("/consultor/chat")
	public String consultorChat(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null || !user.getRole().equalsIgnoreCase("CONSULTOR")) return "redirect:/login";
		model.addAttribute("user", user);
		model.addAttribute("activeTab", "chat");
		return "consultor_chat";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/login";
	}
	@GetMapping("/test")
	public String test(HttpSession session , Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "test";
	}
}