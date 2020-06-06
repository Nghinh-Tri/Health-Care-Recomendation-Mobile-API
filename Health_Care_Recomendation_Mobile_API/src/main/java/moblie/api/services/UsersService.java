package moblie.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moblie.api.entities.Users;
import moblie.api.repositories.UsersRepository;

@Service
public class UsersService {

	@Autowired
	private UsersRepository usersRepository;
	
	public List<Users> listAll() {
		return usersRepository.findAll();
	}
	
	public Users login (String phone, String password) {
		return usersRepository.checkLogin(phone, password);
	}
}
