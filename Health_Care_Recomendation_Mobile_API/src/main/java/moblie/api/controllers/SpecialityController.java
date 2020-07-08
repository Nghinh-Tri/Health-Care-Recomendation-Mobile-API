package moblie.api.controllers;

import moblie.api.entities.Specialities;
import moblie.api.entities.Symptoms;
import moblie.api.services.SpecialityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class SpecialityController {
    @Autowired
    private SpecialityService specialityService;

    @PostMapping("/specialities")
    public ResponseEntity<?> searchSpecialitiesByName(@RequestBody Specialities specialities) {
        try {
            List<Specialities> result = specialityService.getListSpecialitiesByName(specialities.getSpeciality());
            if (result != null)
                return new ResponseEntity<List<Specialities>>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
