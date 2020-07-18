package moblie.api.repositories;

import moblie.api.entities.Facilities;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FacilitiesRepository extends JpaRepository<Facilities,Integer> {
    @Query(value = "select * from facilities where id = ?1", nativeQuery = true)
    Facilities getFacilitiesById(int id);    

    @Query(value = "select id, name, address, phone, latitude, longtitude, null as image from facilities", nativeQuery = true)
    List<Facilities> getFacilities();    
}
