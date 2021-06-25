package http;

import java.util.List;

public class InvalidRequestException extends Exception {
    
    private final List<String> errors;
    private final int errorCode;

    public InvalidRequestException(String message, List<String> errors, int errorCode){
        super(message);
        this.errors = errors;
        this.errorCode = errorCode;
    }

    public InvalidRequestException(String message, List<String> errors){
        super(message);
        this.errors = errors;
        this.errorCode = 404;
    }

    /*public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, IOException {
        switch(errorCode){
            case HttpServletResponse.SC_BAD_REQUEST:
                request.setAttribute("alert", new Alert(errors, "danger"));
                String backPath = (String) request.getAttribute("back");
                response.setStatus(errorCode);
                request.getRequestDispatcher(backPath).forward(request, response);
                break;
            default:
                response.sendError(errorCode, errors.get(0));
        }
    }*/

    public List<String> getErrors() {
        return errors;
    }
}
