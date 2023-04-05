package tapp.org.tapp;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TappApplicationTests {

    @Test
    void contextLoads() {
    }

    @Test
    void failingTestForBuildPipeline() {
        assertEquals(1,2,"need to fail to test workflow");
    }

}
