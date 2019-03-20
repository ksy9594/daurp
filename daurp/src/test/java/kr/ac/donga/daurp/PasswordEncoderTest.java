package kr.ac.donga.daurp;

import org.junit.Test;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

public class PasswordEncoderTest {

    @Test
    public void test_encode() {
        PasswordEncoder passwordEncoder = new StandardPasswordEncoder();
        String result = passwordEncoder.encode("1");
        System.out.println(result);
    }
    @Test
    public void test_ShaEncode() {
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String result = null;
        result = encoder.encodePassword("1", result);
        System.out.println(result);
    }


    @Test
    public void test_match() {
        String pw = "98293e49c3ae2abb55927d2f9c9629bf62949bc534105c5dab6fbce77b967045f148ab918f2ec5f2";
        PasswordEncoder passwordEncoder = new StandardPasswordEncoder();
        boolean matches = passwordEncoder.matches("1", pw);
        System.out.println(matches);
    }
}
