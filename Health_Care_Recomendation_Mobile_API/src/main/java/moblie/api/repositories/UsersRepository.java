package moblie.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import moblie.api.entities.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, String>{
	
	@Query(value="Select * from users u where u.phone=?1 and u.passwords=?2", nativeQuery = true)
	Users checkLogin(String phone,String passwords);
	
	@Query(value="Select * from users u where u.phone=?1", nativeQuery = true)
	Users isExist(String phone);
}
