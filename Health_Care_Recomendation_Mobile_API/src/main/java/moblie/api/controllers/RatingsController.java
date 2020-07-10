package moblie.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

	@PostMapping("/ratings")
	public ResponseEntity<?> loadComments(@RequestBody Ratings rating) {
		try {
			if (rating.getFacility_id() > 0) {
				List<Ratings> ratings = service.loadRatings(rating.getFacility_id());
				if (!ratings.isEmpty()) {
					return new ResponseEntity<List<Ratings>>(ratings, HttpStatus.OK);
				}
				throw new Exception();
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/rate")
	public ResponseEntity<?> rate(@RequestBody Ratings rating) {
		try {
			if (rating.getRate() > 0 && rating.getUser_id().trim().length() > 0 && rating.getFacility_id() > 0) {
				service.save(rating);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/ratings/{information}")
	public ResponseEntity<?> editRating(@RequestBody Ratings rating, @PathVariable String information) {
		try {
			int pos = -1;
			for (int i = 0; i < information.length(); i++) {
				if (information.charAt(i) == '&')
					pos = i;
			}
			String phone = information.substring(0, pos);
			int facilityID = Integer.parseInt(information.substring(pos + 1, information.length()));
			Ratings find = service.isExist(phone, facilityID);
			if (find != null) {
				rating.setId(find.getId());
				rating.setUser_id(phone);
				rating.setFacility_id(facilityID);
				rating.setRate(rating.getRate());
				service.save(rating);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
