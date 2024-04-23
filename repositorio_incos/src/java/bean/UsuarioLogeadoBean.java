/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.SQLException;
import pojo.Administrativo;
import pojo.UsuarioLogeado;

/**
 *
 * @author v3ct0r
 */
public class UsuarioLogeadoBean extends BaseBean {
    public UsuarioLogeadoBean() throws SQLException{
        super();
    }
    public UsuarioLogeado existe(String user,String pass){
        UsuarioLogeado encontrado = new UsuarioLogeado(0,"anonimo","Visitante");
        try{
            Administrativo administrativoEncontrado = super.obtenerResultadoA(
                    Administrativo.class,
            "SELECT * FROM administrativos WHERE `user`=? AND `pass`=? LIMIT 1"
                    , user,pass
            );
            if(administrativoEncontrado != null){
                encontrado.setId(administrativoEncontrado.getId());
                encontrado.setUser(administrativoEncontrado.getUser());
                encontrado.setName("Nombre de admnistravio");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return encontrado;
    }
    
}
