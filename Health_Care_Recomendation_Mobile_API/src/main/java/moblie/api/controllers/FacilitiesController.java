package moblie.api.controllers;

import moblie.api.entities.Facilities;
import moblie.api.services.FacilitiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class FacilitiesController {
    @Autowired
    private FacilitiesService facilitiesService;

    @PostMapping("/facilities")
    public ResponseEntity<?> getFacility(@RequestBody Facilities facilities){
        try {
            Facilities result = facilitiesService.getFacilityById(facilities.getId());
            if(result != null)
                return new ResponseEntity<Facilities>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
