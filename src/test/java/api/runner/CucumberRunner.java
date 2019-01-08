package api.runner;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        format = {"pretty","html:target/site/cucumber-pretty"}
        ,glue={"api"} //the path of the step definition files
        ,features = "src/test/resources/api/features/"//the path of the feature files
        //,format= {"pretty","html:test-outout", "json:json_output/cucumber.json", "junit:junit_xml/cucumber.xml"} //to generate different types of reporting
        // ,monochrome = true //display the console output in a proper readable format
        //,strict = true //it will check if any step is not defined in step definition file
        //,dryRun = false //to check the mapping is proper between feature file and step def file
        //,tags = {"not @Incomplete"}
        //,plugin = {"io.qameta.allure", "pretty", "json:target/cucumber-report/report.json"}
        //, tags = ("not @Incomplete")
)


public class CucumberRunner extends AbstractTestNGCucumberTests {

}