package com.students.model;

import java.util.Collection;
import java.util.Map;

import org.bson.types.ObjectId;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

public class StudentModel {
	private static final long serialVersionUID = 9055360711881196012L;

	String result = "failure";
	MongodbConnectionClass dbConnClass = null;
	DBCollection coll = null;

	public String createStudent(String studentnumber, String gender,
			String birthdate, String disability, String firstname,
			String lastname, String email) {
		try {
			dbConnClass = new MongodbConnectionClass();
			coll = dbConnClass.dbConnection();
			BasicDBObject doc = new BasicDBObject();
			doc.put("studentNumber", studentnumber);
			doc.put("gender", gender);
			doc.put("birthDate", birthdate);
			doc.put("disability", disability);
			doc.put("firstName", firstname);
			doc.put("lastName", lastname);
			doc.put("email", email);

			coll.insert(doc);

			result = "success";
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return result;
	}

	public DBCollection showStudents() {
		try {
			dbConnClass = new MongodbConnectionClass();
			coll = dbConnClass.dbConnection();
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return coll;
	}

	public String deleteStudent(String id) {
		try {
			dbConnClass = new MongodbConnectionClass();
			coll = dbConnClass.dbConnection();

			coll.remove(new BasicDBObject("_id", new ObjectId(id)));
			result = "success";
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return result;
	}

	public Collection editStudent(String id) {
		Collection resultValues = null;
		try {
			dbConnClass = new MongodbConnectionClass();
			coll = dbConnClass.dbConnection();
			BasicDBObject query = new BasicDBObject();
			query.put("_id", new ObjectId(id));
			DBObject dbObj = coll.findOne(query);
			Map resultElementMap = dbObj.toMap();
			resultValues = resultElementMap.values();
			System.out.println(resultValues);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return resultValues;
	}

	public String updateStudent(String objId, String studentnumber,
			String gender, String birthdate, String disability,
			String firstname, String lastname, String email) {
		try {
			dbConnClass = new MongodbConnectionClass();
			coll = dbConnClass.dbConnection();
			BasicDBObject doc = new BasicDBObject();
			doc.put("studentNumber", studentnumber);
			doc.put("gender", gender);
			doc.put("birthDate", birthdate);
			doc.put("disability", disability);
			doc.put("firstName", firstname);
			doc.put("lastName", lastname);
			doc.put("email", email);

			BasicDBObject searchQuery = new BasicDBObject().append("_id",
					new ObjectId(objId));
			coll.update(searchQuery, doc);
			result = "success";
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return result;
	}
}
