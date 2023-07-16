/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package osfm;

import javax.swing.JOptionPane;

/**
 *
 * @author hvjos
 */
public class User {
    private String userName;
    private String password;

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    public User[] usersData(){
        User[] users = new User[10];
        return users;
    }
    
    public void insertUser(User user, User[] users) {
        int index = 0;
        while (index < 10) {
            if (users[index] != null) {
                index++;
            } else {
                users[index] = user;
            }
        }
    }
    
    public void registerUser(User[] users, String userName, String password){
        User user = new User(userName, password);
//        boolean aux = false;
        for (int i = 0; i < users.length; i++) {
            if (users[i].getUserName().equals(userName) ){
                JOptionPane.showMessageDialog(null, "Error, el nombre de usuario ya existe");
            }else{
                this.insertUser(user, users);
                JOptionPane.showMessageDialog(null, "Usuario registrado exitosamente");
                break;
            }
        }
    }
}
