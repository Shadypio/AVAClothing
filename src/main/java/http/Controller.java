/**
 *
 * DA' MOLTI ERRORI
 */


/*package http;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.io.File;

public abstract class Controller extends HttpServlet {

    @Resource(name = "jdbc/AvaBase")
    protected static DataSource source;

    protected String getPath(HttpServletRequest req) {
        return req.getPathInfo() != null ? req.getPathInfo() : "/";
    }

    protected String getPath(HttpServletRequest req) {
        String basePath = getServletContext().getInitParameter("basePath");
        String engine = getServletContext().getInitParameter("engine");
        return basePath +viewPath + engine;
    }

    protected String back(HttpServletRequest request){
        return request.getServletPath() + request.getPathInfo();
    }

    protected void validate(RequestValidator validator) throws InvalidRequestException {
        if(validator.hasErrors()){
            throw new InvalidRequestException("Validation Error", validator.getErrors());
        }
    }

    protected String getUploadPath(){
        return System.getenv("CATALINA_HOME") + File.separator + "webapps" + File.separator + "Clothing" +
                File.separator + "uploads" + File.separator;
    }
}*/
