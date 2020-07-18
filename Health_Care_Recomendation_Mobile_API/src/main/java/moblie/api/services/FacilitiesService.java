package moblie.api.services;

import moblie.api.entities.Facilities;
import moblie.api.repositories.FacilitiesRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacilitiesService {
    @Autowired
    private FacilitiesRepository facilitiesRepository;

    public Facilities getFacilityById(int id){
        return facilitiesRepository.getFacilitiesById(id);
    }

    public List<Facilities> getAllFacilities(){
        return facilitiesRepository.getFacilities();
    }
}
