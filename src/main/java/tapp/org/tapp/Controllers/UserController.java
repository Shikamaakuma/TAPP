package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.Models.User;
import tapp.org.tapp.Repository.UserRepository;

import java.util.List;

/**
 * Skeleton class for user controller
 */
@RestController
@RequestMapping("/api/v1/")
public class UserController {
	@Autowired
	private UserRepository userRepository;

	/**
	 * Returns all users
	 * @return users
	 */
	@GetMapping("/users")
	public List<User> getAllUsers(){
		return userRepository.findAll();
	}

	/**
	 * Adds a new user
	 * @param user
	 * @return newly added user
	 */
	@PostMapping("/add_user")
	public User addUser(@RequestBody User user) {
		return userRepository.save(user);
	}
}

