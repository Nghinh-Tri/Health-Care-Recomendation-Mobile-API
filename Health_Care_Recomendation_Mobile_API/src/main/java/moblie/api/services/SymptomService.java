package moblie.api.services;

import moblie.api.entities.Symptoms;
import moblie.api.repositories.SymptomsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SymptomService {

    @Autowired
    private SymptomsRepository symptomsRepository;

    public List<Symptoms> listAll(){
        return symptomsRepository.findAll();
    }

    public List<Symptoms> getListSymptomsByName(String symptom) { return symptomsRepository.getListSymptomsByName(symptom);}
}
