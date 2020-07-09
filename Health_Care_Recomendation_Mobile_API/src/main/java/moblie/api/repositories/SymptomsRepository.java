package moblie.api.repositories;

import moblie.api.entities.Symptoms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SymptomsRepository extends JpaRepository<Symptoms, Integer> {

    @Query(value = "Select * from symptoms where translation like %?1%", nativeQuery = true)
    List<Symptoms> getListSymptomsByName(String symptom);
}
