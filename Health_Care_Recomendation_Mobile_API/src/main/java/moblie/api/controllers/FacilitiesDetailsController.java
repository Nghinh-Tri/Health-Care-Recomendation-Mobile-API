package moblie.api.controllers;

import moblie.api.entities.Facilitiesdetails;
import moblie.api.services.FacilitiesDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class FacilitiesDetailsController {
    @Autowired
    private FacilitiesDetailsService facilitiesDetailsService;

    @PostMapping("/facilities-details/speciality")
    public ResponseEntity<?> getFacilitiesBySpeciality(@RequestBody Facilitiesdetails facilitiesdetails){
        try{
            List<Facilitiesdetails> result = facilitiesDetailsService.getFacilitiesBySpeciality(facilitiesdetails.getSpeciality_id());
            if (result != null)
                return new ResponseEntity<List<Facilitiesdetails>>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/facilities-details/symptom")
    public ResponseEntity<?> getFacilitiesBySimptom(@RequestBody Facilitiesdetails facilitiesdetails){
        try{
            List<Facilitiesdetails> result = facilitiesDetailsService.getFacilitiesBySimptom(facilitiesdetails.getSymptom_id());
            if (result != null)
                return new ResponseEntity<List<Facilitiesdetails>>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
