





CREATE OR REPLACE PACKAGE pkClientes AS -- spec
    PROCEDURE pInsertarCliente
        (ivNombre VARCHAR2, ivCedula VARCHAR2, ivFechaNacimiento DATE, ivDireccion VARCHAR2 ,ivTelefono VARCHAR2);
    PROCEDURE pEliminarCliente(iCedulaCLiente VARCHAR2);
    PROCEDURE pActualizarCliente
        (ivCedulaBuscada VARCHAR2,ivNombre VARCHAR2, ivCedulaNueva VARCHAR2, ivFechaNacimiento DATE, ivDireccion VARCHAR2 ,ivTelefono VARCHAR2);
    FUNCTION fObtenerCliente(ivCedula);
END pkClientes;
/
CREATE OR REPLACE PACKAGE BODY pkClientes AS -- body
-- Insertar
PROCEDURE pInsertarCliente
        (ivNombre VARCHAR2, ivCedula VARCHAR2, ivFechaNacimiento DATE, ivDireccion VARCHAR2 ,ivTeléfono VARCHAR2)
    IS
    BEGIN
        INSERT INTO cliente
        VALUES (ivNombre, ivCedula, ivFechaNacimiento, ivDirección, ivTeléfono);
    END pInsertarCliente;
-- Eliminar
    PROCEDURE pEliminarCliente(iCedulaCliente IN NUMBER) IS
    BEGIN
        DELETE FROM cliente WHERE cedula = iCedulaCliente;
    END pEliminarCliente;
-- Actualizar
    PROCEDURE pActualizarCliente(ivCedulaBuscada VARCHAR2,ivNombre VARCHAR2, ivCedulaNueva VARCHAR2, ivFechaNacimiento DATE, ivDireccion VARCHAR2 ,ivTelefono VARCHAR2) IS
    BEGIN
        UPDATE cliente 
        SET nombre=ivNombre, cedula=ivCedula, fechaNacimiento=ivFechaNacimiento, direccion=ivDireccion, telefono=ivTelefono
        WHERE cedula=ivCedulaBuscada;
    END pActualizarCliente;
-- Obtener
    FUNCTION fObtenerCliente(ivCedula VARCHAR2) RETURN cliente%rowtype 
    IS ovCliente cliente%rowtype;
    BEGIN
        SELECT * into ovCliente
        FROM cliente
        WHERE cedula=ivCedula;
    END fObtenerCliente;
        
END pkClientes;
