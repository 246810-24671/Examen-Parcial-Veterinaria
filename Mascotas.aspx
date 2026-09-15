<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="VeterinariaPawCare.Mascotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Veterinaria PawCare</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet" />


    <style>

        body {
            background-color: #eef4f1;
            font-family: Arial, sans-serif;
        }

        .titulo {
            color: #198754;
            font-weight: bold;
        }

        .contenedor {
            background-color: white;
            border: 1px solid #dddddd;
            border-radius: 10px;
            padding: 20px;
        }

        .subtitulo {
            color: #333333;
            font-weight: bold;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .btn-registrar {
            background-color: #198754;
            color: white;
            border: none;
        }

        .btn-registrar:hover {
            background-color: #157347;
            color: white;
        }

        .tabla-mascotas th {
            background-color: #198754;
            color: white;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container mt-4 mb-4">
            <h1 class="text-center titulo mb-4">
                Veterinaria PawCare
            </h1>

            <div class="row g-4">
                <div class="col-12 col-lg-5">
                    <div class="contenedor shadow-sm">
                        <h4 class="subtitulo">
                            Registrar Mascota
                        </h4>

                        <div class="mb-3">
                            <label>
                                Nombre de la mascota
                            </label>
                            <asp:TextBox
                                ID="txtNombreMascota"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvNombreMascota"
                                runat="server"
                                ControlToValidate="txtNombreMascota"
                                ErrorMessage="El nombre de la mascota es obligatorio"
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="mb-3">
                            <label>
                                Nombre del dueño
                            </label>
                            <asp:TextBox
                                ID="txtNombreDueno"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvNombreDueno"
                                runat="server"
                                ControlToValidate="txtNombreDueno"
                                ErrorMessage="El nombre del dueño es obligatorio"
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="mb-3">

                            <label>
                                Tipo
                            </label>
                            <asp:DropDownList
                                ID="ddlTipo"
                                runat="server"
                                CssClass="form-select">
                                <asp:ListItem Value="Perro">
                                    Perro
                                </asp:ListItem>
                                <asp:ListItem Value="Gato">
                                    Gato
                                </asp:ListItem>
                                <asp:ListItem Value="Otro">
                                    Otro
                                </asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label>
                                Edad
                            </label>

                            <asp:TextBox
                                ID="txtEdad"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                            <asp:RangeValidator
                                ID="rvEdad"
                                runat="server"
                                ControlToValidate="txtEdad"
                                MinimumValue="0"
                                MaximumValue="30"
                                Type="Integer"
                                ErrorMessage="La edad debe estar entre 0 y 30 años"
                                CssClass="text-danger">
                            </asp:RangeValidator>
                        </div>

                        <div class="mb-3">
                            <label>
                                Teléfono
                            </label>
                            <asp:TextBox
                                ID="txtTelefono"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                            <asp:RegularExpressionValidator
                                ID="revTelefono"
                                runat="server"
                                ControlToValidate="txtTelefono"
                                ValidationExpression="^\d{9}$"
                                ErrorMessage="El teléfono debe tener 9 dígitos"
                                CssClass="text-danger">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div class="mb-3">
                            <label>
                                Observaciones
                            </label>
                            <asp:TextBox
                                ID="txtObservaciones"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="3"
                                CssClass="form-control">
                            </asp:TextBox>
                        </div>

                        <asp:Button
                            ID="btnRegistrar"
                            runat="server"
                            Text="Registrar Mascota"
                            CssClass="btn btn-registrar w-100"
                            OnClick="btnRegistrar_Click" />
                    </div>
                </div>

                <!-- Datagridview -->

                <div class="col-12 col-lg-7">
                    <div class="contenedor shadow-sm">
                        <h4 class="subtitulo">
                            Mascotas Registradas
                        </h4>

                        <div class="table-responsive">
                            <asp:GridView
                                ID="gvMascotas"
                                runat="server"
                                AutoGenerateColumns="False"
                                CssClass="table table-bordered table-striped table-hover tabla-mascotas">

                                <Columns>
                                    <asp:BoundField
                                        DataField="Id"
                                        HeaderText="ID" />

                                    <asp:BoundField
                                        DataField="NombreMascota"
                                        HeaderText="Mascota" />

                                    <asp:BoundField
                                        DataField="NombreDueno"
                                        HeaderText="Dueño" />

                                    <asp:BoundField
                                        DataField="Tipo"
                                        HeaderText="Tipo" />

                                    <asp:BoundField
                                        DataField="Edad"
                                        HeaderText="Edad" />

                                    <asp:BoundField
                                        DataField="Telefono"
                                        HeaderText="Teléfono" />

                                    <asp:BoundField
                                        DataField="Observaciones"
                                        HeaderText="Observaciones" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>