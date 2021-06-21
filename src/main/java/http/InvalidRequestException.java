package http;

import java.util.List;

public class InvalidRequestException extends Exception {
    
    public InvalidRequestException(){
        super();
    }

    public InvalidRequestException(String errore_autenticazione, List<String> non_sei_autenticato, int scUnauthorized) {
    }
}
