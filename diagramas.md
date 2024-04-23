# Leer este Documento
Para Leer este documento se necesitan VSCODE con los siguientes plugins
- bierner.markdown-mermaid
- bpruitt-goddard.mermaid-markdown-syntax-highlighting

para *plantuml* solo es necesario las URL
# Diagrama de casos de USO
https://www.plantuml.com/plantuml/png/POvDJW9148NtVOeNzYmKreOHzne81wXqbsF7cIbIFmjZlBipIAGJTg-hlwhlxSn9FSOX3VpkS87M_iDHgdBsAbEYxA8uMP1M0HdYEkhAMATghbH4bmzAPygVr3EEyvX7mdS2mZYJCLRFOPaKRofVd5rijUpik-FhGqjruJnvpPHd-J_os287xXUje32eBS6tcvjsONyulIpm-KwzJJyf1TRhfskJYsn-WovnSulRlxZZgSGu_080

```plantuml
@startuml
left to right direction
actor Usuario as u
actor Administrador as a
package Sistema {
  usecase "Buscar Proyectos" as CASO1
  usecase "Autenticacion" as CASO2
  usecase "Registro de administradores" as CASO3
  usecase "CRUD de proyectos" as CASO4
}

u --> CASO1
CASO2 -- a
CASO3 -- a
CASO4 -- a
@enduml
```

# Diagrama de secuencias
## De lado del "Usuario" "Buscar Proyectos"
https://www.plantuml.com/plantuml/dpng/VP1HIiD048RVSueXZz9u016fqXOABKfRyKMGQNRKbSrEdDqjr5jv1Y_cR6ZJr0SX17Psld--sN68A34rhi0wii1ZI2YM0GEaecOVXHsKTodKQ5WkFq9RvhljeL2GZpRkeOouTGYjy9uq9tHDSUjU-iefR4BAoXkUqionKYIuhlfmk88LUKDYln1UMPhaEZT3kUKpaK45gfiXCFKxY-0uG8k23Ud8C0IUFQXmSWoZF5LiMrls8_pvvgAFgJJpJ3wBeCiQv3IXN9FJEbp0R7M_XATt4YfxN5Ue_k92aSMhc7usHCnADLjVMqFwmz1jVhRwCb68yZ-YegV7KoPahxnG5eNvPhhCr6A-tjnsxp5erlk7oUmmTfYn83tk4haT7PkACNcJ6lSB

```plantuml
@startuml
actor Usuario as u
control "Buscador.jsp" as buscador
entity "tabla proyectos" as tbl_proyectos
control "Descargar.jsp" as descargar
u <- buscador : Renderiza formulario de busqueda
u -> buscador : Envia los parametros de busqueda\n titulo ,descripcion,año
buscador --> tbl_proyectos: Realiza el\n "Select * FROM Where"
buscador <-- tbl_proyectos: retorna la lista de coincidencias
u <-- buscador : Muestra la lista de coincidencias
u --> descargar : selecciona el ITEM de LISTA para descargar el PDF
u <-- descargar : Le devuelve el PDF

@enduml
```
## De lado de "Administrador" "Autenticacion"

https://www.plantuml.com/plantuml/dpng/PO_FIWGn3CRlVOemdiS7a4NMWox2gg174SbEuz8raqYIWlhqpf-PWtefVCttww_PUg15xJbX5sfmbViYnSCm3maTC7KgOShGxFLOvFpa7yquu34baYZn1KtWWH6gLxIYFXNYmA_hHKBOj3C25_18aidADm8ntAZrbSSMP8Bzm-xsFit5jhtyzSX48YzSyqHCNS2RQTyinAPj_nEX9WWyf8mnd2JGeKys-YoXg-tvx6X4yZ9Oru_kAbf6O0Gdzw822ftgUw6_2ysIEnB74q6cPNGz2bnJsfBaslCF

```plantuml
@startuml
actor Administrador as a
control "Login.jsp" as login
entity "tabla usuarios" as tbl_usuarios
a <- login : Renderiza el Formulario de LOGIN
login --> tbl_usuarios : Realiza el "Select from"
login <-- tbl_usuarios : Retorna los datos en caso de exito
login -[#green]-> login : Guarda la session o cookie
a <- login : Retorna Mensaje de login Exitoso

@enduml
```


