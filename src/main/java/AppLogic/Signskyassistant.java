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
        Greeting greeting;

        resp.setIntHeader("Refresh", 5);
        resp.setContentType("text/html");

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();  // Find out who the user is.

        String guestbookName = req.getParameter("guestbookName");
        String content = req.getParameter("content");
        if (user != null) {
            greeting = new Greeting(guestbookName, content, user.getUserId(), user.getEmail());
        } else {
            greeting = new Greeting(guestbookName, content);
        }

        // Use Objectify to save the greeting and now() is used to make the call synchronously as we
        // will immediately get a new page using redirect and we want the data to be present.
        ObjectifyService.ofy().save().entity(greeting).now();

        resp.sendRedirect("/skyassistant.jsp?guestbookName=" + guestbookName);
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performTask(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        performTask(request, response);
    }
}
