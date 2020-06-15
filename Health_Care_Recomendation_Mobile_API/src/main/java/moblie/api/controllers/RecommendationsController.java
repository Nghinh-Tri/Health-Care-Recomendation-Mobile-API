package moblie.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import moblie.api.entities.Recommendations;
import moblie.api.services.RecommendationsService;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class RecommendationsController {

	@Autowired
	private RecommendationsService service;

	@PostMapping("/recommend")
	public ResponseEntity<?> recommend(@RequestBody Recommendations recommendation) {
		try {
			if (recommendation.getSuggesterPhone().trim().length() > 0
					&& recommendation.getSuggestedPhone().trim().length() > 0 && recommendation.getFacility_id() > 0) {
				service.save(recommendation);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/recommendations")
	public ResponseEntity<?> checkForRecommendations(@RequestBody Recommendations recommendation) {
		try {
			if (recommendation.getSuggestedPhone().trim().length() > 0) {
				String userPhone = recommendation.getSuggestedPhone();
				List<Recommendations> recommendations = service.getRecommendations(userPhone);
				System.out.print(recommendations.isEmpty());
				if (!recommendations.isEmpty()) {
					return new ResponseEntity<List<Recommendations>>(recommendations, HttpStatus.OK);
				}
				throw new Exception();
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/changeRecommendationsStatus")
	public ResponseEntity<?> changeStatus(@RequestBody Recommendations recommendation) {
		try {
			if (recommendation.getSuggestedPhone().trim().length() > 0) {
				String userPhone = recommendation.getSuggestedPhone();
				service.changeRecommendationsStatus(userPhone);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			throw new Exception();
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
