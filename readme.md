# JDK 
## Versiones Funcionales
 es necesario tener instalado el jdk 11 para poder compilar y ejecutar el proyecto, para ello se puede descargar desde el siguiente enlace:
### jdk 22
https://jdk.java.net/22/
### jdk 11
https://jdk.java.net/archive/

# Glassfish
## Versiones Funcionales
 es necesario tener instalado el glassfish 5.1.0 que ya sugiere el netbeans para poder desplegar el proyecto

# MySQL
es necesario tener instalado el mysql 8.0.23 Maria Db para poder crear la base de datos y las tablas necesarias para el proyecto
## Archivos externos
require la libreria **mariadb-java-client-2.7.12** para poder conectar la base de datos con el proyecto
## Modelo en mysqlWorkbench
**repositorio_incos.mwb**

# Aplicacion
## Configurar la base de datos
modificar el archivo **repositorio_incos/src/java/conexion/VariablesConexion.java** con los datos de la base de datos

# Problemas Comunes, UTF 8 en la base de datos y formularios y visualizaciones

Los problemas con la codificación UTF-8 en JSP pueden ser frustrantes, pero son comunes cuando el servidor no está configurado adecuadamente para manejar caracteres multibyte como los de UTF-8. A continuación, se agrega algunas configuraciones para asegurarte de que JSP maneje correctamente UTF-8.

## Opcion 1, agregar a cada *request* o *response* de cada JSP
se agrega  o se fuerza adicionando

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
```jsp
<jsp:useBean id="tutorBean" scope="session"  class="bean.TutorBean"/>
<jsp:useBean id="estudianteBean" scope="session"  class="bean.EstudianteBean"/>
<jsp:useBean id="proyectosBean" scope="session"  class="bean.ProyectoBean"/>
<jsp:useBean id="reportesBean" scope="session"  class="bean.ReportesBean"/>

<%
    request.setCharacterEncoding("UTF-8");
    UsuarioLogeado usuario = (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
    String subtitulo = "Insertar proyectos";
    Proyecto proyecto = new Proyecto();
%>
```

## Opcion 2, Agregar un servlet global que realize ello automaticamente

Para asegurarte de que `request.setCharacterEncoding("UTF-8")` se aplique automáticamente a todas las solicitudes en tu aplicación web, puedes utilizar un filtro de servlet. Este filtro se aplicará a todas las solicitudes y establecerá la codificación de caracteres antes de que cualquier otro código en tu aplicación procese la solicitud.

### Crear un Filtro de Codificación de Caracteres

1. **Crear el filtro**:
   Crea una clase Java que implemente `javax.servlet.Filter`. En este filtro, establecerás la codificación de caracteres para todas las solicitudes entrantes.

   ```java
   import javax.servlet.Filter;
   import javax.servlet.FilterChain;
   import javax.servlet.FilterConfig;
   import javax.servlet.ServletException;
   import javax.servlet.ServletRequest;
   import javax.servlet.ServletResponse;
   import java.io.IOException;

   public class CharacterEncodingFilter implements Filter {

       @Override
       public void init(FilterConfig filterConfig) throws ServletException {
           // No se necesita inicialización adicional
       }

       @Override
       public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
               throws IOException, ServletException {
           request.setCharacterEncoding("UTF-8");
           response.setCharacterEncoding("UTF-8");
           chain.doFilter(request, response);
       }

       @Override
       public void destroy() {
           // No se necesita destrucción adicional
       }
   }
   ```


### Alternativa: Usar Filtros Preexistentes

Si estás usando un framework como Spring, podrías utilizar un filtro preexistente, como `CharacterEncodingFilter`, que ya está disponible en el framework. Sin embargo, si estás trabajando con JSP puro sin frameworks adicionales, el método anterior es adecuado.

### Resumen
Al implementar un filtro de codificación de caracteres, puedes garantizar que todas las solicitudes en tu aplicación JSP se manejen con la codificación UTF-8 de manera uniforme, sin tener que establecer manualmente la codificación en cada página JSP o servlet.