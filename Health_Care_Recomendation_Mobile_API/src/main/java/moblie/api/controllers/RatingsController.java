package moblie.api.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import moblie.api.entities.Ratings;
import moblie.api.services.RatingsService;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class RatingsController {

	@Autowired
	private RatingsService service;

	//load list rating by fac id
	@GetMapping("/ratings/{facilityId}")
	public ResponseEntity<?> getListRatingOfFacility(@PathVariable String facilityId){
		try {
			Map<String,List<Ratings>> result = new HashMap<>();
			List<Ratings> list = service.getListRatingsByFacilityID(Integer.parseInt(facilityId));
			if (list != null){
				result.put("ratings", list);				
				return new ResponseEntity<Map<String,List<Ratings>>>(result,HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	//insert rating 
	@PostMapping("/ratings")
	public ResponseEntity<?> insertRating(@RequestBody Ratings rating) {
		try {			
			Ratings find = service.isExist(rating.getUser_id(), rating.getFacility_id());
			if (find == null) {				
				service.save(rating);
				return new ResponseEntity<>(HttpStatus.OK);
			}else{
				rating.setId(find.getId());
				service.save(rating);;
				return new ResponseEntity<>(HttpStatus.OK);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
