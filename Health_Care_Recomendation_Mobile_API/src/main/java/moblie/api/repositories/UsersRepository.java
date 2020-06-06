package moblie.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import moblie.api.entities.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, String>{
	
	@Query(value="Select fullname from users where phone=:phone and passwords=:passwords", nativeQuery = true)
	public Users checkLogin(@Param("phone") String phone, @Param("passwords") String passwords);
}