## De lado de "Administrador" "Registro de administradores"
https://www.plantuml.com/plantuml/dpng/TL3TQl904BtVfpZ4wtmFy26YO5foOOGelH4fOtOgAvlTCZkHjazV4agxIdjxViwPCyka93hqtb2dKR2olGikgP2D0aeWqyMW4ZsAPk1hd0J_Bkcr6Ddm3HaEwlGTXTB94oZFuJI9zUIVxt3p4u3oC1EsntA13FoF9nRtuZf2Sk248M2rtjHDlTktg_MsDOHvUUjeELWMzq5WZuSe_U19N8HbjDNZQDmQGdbVL8Mh8wn9Ongb4tUxmzoSk_Xjq5HF_gkyg9jTrUvHD_jjWTmzByi_xHeb43oXew3EaeLb29z7MKoeGs9HiZ6PQVnXTXRcSCo_aELiE2IwC2pdVFNcDAPep9A37Nh_2G00
```plantuml
@startuml
actor Administrador as a
control "NuevoAdmin.jsp" as nuevoAdmin
entity "tabla administradores" as tbl_administradores
nuevoAdmin -[#red]-> nuevoAdmin : Verifica si es un ADMINISTRADOR
a <- nuevoAdmin : Renderiza el Formulario de REGISTRO
a --> nuevoAdmin : Envia Datos de nuevo administrador

nuevoAdmin -> tbl_administradores : Realiza el "INSERT INTO" 
nuevoAdmin <-- tbl_administradores : Retorna la cantidad de registros Insertados

a <-[#green]- nuevoAdmin : Retorna Mensaje de nuevoAdmin Exitoso

@enduml
```
## De lado de "Administrador" "CRUD de proyectos"
https://www.plantuml.com/plantuml/dpng/bPFTRjim38NlzHI4TvqzG34KpPO4CD1sWPFjPXq6rc875R8KK7Inxkbd1Lu8HzvFBaESStp8Jxb9WYnzvmss4XcMjdF19M6qaG4Je6bZ48uUgjjXZbkEhpH8qzldTAYoOZfM-TewGIxruxmqV62Qqq_7Xe8uUOLAyD4Z77xFZr9vzDzE4pCj1eilRvZiryNrMMEuWi_4xicr2Ca19UW3B5TtzNszspVBrSUcIBhMBuq9k-XTwmJ18_Yi1akWWeTGxSXJAx3Xs5NdWUyMYoAn8OaSDD3W8DFgAWkMsFr4k9tzChRIewTa30wzzVZQFFTgNGm8jL071sGSPQSOexR9BOkykLi-XEchCWRpmcejLjv4xdgFx29OohfSxq_zr-758Qmm_nhKJoTlMRh4rX3wV3loK7tQhfRxTLNO_WPdupmceEomcEONkuAxdlBkq558-4p7fNuuYM16AWNLBLCw8daV9GROPYOj4pA4dbwYWYbUflvTjAjrxBuJZ15gLkaKgiulPLeuvv5ccJ9Lqp-H3j8BYDRtktMphxBhCg1rICIALFVw3w8t56pV-Ly0

```plantuml
@startuml
actor Administrador as a
control "ListaProyectos.jsp" as ListaProyectos
control "EditarProyectos.jsp" as EditarProyectos
control "CrearProyectos.jsp" as CrearProyectos
entity "tabla proyectos" as tbl_proyectos
ListaProyectos -[#red]-> ListaProyectos : Verifica si es un ADMINISTRADOR
ListaProyectos -> tbl_proyectos : Solicita la lista de proyectos \n"Select From"
ListaProyectos <-- tbl_proyectos : Retorna la lista
a <- ListaProyectos : Renderiza La lista de proyectos actuales

a -> EditarProyectos : Selecciona Item para Editar proyecto
EditarProyectos -[#red]> EditarProyectos : Verifica si es un\n Administrador

a <-- EditarProyectos : Retorna Formulario de Edicion
a -> EditarProyectos : Envia Datos de formulario
EditarProyectos -> tbl_proyectos : Realiza el "UPDATE"
EditarProyectos <-- tbl_proyectos : Retorna Filas editadas
a <-- EditarProyectos: Muestra mensaje de Exito 


a -> ListaProyectos : Presiona Boton Para crear nuevo proyecto
ListaProyectos -> CrearProyectos : Redirige a crear proyecto
CrearProyectos -[#red]> CrearProyectos : Verifica si es un\n Administrador

a <-- CrearProyectos : Retorna Formulario de Creacion
a -> CrearProyectos : Envia Datos de formulario
CrearProyectos -> tbl_proyectos : Realiza el "INSERT"
CrearProyectos <-- tbl_proyectos : Retorna Filas Insertadas
a <-- CrearProyectos: Muestra mensaje de Exito 

@enduml
```

## Ejemplo usando el plugin para MERMAID
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```