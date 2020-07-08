package moblie.api.repositories;

import moblie.api.entities.Specialities;
import moblie.api.entities.Symptoms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpecialitiesRepository extends JpaRepository<Specialities,Integer> {
    @Query(value = "Select * from specialities where speciality like %?1% and status = 1", nativeQuery = true)
    List<Specialities> getListSpecialitiesByName(String speciality);
}
