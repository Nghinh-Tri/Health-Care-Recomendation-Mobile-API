package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Specialitiesdetails {
    @Id
    private int id;
    private int speciality_id;
    private int symptom_id;
    private int status;

    public Specialitiesdetails() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSpeciality_id() {
        return speciality_id;
    }

    public void setSpeciality_id(int speciality_id) {
        this.speciality_id = speciality_id;
    }

    public int getSymptom_id() {
        return symptom_id;
    }

    public void setSymptom_id(int symptom_id) {
        this.symptom_id = symptom_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
