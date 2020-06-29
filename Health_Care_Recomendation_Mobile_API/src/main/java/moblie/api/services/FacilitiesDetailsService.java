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

    public List<Facilitiesdetails> getFacilitiesBySpecility(int id){
        return getFacilitiesBySpecility(id);
    }
}
