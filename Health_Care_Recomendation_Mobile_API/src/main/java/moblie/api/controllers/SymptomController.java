package moblie.api.controllers;

import moblie.api.entities.Symptoms;
import moblie.api.services.SymptomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class SymptomController {
    @Autowired
    private SymptomService symptomService;

    @GetMapping("/symptoms")
    public List<Symptoms> listSymptom() {
        return symptomService.listAll();
    }

    @PostMapping("/symptoms")
    public ResponseEntity<?> searchSymptomsByName(@RequestBody Symptoms symptom) {
        try {
            List<Symptoms> result = symptomService.getListSymptomsByName(symptom.getTranslation());
            if (result != null)
                return new ResponseEntity<List<Symptoms>>(result, HttpStatus.OK);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
