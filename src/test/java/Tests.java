import org.junit.*;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class Tests {

	private WebDriver driver;

	@Before
	public void setUp() {
		// Create a new instance of the html unit driver
		driver = new HtmlUnitDriver();

		//Navigate to desired web page
		driver.get("http://localhost:9090/Custom-eBooks");
	}

	@Test
	public void WebsiteUpTest() {

    String expectedTitle = "Custom eBooks";

    String actualTitle = driver.getTitle();
    Assert.assertEquals(expectedTitle, actualTitle);

  }

}
