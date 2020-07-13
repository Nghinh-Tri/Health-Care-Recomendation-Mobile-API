package moblie.api.controllers;

import moblie.api.entities.Symptoms;
import moblie.api.services.SymptomService;
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
            Map<String, List<Symptoms>> result = new HashMap<>();
            List<Symptoms> listSymptom = symptomService.getListSymptomsByName(symptom.getTranslation());
            if (listSymptom != null){
                result.put("symptoms", listSymptom);
                return new ResponseEntity<Map<String, List<Symptoms>>>(result, HttpStatus.OK);                
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
