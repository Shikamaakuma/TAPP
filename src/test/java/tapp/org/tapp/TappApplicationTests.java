package tapp.org.tapp;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

@DataJpaTest
@ActiveProfiles("testpostgres")
class TappApplicationTests {

    @Test
    void contextLoads() {
    }

}
