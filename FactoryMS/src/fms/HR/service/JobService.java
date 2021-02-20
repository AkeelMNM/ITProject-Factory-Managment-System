package fms.HR.service;

import java.util.ArrayList;

import com.fms.model.Job;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

public interface JobService {
	
	
			//Add Job for Job table
			public void addJob(Job Job);
			
			//Get particular Job from Job table
			public Job getJobByID(String JobID);

			//Get All Job from Job table
			public ArrayList<Job> getJob();
			
			//Update an Job in Job table
			public void updateJob(String JobID, Job Job);
			
			//Remove an Job from Job table
			public void removeJob(String JobID);
			
			//Get Job Names from Job table
			public ArrayList<String> getJobName();
			
}
