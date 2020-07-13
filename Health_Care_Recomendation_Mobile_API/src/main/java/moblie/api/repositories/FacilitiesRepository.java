package moblie.api.repositories;

import moblie.api.entities.Facilities;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FacilitiesRepository extends JpaRepository<Facilities,Integer> {
    @Query(value = "select * from facilities where id = ?1", nativeQuery = true)
    Facilities getFacilitiesById(int id);    
}
