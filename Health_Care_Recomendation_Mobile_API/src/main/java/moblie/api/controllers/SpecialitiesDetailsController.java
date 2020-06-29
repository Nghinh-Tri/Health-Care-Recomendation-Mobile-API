package moblie.api.controllers;

import moblie.api.entities.Specialitiesdetails;
import moblie.api.services.SpecialitiesDetailsService;
import moblie.api.services.SpecialityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class SpecialitiesDetailsController {
    @Autowired
    private SpecialitiesDetailsService specialitiesDetailsService;

    @PostMapping("/specialities-details")
    public ResponseEntity<?> getSpecialityBySymptom(@RequestBody Specialitiesdetails specialitiesdetails){
        try {
            List<Specialitiesdetails> result = specialitiesDetailsService.getSpecialityBySymptom(specialitiesdetails.getSymptom_id());
            if (result != null)
                return new ResponseEntity<List<Specialitiesdetails>>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
