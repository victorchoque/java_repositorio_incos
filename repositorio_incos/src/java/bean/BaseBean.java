/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;
import anotaciones.Columna;
import conexion.VariablesConexion;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Map;
import javax.annotation.PreDestroy;


import java.util.function.Function;
import java.lang.reflect.Field;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import pojo.UsuarioLogeado;
/**
 *
 * @author v3ct0r
 * @version 0.2.0
 */
abstract public class BaseBean {
    private Connection conexion;
    private VariablesConexion variables;
    private PreparedStatement prepararObtener;
    private PreparedStatement prepararListar;
    private PreparedStatement prepararUpdate;
    
    public BaseBean() throws SQLException{
        variables = new VariablesConexion();
        variables.inicioConexion();
        conexion = variables.getConnection();
    }
    @PreDestroy
    public void cerrandoConexion(){
        variables.cerrarConexion();              
    }
    
    public UsuarioLogeado obtenerUsuarioLogeado() {
        
        /*FacesContext facesContext = FacesContext.getCurrentInstance();
        
        HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);

        if (session != null && session.getAttribute(UsuarioLogeado.class.getName()) != null) {
            // El usuario está autenticado, retornamos el objeto UsuarioLogeado
            return (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
        } else {
            // El usuario no está autenticado
            return null;
        }/**/
//        FacesContext
//        FacesContext.getCurrentInstance().
//        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
//        HttpSession session = request.getSession(false);
//
//        if (session != null && session.getAttribute(UsuarioLogeado.class.getName()) != null) {
//            // El usuario está autenticado, retornamos el objeto UsuarioLogeado
//            return (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
//        } else {
//            // El usuario no está autenticado
//            return null;
//        }
return null;
    }
    
    interface ResultSetMapper<T> {
        T mapRow(ResultSet rs) throws SQLException;
    }

    public <T> T getTabla(String columnas, String condicion, Function<ResultSet, T> mapper) throws SQLException {
        T resultadoRetorna = null;
        String query = "SELECT " + columnas + " FROM tabla WHERE " + condicion;

        try (PreparedStatement statement = conexion.prepareStatement(query)) {
            ResultSet resultado = statement.executeQuery();
            if (resultado.next()) {
                resultadoRetorna = mapper.apply(resultado);
            }
        }
        return resultadoRetorna;
    }
    public <T> Map<String, Object> convertirObjetoAMap(T objeto, String... campos) {
        Map<String, Object> valores = new HashMap<>();
        Class<?> claseObjeto = objeto.getClass();
        for (String campo : campos) {
            try {
                Field field = claseObjeto.getDeclaredField(campo);
                field.setAccessible(true); // Permitir acceso a campos privados

                // Obtener el nombre de la columna en la base de datos
                String nombreColumna = campo;
                if (field.isAnnotationPresent(Columna.class)) {
                    Columna columna = field.getAnnotation(Columna.class);
                    nombreColumna = columna.value();
                }

                valores.put(nombreColumna, field.get(objeto));
            } catch (NoSuchFieldException | IllegalAccessException e) {
                e.printStackTrace();
                // Manejar excepciones si el campo no existe o no se puede acceder
            }
        }
        return valores;
    }
    
