package moblie.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moblie.api.entities.Recommendations;
import moblie.api.repositories.RecommendationsRespository;

@Service
public class RecommendationsService {

	@Autowired
	private RecommendationsRespository respository;

	public void save(Recommendations recommendation) {
		respository.save(recommendation);
	}
	
	public List<Recommendations> getRecommendations(String userPhone) {
		return respository.getRecommendations(userPhone);
	}
	
	public void changeRecommendationsStatus(String userPhone) {
		respository.changeRecommendationsStatus(userPhone);
	}
}
