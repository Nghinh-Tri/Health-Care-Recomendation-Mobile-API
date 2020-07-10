package moblie.api.controllers;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import moblie.api.entities.Users;
import moblie.api.services.UsersService;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class UsersController {

	@Autowired
	private UsersService service;

	@GetMapping("/users")
	public List<Users> listUser() {
		return service.listAll();
	}

	@PostMapping("/users/login")
	public ResponseEntity<?> checkLogin(@RequestBody Users users) {
		try {
			if (users.getPhone().trim().length() > 0 && users.getPasswords().trim().length() > 0) {
				Users find = service.login(users.getPhone(), users.getPasswords());
				if (find != null)
					return new ResponseEntity<Users>(find, HttpStatus.OK);
				else
					throw new Exception();
			}
			throw new NoSuchElementException();

		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

	}

	@PostMapping("/users/signUp")
	public ResponseEntity<?> signUp(@RequestBody Users users) {
		try {
			Users find = service.isExist(users.getPhone());
			if (find == null) {
				users.setRoles("user");
				service.save(users);
				return new ResponseEntity<Users>(HttpStatus.OK);
			}
			return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
		}

	}

	@PutMapping("/users/{phone}")
	public ResponseEntity<?> editDetail(@RequestBody Users users, @PathVariable String phone) {
		try {
			Users find = service.isExist(phone);
			if (find != null) {
				users.setPhone(phone);
				service.save(users);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
