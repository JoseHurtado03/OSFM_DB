/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package osfm;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author hvjos
 */
public class Function {
    
    public java.sql.Date convertToDate(String dateStr) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsedDate = format.parse(dateStr);
            return new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
