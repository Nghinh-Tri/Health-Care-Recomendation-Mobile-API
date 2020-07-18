package moblie.api.controllers;

import moblie.api.entities.Facilities;
import moblie.api.services.FacilitiesService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/facilities/{id}")
    public ResponseEntity<?> getFacility(@PathVariable int id){
        try {
            Facilities facility = facilitiesService.getFacilityById(id);
            if(facility != null){
                return new ResponseEntity<Facilities>(facility, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value="/facilities")
    public ResponseEntity<?> getAllFacility() {
        try {
            Map<String, List<Facilities>> result = new HashMap<>();
            List<Facilities> listFacilities = facilitiesService.getAllFacilities();
            if(listFacilities != null){
                result.put("facilities", listFacilities);
                return new ResponseEntity<Map<String, List<Facilities>>>(result, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
