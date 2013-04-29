package org.suggs.sandbox.jaxrs.helloworld;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/hello")
public class Hello {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String sayHelloInPlainText() {
        return "Hello World!";
    }

    @GET
    @Produces(MediaType.TEXT_XML)
    public String sayHelloInXml() {
        return "<?xml version=\"1.0\"?>"
                + "<hello>Hello World!</hello>";
    }

    @GET
    @Produces(MediaType.TEXT_HTML)
    public String sayHelloInHtml() {
        return "<html>" +
                "<title>hello World</title>" +
                "<body><h1>Hello World!!!!</h1></body>" +
                "</html>";
    }

}
