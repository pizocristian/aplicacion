/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Modelo.Persona;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author cristian
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "validar")
    public Persona validar(@WebParam(name = "dni") String dni, @WebParam(name = "pass") String pass, @WebParam(name = "priviligio") String priviligio) {
        //TODO write your implementation code here:
        return null;
    }
}
