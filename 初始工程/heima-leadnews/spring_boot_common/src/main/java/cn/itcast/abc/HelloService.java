package cn.itcast.abc;

import org.springframework.stereotype.Component;

@Component
public class HelloService {
    public void say() {
        System.out.println("hello");
    }
}
