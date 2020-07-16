package moblie.api.controllers;

import moblie.api.entities.Facilitiesdetails;
import moblie.api.services.FacilitiesDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class FacilitiesDetailsController {
    @Autowired
    private FacilitiesDetailsService facilitiesDetailsService;

    @GetMapping("/facilities-details/speciality/{id}")
    public ResponseEntity<?> getFacilitiesBySpeciality(@PathVariable String id){
        try{
            Map<String,List<Facilitiesdetails>> result = new HashMap<>();
            List<Facilitiesdetails> listFacilitiesDetails = facilitiesDetailsService.getFacilitiesBySpeciality(Integer.parseInt(id));
            if (listFacilitiesDetails != null){
                result.put("details", listFacilitiesDetails);
                return new ResponseEntity<Map<String,List<Facilitiesdetails>>>(result, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/facilities-details/symptom/{id}")
    public ResponseEntity<?> getFacilitiesBySimptom(@PathVariable String id){
        try{
            Map<String,List<Facilitiesdetails>> result = new HashMap<>();
            List<Facilitiesdetails> listFacilitiesDetails = facilitiesDetailsService.getFacilitiesBySimptom(Integer.parseInt(id));
            if (listFacilitiesDetails != null){
                result.put("details", listFacilitiesDetails);
                return new ResponseEntity<Map<String,List<Facilitiesdetails>>>(result, HttpStatus.OK);                
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
