package moblie.api.services;

import moblie.api.entities.Specialitiesdetails;
import moblie.api.repositories.SpecialitiesDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialitiesDetailsService {
    @Autowired
    private SpecialitiesDetailsRepository specialitiesDetailsRepository;

    public List<Specialitiesdetails> getSpecialityBySymptom(int id){
        return specialitiesDetailsRepository.getSpecialitiesdetailsBySymptom(id);
    }
}
