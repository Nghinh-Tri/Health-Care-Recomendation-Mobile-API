package moblie.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moblie.api.entities.Ratings;
import moblie.api.repositories.RatingsRespository;

@Service
public class RatingsService {

	@Autowired
	private RatingsRespository respository;
	
	public void save(Ratings rating) {
		respository.save(rating);
	}
	
	public List<Ratings> loadRatings(int facilityID){
		return respository.loadRatings(facilityID);
	}
	
	public Ratings isExist(String phone, int facilityID) {
		return respository.isExist(phone, facilityID);
	}
}
