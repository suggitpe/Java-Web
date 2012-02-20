// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.suggs.roo.pizzashop.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.suggs.roo.pizzashop.domain.PizzaDataOnDemand;

privileged aspect PizzaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PizzaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PizzaIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: PizzaIntegrationTest: @Transactional;
    
    @Autowired
    private PizzaDataOnDemand PizzaIntegrationTest.dod;
    
    @Test
    public void PizzaIntegrationTest.testCountPizzas() {
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = org.suggs.roo.pizzashop.domain.Pizza.countPizzas();
        org.junit.Assert.assertTrue("Counter for 'Pizza' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PizzaIntegrationTest.testFindPizza() {
        org.suggs.roo.pizzashop.domain.Pizza obj = dod.getRandomPizza();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = org.suggs.roo.pizzashop.domain.Pizza.findPizza(id);
        org.junit.Assert.assertNotNull("Find method for 'Pizza' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Pizza' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PizzaIntegrationTest.testFindAllPizzas() {
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = org.suggs.roo.pizzashop.domain.Pizza.countPizzas();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Pizza', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.suggs.roo.pizzashop.domain.Pizza> result = org.suggs.roo.pizzashop.domain.Pizza.findAllPizzas();
        org.junit.Assert.assertNotNull("Find all method for 'Pizza' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Pizza' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PizzaIntegrationTest.testFindPizzaEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = org.suggs.roo.pizzashop.domain.Pizza.countPizzas();
        if (count > 20) count = 20;
        java.util.List<org.suggs.roo.pizzashop.domain.Pizza> result = org.suggs.roo.pizzashop.domain.Pizza.findPizzaEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Pizza' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Pizza' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PizzaIntegrationTest.testFlush() {
        org.suggs.roo.pizzashop.domain.Pizza obj = dod.getRandomPizza();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = org.suggs.roo.pizzashop.domain.Pizza.findPizza(id);
        org.junit.Assert.assertNotNull("Find method for 'Pizza' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPizza(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Pizza' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PizzaIntegrationTest.testMerge() {
        org.suggs.roo.pizzashop.domain.Pizza obj = dod.getRandomPizza();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = org.suggs.roo.pizzashop.domain.Pizza.findPizza(id);
        boolean modified =  dod.modifyPizza(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.suggs.roo.pizzashop.domain.Pizza merged = (org.suggs.roo.pizzashop.domain.Pizza) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Pizza' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PizzaIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        org.suggs.roo.pizzashop.domain.Pizza obj = dod.getNewTransientPizza(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Pizza' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Pizza' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PizzaIntegrationTest.testRemove() {
        org.suggs.roo.pizzashop.domain.Pizza obj = dod.getRandomPizza();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = org.suggs.roo.pizzashop.domain.Pizza.findPizza(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Pizza' with identifier '" + id + "'", org.suggs.roo.pizzashop.domain.Pizza.findPizza(id));
    }
    
}
