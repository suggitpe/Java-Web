package org.suggs.webapps.buildpipeline.cucumber;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.suggs.webapps.buildpipeline.dsl.DSL;
import org.suggs.webapps.buildpipeline.pages.impl.SeleniumPages;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class BuildPipelineStepdefs extends DSL {

    public BuildPipelineStepdefs() {
        super(new SeleniumPages());
    }

    @When("^I open the application$")
    public void I_open_the_application() throws Throwable {
        openApplication();
    }

    @Then("^the application is available$")
    public void thenApplicationIsDisplayedtToTheUser() {
        assertThat(applicationIsOpen(), is(true));
    }
}
