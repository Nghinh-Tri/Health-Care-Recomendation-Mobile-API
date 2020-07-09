package moblie.api.repositories;

import moblie.api.entities.Facilitiesdetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FacilitiesDetailsRepository extends JpaRepository<Facilitiesdetails,Integer> {

    @Query(value = "select * from facilitiesdetails where speciality_id = ?1",nativeQuery = true)
    List<Facilitiesdetails> getFacilitiesBySpeciality(int specialityID);

    @Query(value = "select * from facilitiesdetails where symptom_id = ?1",nativeQuery = true)
    List<Facilitiesdetails> getFacilitiesBySymptom(int simptomID);
}
