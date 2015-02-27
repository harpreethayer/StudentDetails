package com.students.model;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class MongodbConnectionClass {
	
	public DBCollection dbConnection(){
		DBCollection coll = null;
		try{
			MongoClient mongoClient = new MongoClient("localhost", 27017 );		
			DB db = mongoClient.getDB("student_details");
			coll = db.getCollection("students");
			}catch(Exception e){
			System.out.println("Connection Problem");	
			}
			return coll;
	}

}
