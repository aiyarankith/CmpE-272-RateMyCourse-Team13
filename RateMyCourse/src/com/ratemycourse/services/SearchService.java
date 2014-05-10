package com.ratemycourse.services;

import java.util.List;

import com.google.gson.JsonObject;

public interface SearchService {
	/**
	 * To handle search functionalities. 
	 * @param value input from user
	 * @return course list
	 */
	public List<JsonObject> search(final String value, final String category, final String level);
}