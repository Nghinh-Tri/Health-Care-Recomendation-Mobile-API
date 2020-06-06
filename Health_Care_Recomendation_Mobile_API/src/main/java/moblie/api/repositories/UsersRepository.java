package moblie.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import moblie.api.entities.Users;

public interface UsersRepository extends JpaRepository<Users, String>{

}
