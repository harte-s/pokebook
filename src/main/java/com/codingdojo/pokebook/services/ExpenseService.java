package com.codingdojo.pokebook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.pokebook.models.Expense;
import com.codingdojo.pokebook.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	 // returns all
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
    // creates new expense
    public Expense createExpense(Expense e) {
        return expenseRepository.save(e);
    }
    // retrieves an expense by id
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    // update an expense
    public Expense updateExpense(long id, String name, String vendor, Double amount, String description) {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if(optionalExpense.isPresent()) {
    		Expense expense = optionalExpense.get();
    		
    		expense.setName(name);
    		expense.setVendor(vendor);
    		expense.setAmount(amount);
    		expense.setDescription(description);
    		
    		expenseRepository.save(expense);
    		
    		return expense;
    	} else {
    		return null;
    	}
    }
    
    //delete an expense
    public void deleteExpense(long id) {
    	expenseRepository.deleteById(id);
    }
    
}