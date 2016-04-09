/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AppLogic;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.googlecode.objectify.annotation.Entity;

import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import java.util.Date;

/**
 *
 * @author Administrator
 */
@Entity
public class myUser {

    @Index public Date date;
    @Id public Long id;
   
    @Index public String email;
    
    public String name;
    public String password;
    public String age;
    public String gender;
    public String country;

    public myUser() {
        date = new Date();
    }

    public myUser(String name, String password, String age, String email, String gender, String country) {

        //Key key = KeyFactory.createKey("myUser", id);
        //System.out.println("The Key Value: " + key);
 
        date = new Date();
        this.email = email;
        this.name = name;
        this.password = password;
        this.age = age;
        this.gender = gender;
        this.country=country;

    }
    
    public String getuserName()
    {
        return name;
    }

}
