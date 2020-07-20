package moblie.api.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import moblie.api.entities.Ratings;

@Repository
public interface RatingsRespository extends JpaRepository<Ratings, String> {
	
	@Query(value="select * from ratings r where r.facility_id=?1 order by r.id desc limit 3", nativeQuery = true)
	List<Ratings> getListRatingsByFacilityID(int facilityID);
	
	@Query(value="select * from ratings r where r.user_id=?1 and r.facility_id=?2", nativeQuery = true)
	Ratings isExist(String phone, int facilityID);	
}
