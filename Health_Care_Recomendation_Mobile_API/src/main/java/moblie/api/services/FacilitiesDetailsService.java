package moblie.api.services;

import moblie.api.entities.Facilitiesdetails;
import moblie.api.repositories.FacilitiesDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FacilitiesDetailsService {

    @Autowired
    private FacilitiesDetailsRepository facilitiesDetailsRepository;

    public List<Facilitiesdetails> getFacilitiesBySpeciality(int specialityID){
        return facilitiesDetailsRepository.getFacilitiesBySpeciality(specialityID);
    }

    public List<Facilitiesdetails> getFacilitiesBySimptom(int symptomID){
        return facilitiesDetailsRepository.getFacilitiesBySymptom(symptomID);
    }
}
