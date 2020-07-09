package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Facilitiesdetails {
    @Id
    private int facilitiesdetails_id;
    private int facility_id;
    private int speciality_id;
    private int symptom_id;

    public Facilitiesdetails() {
    }

    public int getFacilitiesdetails_id() {
        return facilitiesdetails_id;
    }

    public void setFacilitiesdetails_id(int facilitiesdetails_id) {
        this.facilitiesdetails_id = facilitiesdetails_id;
    }

    public int getFacility_id() {
        return facility_id;
    }

    public void setFacility_id(int facility_id) {
        this.facility_id = facility_id;
    }

    public int getSpeciality_id() {
        return speciality_id;
    }

    public void setSpeciality_id(int speciality_id) {
        this.speciality_id = speciality_id;
    }

    public int getSymptom_id() { return symptom_id; }

    public void setSymptom_id(int symptom_id) { this.symptom_id = symptom_id; }
}
