package fms.Inventory.service;

import java.util.ArrayList;

import com.fms.model.Tea_Grades;

public interface Tea_Grades_Service {

	//View All Tea Grade from TGP 
	public ArrayList<Tea_Grades> getAllTeaGrades();
	
	//Get Tea grade name
	public String getTeaGradeName(String TeaGradeID);
	
	
}
