package osfm;

import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Musician {
     private int dni;
    private String name;
    private String birth;
    private String startDate;
    private String email;
    private String emailIns;
    private String tlf;
    private String cargo;
    private String city;
    private String urbanization;
    
    /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    /**
     * @return the dni
     */
    public int getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(int dni) {
        this.dni = dni;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the birth
     */
    public String getBirth() {
        return birth;
    }

    /**
     * @param birth the birth to set
     */
    public void setBirth(String birth) {
        this.birth = birth;
    }

    /**
     * @return the startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the emailIns
     */
    public String getEmailIns() {
        return emailIns;
    }

    /**
     * @param emailIns the emailIns to set
     */
    public void setEmailIns(String emailIns) {
        this.emailIns = emailIns;
    }

    /**
     * @return the tlf
     */
    public String getTlf() {
        return tlf;
    }

    /**
     * @param tlf the tlf to set
     */
    public void setTlf(String tlf) {
        this.tlf = tlf;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the urbanization
     */
    public String getUrbanization() {
        return urbanization;
    }

    /**
     * @param urbanization the urbanization to set
     */
    public void setUrbanization(String urbanization) {
        this.urbanization = urbanization;
    }
    
        public void showMusicians(JTable MusicianTable){
        ConnectionDB conex = new ConnectionDB();
        DefaultTableModel model = new DefaultTableModel();
        String sql = "";
        model.addColumn("dni");
        model.addColumn("Nombre");
        model.addColumn("Fecha_Nac");
        model.addColumn("Fecha_Ing");
        model.addColumn("Correo_P");
        model.addColumn("Correo_Ins");
        model.addColumn("Tlf");
        model.addColumn("Cargo");
        model.addColumn("Ciudad");
        model.addColumn("Urbanización");
        
        MusicianTable.setModel(model);
        sql = "SELECT * FROM \"OSFM\".musico";
        
        String[] data = new String[10];
        Statement st;
        try {
            st = conex.initConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()){
                data[0] = rs.getString(1);
                data[1] = rs.getString(2);
                data[2] = rs.getString(3);
                data[3] = rs.getString(4);
                data[4] = rs.getString(5);
                data[5] = rs.getString(6);
                data[6] = rs.getString(7);
                data[7] = rs.getString(8);
                data[8] = rs.getString(9);
                data[9] = rs.getString(10);
                model.addRow(data);
            }
            MusicianTable.setModel(model);
        } catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al realizar la consulta SQL");
        }
    }
}
