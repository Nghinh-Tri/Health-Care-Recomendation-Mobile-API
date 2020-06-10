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
	
	public Users login (String phone, String passwords){
		return usersRepository.checkLogin(phone,passwords);
	}
	
	public Users isExist(String phone) {
		return usersRepository.isExist(phone);
	}
	
	public Users getByID(String id) {
		return usersRepository.findById(id).get();
	}
	
	public void save(Users users) {
		usersRepository.save(users);
	}	
}
