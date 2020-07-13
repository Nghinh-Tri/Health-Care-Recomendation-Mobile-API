package moblie.api.controllers;

import moblie.api.entities.Facilities;
import moblie.api.entities.UserLocation;
import moblie.api.services.FacilitiesService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


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

    @GetMapping(value="/facilities")
    public ResponseEntity<?> getFacilityEmergency() {
        try {
            Map<String, List<Facilities>> map = new HashMap();
            List<Facilities> result = facilitiesService.getAllFacilities();
            map.put("result", result);
            if(result != null)
                return new ResponseEntity<Map<String, List<Facilities>>>(map, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
}
