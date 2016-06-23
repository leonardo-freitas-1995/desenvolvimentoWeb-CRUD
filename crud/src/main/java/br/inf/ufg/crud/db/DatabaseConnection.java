package br.inf.ufg.crud.db;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leonardo
 */

public class DatabaseConnection {
    

    private final static String connection = "local";

    private DatabaseConnection(){}
    
    private static MongoDatabase localConnection() throws UnknownHostException{
       MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
       MongoDatabase database = mongoClient.getDatabase("webcrud");
       return database;
    }
    

    public static synchronized MongoDatabase create(){
        try{
            return localConnection();
        }
        catch (UnknownHostException e){
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
