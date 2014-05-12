package com.ratemycourse.services;


public interface RatingVerification {
	/**
	 * To verify user rating confirmation mail, recalculate and update the course rating details.
	 * @param key - unique key from the url.
	 * @return confirmation message.
	 */
	public String verifyAndUpdateRating(final String key);
}
