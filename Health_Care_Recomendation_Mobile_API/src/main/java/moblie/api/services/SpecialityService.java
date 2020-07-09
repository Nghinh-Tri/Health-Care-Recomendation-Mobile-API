package moblie.api.services;

import moblie.api.entities.Specialities;
import moblie.api.entities.Symptoms;
import moblie.api.repositories.SpecialitiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialityService {

    @Autowired
    private SpecialitiesRepository specialitiesRepository;

    public List<Specialities> listAll(){
        return specialitiesRepository.findAll();
    }

    public List<Specialities> getListSpecialitiesByName(String speciality){
        return specialitiesRepository.getListSpecialitiesByName(speciality);
    }
}
