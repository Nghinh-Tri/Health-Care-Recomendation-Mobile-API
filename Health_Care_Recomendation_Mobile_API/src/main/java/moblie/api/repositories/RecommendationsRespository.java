package moblie.api.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moblie.api.entities.Recommendations;

@Repository
public interface RecommendationsRespository extends JpaRepository<Recommendations, String> {
	
	@Query(value="Select * from recommendations r where r.suggested_phone=?1 and r.status=0", nativeQuery = true)
	public List<Recommendations> getRecommendations(String suggestedPhone);
	
	@Modifying
	@Transactional
	@Query(value="Update recommendations r set r.status=1 where r.suggested_phone=?1 and r.status=0", nativeQuery = true)
	public void changeRecommendationsStatus(String suggestedPhone);
}
