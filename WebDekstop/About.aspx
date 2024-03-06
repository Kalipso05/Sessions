<%@ Page Async="true" Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebDekstop.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Font-Bold="true" Font-Names="Cascadia code" Font-Size="Small">
        <asp:Label ID="Label1" runat="server" Text="Госпитализация пациента" BackColor="DarkOrange" ForeColor="White"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="LastName" DataValueField="ID" Width="250" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbModel %>" SelectCommand="SELECT [LastName], [FirstName], [ID] FROM [Patient]"></asp:SqlDataSource>
        <br />
        <br />
        Имя&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Номер полиса&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Код госпитализации<br />
        <asp:TextBox ID="txbFirstName" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseNumber" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbCodeHospitalization" runat="server" Width="250"></asp:TextBox>
        <br />
        Фамилия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Срок действия полиса&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Цель госпитализации<br />
        <asp:TextBox ID="txbLastName" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuransePolicyExpiration" TextMode="Date" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbPurpose" runat="server" Width="250"></asp:TextBox>
        <br />
        Отчество&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Страховая компания&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Отделение для госпитализации<br />
        <asp:TextBox ID="txbMiddleName" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseCompany" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbDepartament" runat="server" Width="250"></asp:TextBox>
        <br />
        Серия паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Диагноз пациента&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Условия госпитализации<br />
        <asp:TextBox ID="txbPassportSeries" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbDiagnos" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" Width="250" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem Value="1">Платно</asp:ListItem>
            <asp:ListItem Value="2">Бесплатно</asp:ListItem>
        </asp:DropDownList>
        <br />
        Номер паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Дата госпитализации&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Доп.информация<br />
        <asp:TextBox ID="txbPassportNumber" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbDateOfHospitalization" runat="server" TextMode="Date" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbAdditionalInformation" runat="server" Width="250px" Wrap="true"></asp:TextBox>
        <br />
        Место работы&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Время госпиталиации&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Сроки госпитализации(в днях)<br />
        <asp:TextBox ID="txbWorkPlace" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbTimeOfHospitalization" TextMode="Time" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbTerm" runat="server" Width="250px" Wrap="true"></asp:TextBox>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buttonAddPatient" runat="server" Text="Добавить" Width="250" BackColor="Black" ForeColor="White" OnClick="buttonAddHospitalization_Click"/>
        <br />
        <br />
        <br />
    </asp:Panel>
</asp:Content>
