package moblie.api.repositories;

import moblie.api.entities.Specialitiesdetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpecialitiesDetailsRepository extends JpaRepository<Specialitiesdetails,Integer> {
    @Query(value = "select * from specialitiesdetails where symptom_id = ?1 and status = 1",nativeQuery = true)
    List<Specialitiesdetails> getSpecialitiesdetailsBySymptom(int id);
}
