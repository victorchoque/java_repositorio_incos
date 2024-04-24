/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.SQLException;
import java.util.List;

import pojo.ReporteProyectoAuditorias;

/**
 *
 * @author v3ct0r
 */
public class ReportesBean extends BaseBean {
    public ReportesBean() throws SQLException{
        super();
    }
    public List<ReporteProyectoAuditorias> reporteProyectoAuditorias (int idProyecto) throws Exception{
        return super.obtenerListado(ReporteProyectoAuditorias.class, 
                "SELECT * FROM reporte_proyecto_auditorias WHERE proyectos_id = ?",idProyecto);
    }
}
