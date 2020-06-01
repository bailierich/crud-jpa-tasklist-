package co.grandcircus.capstone6.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.capstone6.Task;
import co.grandcircus.capstone6.User;
import co.grandcircus.capstone6.dao.TaskRepository;
import co.grandcircus.capstone6.dao.UserRepository;


@Controller
public class LoginController {
	
	@Autowired
	private HttpSession sesh;
	
	@Autowired
	private UserRepository uRepo;
	
	@Autowired
	private TaskRepository tRepo;
	
	
	
	@RequestMapping("/")
	public String home() {
		
		return "redirect:/login";
		
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/login/submit")
	public String submitForm(@RequestParam("email") String email,
			@RequestParam String password, Model model,
			RedirectAttributes redir) {
		
		
		User user = uRepo.findByEmail(email);
		
		
		
		if(user == null || !password.equals(user.getPassword())) {
			
			model.addAttribute("message","Incorrect username or password");
			return "login";
			
		}
		
		sesh.setAttribute("user", user);
		
		redir.addFlashAttribute("message", "Logged you in, " + user.getfName());
		return "redirect:/tasks";
	}
	
	
	@RequestMapping("/signup")
	public String signUpForm() {
		
		return "signup-form";
	}
	
	
	@RequestMapping("/signup/submit")
	public String signUpSubmit(User user) {
				
		uRepo.save(user);
		
		return "redirect:/login";
	}
	
	
	@RequestMapping("/tasks")
	public String displayTaskList(Model model) {
		User user = (User) sesh.getAttribute("user");
		
		List<Task> userTaskList = tRepo.findByUserId(user.getId());
		
		model.addAttribute("taskList",userTaskList);
		
		return "tasklist";
	}
	
	@RequestMapping("/tasks/{id}")
	public String markTaskComplete(@PathVariable ("id") Long id){
		Task task = tRepo.findById(id).orElse(null);
		
		task.setCompleted(true);
		tRepo.save(task);
		return "redirect:/tasks";
		
	}
	
	@RequestMapping("/tasks/add")
	public String addTask(){
	
		
		return "addtask";
		

		
	}
	
	@RequestMapping("/tasks/delete/{id}")
	public String deleteTask(@PathVariable ("id") Long id){
	
		tRepo.deleteById(id);
		
		return "redirect:/tasks";
		

		
	}
	
	@PostMapping("/tasks/add")
	public String submitNewTask(Task task) {
		User user = (User) sesh.getAttribute("user");
		task.setUser(user);
		
		tRepo.save(task);
		uRepo.save(user);
		return "redirect:/tasks";
	}
	
	@RequestMapping("/tasks/edit-delete/{id}")
	public String editOrDeleteTask(@PathVariable ("id") Long id, Model model){
		Task task = tRepo.findById(id).orElse(null);
		
		model.addAttribute("task",task);	
		return "task-edit-or-delete";
	}
	
	@PostMapping("/tasks/edit-delete")
	public String editTask(Task task){
		User user = (User) sesh.getAttribute("user");
		
		task.setUser(user);
		
		tRepo.save(task);
		
		
		return "redirect:/tasks";
	}
	
	@RequestMapping("/logout")
	public String logout(RedirectAttributes redir) {
		
		redir.addFlashAttribute("message","Logged out successfully");
		
		sesh.invalidate();
		
		return "redirect:/login";
	}
	
	
	
	

}
