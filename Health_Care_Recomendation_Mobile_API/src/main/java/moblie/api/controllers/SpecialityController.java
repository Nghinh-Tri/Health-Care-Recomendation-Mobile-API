package moblie.api.controllers;

import moblie.api.entities.Specialities;
import moblie.api.services.SpecialityService;
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
public class SpecialityController {
    @Autowired
    private SpecialityService specialityService;

    @GetMapping("/specialities")
    public List<Specialities> listSymptom() {
        return specialityService.listAll();
    }

    @PostMapping("/specialities")
    public ResponseEntity<?> searchSpecialitiesByName(@RequestBody Specialities specialities) {
        try {
            Map<String,List<Specialities>> result = new HashMap<>();
            List<Specialities> listSpecialities = specialityService.getListSpecialitiesByName(specialities.getTranslation());
            if (listSpecialities != null){
                result.put("specialities", listSpecialities);
                return new ResponseEntity<Map<String,List<Specialities>>>(result, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
