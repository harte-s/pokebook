package com.codingdojo.pokebook.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.pokebook.models.Expense;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {


	 List<Expense> findAll();
	 

	 List<Expense> findByNameContaining(String search);
	 

	 Long countByVendor(String vendor);
	 

	 Long deleteById(long id);
	
}
