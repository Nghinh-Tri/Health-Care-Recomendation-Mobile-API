package moblie.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moblie.api.entities.Ratings;
import moblie.api.repositories.RatingsRespository;

@Service
public class RatingsService {

	@Autowired
	private RatingsRespository ratingsRespository;
	
	public void save(Ratings rating) {
		ratingsRespository.save(rating);
	}
	
	public List<Ratings> getListRatingsByFacilityID(int facilityID){
		return ratingsRespository.getListRatingsByFacilityID(facilityID);
	}
	
	public Ratings isExist(String phone, int facilityID) {
		return ratingsRespository.isExist(phone, facilityID);
	}
}
