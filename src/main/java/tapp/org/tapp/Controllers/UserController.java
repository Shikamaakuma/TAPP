package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.User;
import tapp.org.tapp.Repository.UserRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class UserController {
	@Autowired
	private UserRepository userRepository;

	@GetMapping("/users")
	public List<User> getAllUsers(){
		return userRepository.findAll();
	}

	@PostMapping("/add_user")
	public User addUser(@RequestBody User user) {
		return userRepository.save(user);
	}
}

