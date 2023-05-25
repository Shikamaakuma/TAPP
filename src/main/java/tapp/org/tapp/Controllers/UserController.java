package tapp.org.tapp.Controllers;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.Skill;
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

	@Transactional
	@DeleteMapping("/users/{userId}")
	public void deleteUser(@PathVariable Long userId){
		userRepository.deleteById(userId);
	}

	@PostMapping("/{tenantId}/users/{userId}")
	public void updateUser(@PathVariable Long tenantId, @PathVariable Long userId, @RequestBody User user){
		userRepository.updateUser(userId,tenantId,user.getUserName(),user.getPwHash(),user.getImageType(), user.getPicture());
	}
}

