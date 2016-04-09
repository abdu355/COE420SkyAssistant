package AppLogic;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;
import com.googlecode.objectify.Result;
import java.io.PrintWriter;
import javax.servlet.ServletException;

/**
 * Form Handling Servlet Most of the action for this sample is in
 * webapp/guestbook.jsp, which displays the {@link Greeting}'s. This servlet has
 * one method {@link #doPost(<#HttpServletRequest req#>,
 * <#HttpServletResponse resp#>)} which takes the form data and saves it.
 */
public class Signskyassistant extends HttpServlet {

    // Process the http POST of the form
    
    private void performTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        myUser user;

//        resp.setIntHeader("Refresh", 5);
//        resp.setContentType("text/html");

        //UserService userService = UserServiceFactory.getUserService();
        //User user = userService.getCurrentUser();  // Find out who the user is.

        String username = req.getParameter("Name");
        String password = req.getParameter("Password");
        String email = req.getParameter("Email");
        String gender = req.getParameter("Gender");
        String age = req.getParameter("Age");
        String country = req.getParameter("Country");
        
        user = new myUser(username,password,age,email,gender,country);
        

        // Use Objectify to save the user and now() is used to make the call synchronously as we
        // will immediately get a new page using redirect and we want the data to be present.
        ofy().save().entity(user).now();

        resp.sendRedirect("/homepage.jsp?Email=" + email);
        
    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        performTask(request, response);
//        //processError(request,response);
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        performTask(request, response);
    }
    
     private void processError(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        // Analyze the servlet exception
        Throwable throwable = (Throwable) request
                .getAttribute("javax.servlet.error.exception");
        Integer statusCode = (Integer) request
                .getAttribute("javax.servlet.error.status_code");
        String servletName = (String) request
                .getAttribute("javax.servlet.error.servlet_name");
        if (servletName == null) {
            servletName = "Unknown";
        }
        String requestUri = (String) request
                .getAttribute("javax.servlet.error.request_uri");
        if (requestUri == null) {
            requestUri = "Unknown";
        }
         
        // Set response content type
          response.setContentType("text/html");
      
          PrintWriter out = response.getWriter();
          out.write("<html><head><title>Exception/Error Details</title></head><body>");
          if(statusCode != 500){
              out.write("<h3>Error Details</h3>");
              out.write("<strong>Status Code</strong>:"+statusCode+"<br>");
              out.write("<strong>Requested URI</strong>:"+requestUri);
          }else{
              out.write("<h3>Exception Details</h3>");
              out.write("<ul><li>Servlet Name:"+servletName+"</li>");
              out.write("<li>Exception Name:"+throwable.getClass().getName()+"</li>");
              out.write("<li>Requested URI:"+requestUri+"</li>");
              out.write("<li>Exception Message:"+throwable.getMessage()+"</li>");
              out.write("</ul>");
          }
           
          out.write("<br><br>");
          out.write("<a href=\"index.html\">Home Page</a>");
          out.write("</body></html>");
    }
}