    protected void setearParametros(PreparedStatement statement,int startPos , Object ...parametros) throws SQLException{
        for (int i = 0, index= startPos; i < parametros.length; i++,index++) {
            if (parametros[i] instanceof BigDecimal) {
                statement.setBigDecimal(index, (BigDecimal) parametros[i]);
            }else if(parametros[i] instanceof Integer){
                statement.setInt(index, (Integer) parametros[i]);
            }else if(parametros[i] instanceof Long){
                statement.setLong(index, (Long) parametros[i]);
            }else if(parametros[i] instanceof String){
                statement.setString(index, (String) parametros[i]);
            }else if(parametros[i] instanceof byte[] ||parametros[i] instanceof Byte || parametros[i] instanceof Byte[] ){
                statement.setBytes(index, (byte[]) parametros[i]);
            }else{
                statement.setObject(index, parametros[i]);
            }

        }
    }
    /**
     * <pre>
     * {@code
     * List<Coche> coches      = tuArchivoBean.obtenerListado(Coche.class, "SELECT * FROM coche" );                              
     * List<Coche> cochesOtros = tuArchivoBean.obtenerListado(Coche.class, "SELECT * FROM coche WHERE id>? and other=?",5,"any");
     * for(Coche item: cocheOtros){ System.out.print(item.getNombre()); }
     * }
     * </pre>
     * @param <T>
     * @param clasePojo
     * @param consultaSQL
     * @param parametros Los parámetros de la consulta SQL.
     * @return 
     */
    public <T> List<T> obtenerListado(Class<T> clasePojo, String consultaSQL, Object ...parametros) throws Exception {
        List<T> lista = new ArrayList<>();
        try {
            
            PreparedStatement statement = conexion.prepareStatement(consultaSQL);
            setearParametros(statement, 1, parametros);
            /*for (int i = 0; i < parametros.length; i++) {
                if (parametros[i] instanceof BigDecimal) {
                    statement.setBigDecimal(i + 1, (BigDecimal) parametros[i]);
                }else if(parametros[i] instanceof Integer){
                    statement.setInt(i + 1, (Integer) parametros[i]);
                }else if(parametros[i] instanceof Long){
                    statement.setLong(i + 1, (Long) parametros[i]);
                }else if(parametros[i] instanceof Integer){
                    statement.setString(i + 1, (String) parametros[i]);
                }else if(parametros[i] instanceof Integer){
                    statement.setString(i + 1, (String) parametros[i]);
                }else{
                    statement.setObject(i + 1, parametros[i]);
                }
                
            }*/
            ResultSet resultSet = statement.executeQuery();
            ResultSetMetaData metaData = resultSet.getMetaData();
            int numColumnas = metaData.getColumnCount();
            while (resultSet.next()) {
                T objeto = clasePojo.getDeclaredConstructor().newInstance();
                for (int i = 1; i <= numColumnas; i++) {
                    String nombreColumna = metaData.getColumnName(i);
                    Field campo = null;
                    try {
                        campo = clasePojo.getDeclaredField(nombreColumna);
                        campo.setAccessible(true); // Permitir acceso a campos privados
                        Object valorColumna = null;
                        if (campo.getType() == int.class || campo.getType() == Integer.class) {
                            valorColumna = resultSet.getInt(i);
                        } else if (campo.getType() == long.class) {
                            valorColumna = resultSet.getLong(i);
                        } else if (campo.getType() == String.class) {
                            valorColumna = resultSet.getString(i);
                        } else if (campo.getType() == boolean.class || campo.getType() == Boolean.class) {
                            valorColumna = resultSet.getBoolean(i);
                        } else if (campo.getType() == BigDecimal.class) {
                            valorColumna = resultSet.getBigDecimal(i);
                        } else if (campo.getType() == Date.class) {
                            valorColumna = resultSet.getDate(i);
                        } else if (campo.getType() == byte[].class) {
                            valorColumna = resultSet.getBytes(i);
                        } 
                        
                        // Agregar otros tipos de datos según sea necesario
                        campo.set(objeto, valorColumna);
                    } catch (NoSuchFieldException e) {
                        // Ignorar columnas que no existen en el POJO
                    }
                }
                lista.add(objeto);
            }            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return lista;
    }
    
    /**
     * <pre>
     * {@code
     * Coche coche = tuArchivoBean.obtenerResultadoA(Coche.class, "SELECT * FROM coche LIMIT 1");
     * System.out.println("Coche obtenido: " + coche);
     * }
     * </pre>
     * <pre>
     * {@code
     * Coche coche = tuArchivoBean.obtenerResultadoA(Coche.class, "SELECT * FROM coche WHERE id=? LIMIT 1",variableForId);
     * System.out.println("Coche obtenido: " + coche);
     * }
     * </pre>
     * @param <T> 
     * @param clasePojo La clase del objeto que se espera obtener.
     * @param consultaSQL La consulta SQL que se utilizará para obtener el objeto.
     * @param parametros Los parámetros de la consulta SQL.
     * @return 
     */
    public <T> T obtenerResultadoA(Class<T> clasePojo, String consultaSQL, Object ...parametros) throws Exception {
        T objeto = null;
        try {            
            PreparedStatement statement = conexion.prepareStatement(consultaSQL);
            setearParametros(statement,1,parametros);
            
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                objeto = clasePojo.getDeclaredConstructor().newInstance();
                Field[] campos = clasePojo.getDeclaredFields();
                Map<String, Field> mapaCampos = new HashMap<>();
                for (Field campo : campos) {
                    mapaCampos.put(campo.getName(), campo);
                }
                ResultSetMetaData metaData = resultSet.getMetaData();
                int numColumnas = metaData.getColumnCount();
                for (int i = 1; i <= numColumnas; i++) {
                    String nombreColumna = metaData.getColumnName(i);
                    if (mapaCampos.containsKey(nombreColumna)) {
                        Field campo = mapaCampos.get(nombreColumna);
                        campo.setAccessible(true); // Permitir acceso a campos privados
                        Object valorColumna = null;
                        if (campo.getType() == int.class || campo.getType() == Integer.class) {
                            valorColumna = resultSet.getInt(nombreColumna);
                        } else if (campo.getType() == long.class || campo.getType() == Long.class) {
                            valorColumna = resultSet.getLong(nombreColumna);
                        } else if (campo.getType() == String.class) {
                            valorColumna = resultSet.getString(nombreColumna);
                        } else if (campo.getType() == BigDecimal.class) {
                            valorColumna = resultSet.getBigDecimal(nombreColumna);
                        } else if (campo.getType() == Date.class) {
                            //valorColumna = resultSet.getDate(nombreColumna);
                            valorColumna = resultSet.getDate( nombreColumna).toString();

                        } else if (campo.getType() == boolean.class || campo.getType() == Boolean.class) {
                            valorColumna = resultSet.getBoolean(nombreColumna);
                        } else if (campo.getType() == byte[].class) {
                            valorColumna = resultSet.getBytes(nombreColumna);
                        } 
                        
                        // Agregar otros tipos de datos según sea necesario
                        campo.set(objeto, valorColumna);
                    }
                }
            }            
        } catch (Exception e) {
            e.printStackTrace();
            throw  e;
        }
        return objeto;
    }
    public String insertarDatos(String tabla, Map<String, Object> valores) {
        PreparedStatement statement = null;
        String mensaje = "Error: No se pudo registrar los datos.";

        try {            
            StringBuilder query = new StringBuilder();
            query.append("INSERT INTO ").append(tabla).append("(");

            // Agregar los nombres de los campos a la consulta
            for (String campo : valores.keySet()) {
                query.append(campo).append(", ");
            }
            query.setLength(query.length() - 2); // Eliminar la última coma y espacio
            query.append(") VALUES (");

            // Agregar los marcadores de posición para los valores
            for (int i = 0; i < valores.size(); i++) {
                query.append("?, ");
            }
            query.setLength(query.length() - 2); // Eliminar la última coma y espacio
            query.append(")");

            statement = conexion.prepareStatement(query.toString());

            // Establecer los valores de los parámetros
            setearParametros(statement, 1, valores.values().toArray());
            /*int index = 1;
            for (Object valor : valores.values()) {
                if (valor instanceof Integer) {
                    statement.setInt(index, (Integer) valor);
                } else if (valor instanceof Long) {
                    statement.setLong(index, (Long) valor);
                } else if (valor instanceof String) {
                    statement.setString(index, (String) valor);
                } else if (valor instanceof BigDecimal) {
                    statement.setBigDecimal(index, (BigDecimal) valor);
                } else if (valor instanceof Date) {
                    statement.setDate(index, (Date) valor);
                }
                index++;
            }/* */

            // Ejecutar la consulta
            int nroRegistro = statement.executeUpdate();

            if (nroRegistro > 0) {
                mensaje = "Datos registrados correctamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
        }

        return mensaje;
    }
    public <T> String insertarDatos(String tabla, Class<T> clasePojo ,String ...columnas){
        Map<String, Object> valores = convertirObjetoAMap(clasePojo,columnas);
        return insertarDatos(tabla,valores);
    }    
    public String actualizarDatos(String tabla, Map<String, Object> valores, String where,Object ...columnas) {
        PreparedStatement statement;
        String mensaje = "Error: No se pudo actualizar los datos.";
        try {
            
            StringBuilder query = new StringBuilder();
            query.append("UPDATE ").append(tabla).append(" SET ");

            // Agregar los nombres de los campos y los marcadores de posición para los valores
            for (String campo : valores.keySet()) {
                query.append(campo).append(" = ?, ");
            }
            query.setLength(query.length() - 2); // Eliminar la última coma y espacio
            query.append(" WHERE " +where);

            statement = conexion.prepareStatement(query.toString());

            // Establecer los valores de los parámetros
            int index = 1;
            for (Object valor : valores.values()) {
                /*if (valor instanceof Integer) {
                    statement.setInt(index, (Integer) valor);
                } else if (valor instanceof Long) {
                    statement.setLong(index, (Long) valor);
                } else if (valor instanceof String) {
                    statement.setString(index, (String) valor);
                } else if (valor instanceof BigDecimal) {
                    statement.setBigDecimal(index, (BigDecimal) valor);
                } else if (valor instanceof Date) {
                    statement.setDate(index, (Date) valor);
                }/* */
                index++;
            }
            setearParametros(statement,1,valores.values().toArray());
            setearParametros(statement,index,columnas);
            // Establecer el valor del parámetro para la condición WHERE
            

            // Ejecutar la consulta
            int nroActualizaciones = statement.executeUpdate();

            if (nroActualizaciones > 0) {
                mensaje = "Datos actualizados correctamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
        }

        return mensaje;
    }
    /**
     * @deprecated No usar este método, usar {@link #actualizarDatos(String, Map, String, Object...)} en su lugar.
     * @param tabla
     * @param where
     * @param valores
     * @return
     */
    public String actualizarDatos(String tabla, String where, Map<String, Object> valores) {

        PreparedStatement statement = null;
        String mensaje = "Error: No se pudo actualizar los datos.";

        try {
            
            StringBuilder query = new StringBuilder();
            query.append("UPDATE ").append(tabla).append(" SET ");

            // Agregar los nombres de los campos y los marcadores de posición para los valores
            for (String campo : valores.keySet()) {
                query.append(campo).append(" = ?, ");
            }
            query.setLength(query.length() - 2); // Eliminar la última coma y espacio
            query.append(" WHERE " +where);

            statement = conexion.prepareStatement(query.toString());

            // Establecer los valores de los parámetros
            int index = 1;
            for (Object valor : valores.values()) {
                if (valor instanceof Integer) {
                    statement.setInt(index, (Integer) valor);
                } else if (valor instanceof Long) {
                    statement.setLong(index, (Long) valor);
                } else if (valor instanceof String) {
                    statement.setString(index, (String) valor);
                } else if (valor instanceof BigDecimal) {
                    statement.setBigDecimal(index, (BigDecimal) valor);
                } else if (valor instanceof Date) {
                    statement.setDate(index, (Date) valor);
                }
                index++;
            }
            // Establecer el valor del parámetro para la condición WHERE
            

            // Ejecutar la consulta
            int nroActualizaciones = statement.executeUpdate();

            if (nroActualizaciones > 0) {
                mensaje = "Datos actualizados correctamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
        }

        return mensaje;
    }
}
